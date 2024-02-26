package project.studycafe.domain.place.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlaceRateDTO {
	/*
	 * @NotNull(message = "2시간 요금은 필수 입력 항목입니다.") private Integer twoHrs;
	 */

	private int id;
	
	private int placeId;
	
	private int rateId;

	private int price;
	
	
}
