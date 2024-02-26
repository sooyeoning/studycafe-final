package project.studycafe.domain.util;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface FileMapper {
	void insertUserImage(UserImageEntity userImageEntity);

	void updateUserImage(UserImageEntity userImageEntity);
	
	String selectFile(int userId);

	void insertPlaceImage(PlaceImageEntity placeImageEntity);
	
	void updatePlaceImage(PlaceImageEntity placeImageEntity);
	
	List<String> selectPlaceImages(int placeId);

	Integer selectPlaceImageById(int placeId);

	
}
