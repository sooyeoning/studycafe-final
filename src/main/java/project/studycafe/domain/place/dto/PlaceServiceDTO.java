package project.studycafe.domain.place.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PlaceServiceDTO {
	private int id;
	
	private int placeId;
	
	private int serviceId;

	private String feeStatus; //무료 유료
	
	private int pricePaid; //가격

}
