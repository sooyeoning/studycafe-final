package project.studycafe.domain.place.model;

import java.util.List;

import jakarta.validation.Valid;
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
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlacePostReq {

	private int placeId;

	@Valid
	private PlaceDTO placeDTO;

	@Valid
	private List<PlaceRateDTO> placeRateDTOList;

	@Valid
	private List<PlaceServiceDTO> placeServiceDTOList;
	
	private PlaceImageDTO placeImageDTO;
}
