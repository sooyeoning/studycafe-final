package project.studycafe.domain.user.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FindIdReq {
	
	@NotBlank(message = "이름은 필수 입력 항목입니다.")
    private String name;
	
	@NotBlank(message = "이메일은 필수 입력 항목입니다.")
	@Email
	//정규식
    private String email;

}
