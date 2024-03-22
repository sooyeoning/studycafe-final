package project.studycafe.domain.place.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlaceRateDTO {

	private int id;
	
	private int placeId;
	
	private int rateId;

	private int price;

	
}
