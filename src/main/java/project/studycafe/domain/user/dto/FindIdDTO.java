package project.studycafe.domain.user.dto;


import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FindIdDTO {
	
	@NotBlank(message = "이름은 필수 입력 항목입니다.")
    private String name;
	
	@NotBlank(message = "이메일은 필수 입력 항목입니다.")
	@Email
    private String email;

}
