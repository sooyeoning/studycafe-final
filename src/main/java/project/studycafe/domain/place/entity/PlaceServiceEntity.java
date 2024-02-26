package project.studycafe.domain.place.entity;

import project.studycafe.domain.place.dto.PlaceServiceDTO;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlaceServiceEntity {
	private int id;
	
	private int placeId;
	
	private int serviceId;

	private String feeStatus; //무료 유료
	
	private int pricePaid; //가격

	public static PlaceServiceEntity toEntity(PlaceServiceDTO placeServiceDTO) {
		return PlaceServiceEntity.builder()
				.id(placeServiceDTO.getId())
				.placeId(placeServiceDTO.getPlaceId())
				.serviceId(placeServiceDTO.getServiceId())
				.feeStatus(placeServiceDTO.getFeeStatus())
				.pricePaid(placeServiceDTO.getPricePaid())
				.build();
	}
}
