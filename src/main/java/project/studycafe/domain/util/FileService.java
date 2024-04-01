package project.studycafe.domain.util;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.place.model.Role;
import project.studycafe.domain.place.model.UpdatePlaceModel;

@Service
@RequiredArgsConstructor
@Slf4j
public class FileService {

	private final FileMapper fileMapper;
	private static String IMAGE_PATH = "/app/was/apache-tomcat-9.0.87/webapps/upload/";

	public void uploadUserImage(UserImageDTO userImageDTO) throws Exception {

		MultipartFile file = userImageDTO.getUserImage();
		
		// UUID 생성
		UUID uuid = UUID.randomUUID();

		String fullPath = IMAGE_PATH + uuid + "_" + file.getOriginalFilename();
		String originFileName = file.getOriginalFilename();
		String uploadFileName = uuid + "_" + file.getOriginalFilename();

		//지정한 경로에 파일 저장
		file.transferTo(new File(fullPath)); 

		int userId = userImageDTO.getUserId();
		UserImageEntity userImageEntity = 
				new UserImageEntity(fullPath, userId, originFileName, uploadFileName);
		
		log.info(userImageEntity.toString());

		// 기존 프로필 사진 없으면 insert, 있으면 update
		if (this.selectFile(userId) == null) {
			fileMapper.insertUserImage(userImageEntity);
		} else {
			fileMapper.updateUserImage(userImageEntity);
		}
	}

	// 기존 장소 대표이미지, 가격이미지 없으면 insert, 있으면 update
	public void uploadPlaceImage(UpdatePlaceImgReq req) throws Exception {
		PlaceImageEntity placeImageEntity = fileToEntity(req);

		if(this.selectPlaceImageById(req.getPlaceId()) == null) {
			fileMapper.insertPlaceImage(placeImageEntity);
		} else {
			this.updatePlaceImage(placeImageEntity);
		}
	}

	//상세이미지
	public void uploadPlaceDetailImage(UpdatePlaceImgReq req) throws Exception {
		PlaceImageEntity placeImageEntity = fileToEntity(req);
		fileMapper.insertPlaceImage(placeImageEntity);
	}
	
	public PlaceImageEntity fileToEntity(UpdatePlaceImgReq req) throws Exception {
		
		MultipartFile file = req.getFile();
		int placeId = req.getPlaceId();
		Role role = req.getRole();

		// UUID 생성
		UUID uuid = UUID.randomUUID();

		String fullPath = IMAGE_PATH + uuid + "_" + file.getOriginalFilename();
		String originFileName = file.getOriginalFilename();
		String uploadFileName = uuid + "_" + file.getOriginalFilename();

		file.transferTo(new File(fullPath));

		PlaceImageEntity placeImageEntity = 
				new PlaceImageEntity(fullPath, placeId, originFileName, uploadFileName, role);
	
		return placeImageEntity;
	}
	
	public String selectFile(int userId) {
		return fileMapper.selectFile(userId);
	}

	public List<String> selectPlaceImages(int placeId) {
		return fileMapper.selectPlaceImages(placeId);
	}

	public Integer selectPlaceImageById(int placeId) {
		return fileMapper.selectPlaceImageById(placeId);
	}
	
	public void updatePlaceImage(PlaceImageEntity placeImageEntity) throws Exception{
		fileMapper.updatePlaceImage(placeImageEntity);
	}
	
	@Transactional
	public void updateAllPlaceImage(UpdatePlaceModel updatePlaceModel) throws Exception {
		int placeId = updatePlaceModel.getId();

		// 대표이미지 업로드
		if (updatePlaceModel.getThumbnailImageDTO().getFile().getSize() > 0) {
			UpdatePlaceImgReq req = new UpdatePlaceImgReq(updatePlaceModel.getThumbnailImageDTO().getFile(),placeId, Role.THUMBNAIL);
			uploadPlaceImage(req);
		}

		// 상세이미지 업로드 - MultipartFile 빈 껍데기 존재함
		for (int i = 0; i < updatePlaceModel.getMultipartFiles().size(); i++){
			if (updatePlaceModel.getMultipartFiles().size() > 0) { // 파일 첨부되어있는지 확인
				Role normal = Role.NORMAL;
				UpdatePlaceImgReq req = new UpdatePlaceImgReq(updatePlaceModel.getMultipartFiles().get(i), placeId, normal);
				uploadPlaceDetailImage(req);
			}
		}

		// 가격표 이미지 업로드
		if (updatePlaceModel.getPriceImageDTO().getFile().getSize() > 0) {
			UpdatePlaceImgReq req = new UpdatePlaceImgReq(updatePlaceModel.getPriceImageDTO().getFile(),placeId, Role.PRICE);
			uploadPlaceImage(req);
		}
	}
}
