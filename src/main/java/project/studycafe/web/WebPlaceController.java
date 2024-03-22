package project.studycafe.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import project.studycafe.domain.place.model.UpdatePlaceModel;
import project.studycafe.domain.place.service.PlaceServiceImpl;

@Controller
@RequestMapping("place")
@RequiredArgsConstructor
public class WebPlaceController {

	private final PlaceServiceImpl placeService;
	
	@GetMapping("/insertForm")
	public String getPlaceInsertForm() {
		return "place/placeInsertForm";
	}
	
	@GetMapping("/insertDetailForm")
	public String getPlaceInsertDetailForm(@RequestParam int placeId) {
		return "place/placeInsertDetailForm";
	}

	//view 출력
	@GetMapping
	public String getPlace(@RequestParam int placeId) {
		return "place/placeInfo";
	}
	
	@GetMapping("/updateForm")
	public String getPlaceUpdateForm(@RequestParam int id, Model model) {
		UpdatePlaceModel updatePlaceModel = placeService.getAdminPlaceById(id);
		model.addAttribute("updatePlaceModel", updatePlaceModel);
		return "admin/updatePlaceForm";
	}

	
}
