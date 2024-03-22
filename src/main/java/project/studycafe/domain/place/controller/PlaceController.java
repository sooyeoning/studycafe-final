package project.studycafe.domain.place.controller;

import java.net.URI;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.place.controller.exception.NotExistsPlaceException;
import project.studycafe.domain.place.model.DuplicatePlaceCheckReq;
import project.studycafe.domain.place.model.GetAdminPlaceListReq;
import project.studycafe.domain.place.model.GetPlacesByAreaCodeRes;
import project.studycafe.domain.place.model.PlaceGetListReq;
import project.studycafe.domain.place.model.PlaceGetRes;
import project.studycafe.domain.place.model.PlacePostReq;
import project.studycafe.domain.place.model.Role;
import project.studycafe.domain.place.model.UpdatePlaceModel;
import project.studycafe.domain.place.service.PlaceServiceImpl;
import project.studycafe.domain.util.FileService;
import project.studycafe.domain.util.UpdatePlaceImgReq;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/place")
public class PlaceController {

	private final PlaceServiceImpl placeService;
	private final FileService fileService;

	@GetMapping("/{id}")
	public ResponseEntity<PlaceGetRes> getPlace(@PathVariable int id) {
		if(placeService.getPlace(id) == null) {
			throw new NotExistsPlaceException();
		}
		
		PlaceGetRes res = placeService.getPlace(id);
		
		return ResponseEntity.ok(res);
	}

	@GetMapping("/post")
	public String insertPlaceView(Model model) {
		PlacePostReq placePostReq = new PlacePostReq();
		model.addAttribute("placePostReq", placePostReq);
		return "place/placeInsertForm";
	}

	@PostMapping("/post")
	public String insertPlace(
			@Validated @ModelAttribute PlacePostReq placePostReq, 
			BindingResult bindingResult) throws Exception {

		if (bindingResult.hasErrors()) {
			log.info("bindingResult: {}", bindingResult);
			return "place/placeInsertForm";
		} 
		String name = placePostReq.getPlaceDTO().getName();
		
		DuplicatePlaceCheckReq req = new DuplicatePlaceCheckReq(name);
		if(placeService.checkPlaceNameExist(req.getName()) == 1){
			bindingResult.rejectValue("placeDTO.name", "duplicate.name", "이미 등록된 지점입니다.");
			return "place/placeInsertForm";
		}else {
			int placeId = placeService.insertPlace(placePostReq);
			log.info("placeId: {}"+placeId);
			if (placePostReq.getPlaceImageDTO().getFile().getSize() > 0) { // 첨부된 이미지가 있는 경우
				
				UpdatePlaceImgReq updateImgReq = new UpdatePlaceImgReq(placePostReq.getPlaceImageDTO().getFile(),placeId, Role.THUMBNAIL);
				fileService.uploadPlaceImage(updateImgReq);

			}

			//exception 처리
			if (placeId > 0 ) {
				return "redirect:/";
			} else {
				return "place/placeInsertForm";
			}

		}
		
	}

	// 관리자 페이지: 장소명, 지역코드로 검색가능 - 상세 정보 없는 데이터들도 모두 추출
	@PostMapping("/adminList")
	public ResponseEntity<List<PlaceGetRes>> getAdminPlaces(@RequestBody GetAdminPlaceListReq getAdminPlaceListReq) {
		
		List<PlaceGetRes> list = placeService.getAdminPlaces(getAdminPlaceListReq);
		return ResponseEntity.created(
				URI.create("/adminList/")
				).body(list);
	}
	
	// 사용자 페이지: 검색조건 추가 필요, 총갯수, 정렬 순서
	@PostMapping("/list")
	public ResponseEntity<List<PlaceGetRes>> getPlaces(@RequestBody PlaceGetListReq placeGetListReq) {
		List<PlaceGetRes> list = placeService.getPlaces(placeGetListReq);
		return ResponseEntity.ok(list);
	}

	@PostMapping("/update/info")
	public String updatePlace(
			@Validated @ModelAttribute UpdatePlaceModel updatePlaceModel,
			BindingResult bindingResult) throws Exception {
		
		if (bindingResult.hasErrors()) {
			log.info("bindingResult: {}", bindingResult);
			return "admin/updatePlaceForm";
		} else {
			
			//장소 정보 수정
			placeService.updatePlace(updatePlaceModel);
			
			//장소 모든 이미지 업로드
			fileService.updateAllPlaceImage(updatePlaceModel);
			
			return "admin/updatePlaceFormSuccess";

		}

	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<String> deletePlace(@PathVariable int id) {
		int result = placeService.deletePlace(id);
		String message = "삭제 실패했습니다.";
		if (result > 0) {
			message = "삭제 성공했습니다.";
		}
		return ResponseEntity.ok(message);
	}
	
	//티켓용: 선택한 지역의 선택가능한 지점 리스트 가져오기
	@GetMapping("/list")
	@ResponseBody
	public List<GetPlacesByAreaCodeRes> getPlaceListForTicket(@RequestParam String areaCode){
		List<GetPlacesByAreaCodeRes> result = placeService.getPlaceListForTicket(areaCode);
		return result;
	}
}
