package project.studycafe.domain.place.entity;

import project.studycafe.domain.place.dto.PlaceDTO;

import lombok.*;

@Getter
@Setter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PlaceEntity {
	private int id;
	private String name;
	private String address;
	private String areaCode;
	private String phone;
	
	public static PlaceEntity toEntity(PlaceDTO placeDTO) {
		return PlaceEntity.builder()
				.id(placeDTO.getId())
				.name(placeDTO.getName())
				.address(placeDTO.getAddress())
				.areaCode(placeDTO.getAreaCode())
				.phone(placeDTO.getPhone())
				.build();
	}
}
