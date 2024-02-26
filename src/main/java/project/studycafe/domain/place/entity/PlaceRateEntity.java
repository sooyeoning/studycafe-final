package project.studycafe.domain.place.entity;

import project.studycafe.domain.place.dto.PlaceRateDTO;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter
@Builder
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlaceRateEntity {
	/*
	 * @NotNull(message = "2시간 요금은 필수 입력 항목입니다.") private Integer twoHrs;
	 */

	private int id;
	
	private int placeId;
	
	private int rateId;

	private int price;
	
	public static PlaceRateEntity toEntity(PlaceRateDTO placeRateDTO) {
		return PlaceRateEntity.builder()
				.id(placeRateDTO.getId())
				.placeId(placeRateDTO.getPlaceId())
				.rateId(placeRateDTO.getRateId())
				.price(placeRateDTO.getPrice())
				.build();
	}
}
