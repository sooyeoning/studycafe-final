package project.studycafe.domain.place.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RateDTO {
	/*
	 * @NotNull(message = "2시간 요금은 필수 입력 항목입니다.") private Integer twoHrs;
	 */

	private int id;
	
	private String name;
}
