package project.studycafe.domain.place.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PlaceDTO {
	
	private int id;

	@NotBlank
	private String name;
	
	@NotBlank
	private String address;
	
	@NotBlank
	private String areaCode;

	@Pattern(regexp = "^([0-9]{2,4})-([0-9]{3,4})-([0-9]{3,4})$", message = "전화번호는 0000-0000-0000 형식으로 작성해주세요.")
	@NotBlank
	private String phone;
	
	
}
