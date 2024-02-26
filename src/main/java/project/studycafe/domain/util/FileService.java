package project.studycafe.domain.util;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.place.model.Role;

@Service
@RequiredArgsConstructor
@Slf4j
public class FileService {

	private final FileMapper fileMapper;
	private static String IMAGE_PATH = "C:\\image_repo\\";

	public void uploadUserImage(UserImageDTO userImageDTO) throws Exception {

		MultipartFile file = userImageDTO.getUserImage();
		
		// UUID 생성
		UUID uuid = UUID.randomUUID();

		String fullPath = IMAGE_PATH + uuid + "_" + file.getOriginalFilename();
		String originFileName = file.getOriginalFilename();
		String uploadFileName = uuid + "_" + file.getOriginalFilename();

		file.transferTo(new File(fullPath));

		int userId = userImageDTO.getUserId();
		UserImageEntity userImageEntity = new UserImageEntity();
		userImageEntity.setFilePath(fullPath);
		userImageEntity.setOriginFileName(originFileName);
		userImageEntity.setUploadFileName(uploadFileName);
		userImageEntity.setUserId(userId);
		log.info(userImageEntity.toString());

		// log.info("this.selectFile(id): {}", this.selectFile(id));

		// 기존 프로필 사진 없으면 insert, 있으면 update
		if (this.selectFile(userId) == null) {
			fileMapper.insertUserImage(userImageEntity);
		} else {
			fileMapper.updateUserImage(userImageEntity);
		}
	}

	public void uploadPlaceImage(PlaceImageDTO dto, Role role) throws Exception {

		MultipartFile file = dto.getFile();
		int placeId = dto.getPlaceId();
		// UUID 생성
		UUID uuid = UUID.randomUUID();

		String fullPath = IMAGE_PATH + uuid + "_" + file.getOriginalFilename();
		String originFileName = file.getOriginalFilename();
		String uploadFileName = uuid + "_" + file.getOriginalFilename();

		file.transferTo(new File(fullPath));
		
		PlaceImageEntity placeImageEntity = new PlaceImageEntity();
		placeImageEntity.setFilePath(fullPath);
		placeImageEntity.setOriginFileName(originFileName);
		placeImageEntity.setUploadFileName(uploadFileName);
		placeImageEntity.setPlaceId(placeId);
		placeImageEntity.setRole(role);
		log.info(placeImageEntity.toString());

		// log.info("this.selectFile(id): {}", this.selectFile(id));

		// 기존 프로필 사진 없으면 insert, 있으면 update
		if(this.selectPlaceImageById(placeId) == null) {
			fileMapper.insertPlaceImage(placeImageEntity);
		} else {
			this.updatePlaceImage(placeImageEntity);
		}
	}

	public void fileToEntity(MultipartFile file, int placeId, Role role) throws Exception {

		// UUID 생성
		UUID uuid = UUID.randomUUID();

		String fullPath = IMAGE_PATH + uuid + "_" + file.getOriginalFilename();
		String originFileName = file.getOriginalFilename();
		String uploadFileName = uuid + "_" + file.getOriginalFilename();

		file.transferTo(new File(fullPath));
		
		PlaceImageEntity placeImageEntity = new PlaceImageEntity();
		placeImageEntity.setFilePath(fullPath);
		placeImageEntity.setOriginFileName(originFileName);
		placeImageEntity.setUploadFileName(uploadFileName);
		placeImageEntity.setPlaceId(placeId);
		placeImageEntity.setRole(role);
		log.info(placeImageEntity.toString());

		// log.info("this.selectFile(id): {}", this.selectFile(id));

		fileMapper.insertPlaceImage(placeImageEntity);
		
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
}
