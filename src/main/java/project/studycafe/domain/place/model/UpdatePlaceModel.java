package project.studycafe.domain.place.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import project.studycafe.domain.place.dto.PlaceDTO;
import project.studycafe.domain.place.dto.PlaceRateDTO;
import project.studycafe.domain.place.dto.PlaceServiceDTO;
import project.studycafe.domain.util.PlaceImageDTO;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UpdatePlaceModel {

	private int id;

	private PlaceDTO placeDTO;

	private List<PlaceRateDTO> placeRateDTOList;
	
	private List<PlaceServiceDTO> placeServiceDTOList;

	private PlaceImageDTO thumbnailImageDTO;

	private List<MultipartFile> multipartFiles;

	private PlaceImageDTO priceImageDTO;

}
