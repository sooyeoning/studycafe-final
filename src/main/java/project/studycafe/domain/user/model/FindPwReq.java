package project.studycafe.domain.user.model;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class FindPwReq {
	
	@NotBlank(message = "이메일은 필수 입력 항목입니다.")
    private String email;
	
	@NotBlank(message = "아이디는 필수 입력 항목입니다.")
    private String userId;
}
