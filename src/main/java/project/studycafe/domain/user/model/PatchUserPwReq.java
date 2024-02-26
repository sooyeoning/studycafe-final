package project.studycafe.domain.user.model;


import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PatchUserPwReq {
	
    private String userId;
    
    @NotBlank(message = "현재 비밀번호는 필수 입력 항목입니다.")
    private String originPw;
    
    @NotBlank(message = "변경할 비밀번호는 필수 입력 항목입니다.")
    private String newPw;
    
    @NotBlank(message = "비밀번호 중복확인란은 필수 입력 항목입니다.")
    private String checkNewPw;
    

}
