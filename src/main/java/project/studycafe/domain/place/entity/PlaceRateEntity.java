package project.studycafe.domain.place.entity;

import project.studycafe.domain.place.dto.PlaceRateDTO;

import lombok.*;

@Getter
@Builder
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlaceRateEntity {
	
	private int id;
	
	private int placeId;
	
	private int rateId;

	private int price;
	
	public static PlaceRateEntity toEntity(PlaceRateDTO placeRateDTO, int placeId) {
		return PlaceRateEntity.builder()
				.id(placeRateDTO.getId())
				.placeId(placeId)
				.rateId(placeRateDTO.getRateId())
				.price(placeRateDTO.getPrice())
				.build();
	}
}
