package project.studycafe.domain.user.model;

import lombok.*;
import jakarta.validation.constraints.Email;
import org.hibernate.validator.constraints.Length;
import jakarta.validation.constraints.NotBlank;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SignUpReq {
    private int id;

    @NotBlank(message = "비밀번호는 필수 입력 항목입니다.")
    private String userPw;
    
    //비밀번호 중복 확인용
    @NotBlank(message = "비밀번호 중복 확인은 필수 입력 항목입니다.")
    private String checkPw;

    @NotBlank(message = "아이디는 필수 입력 항목입니다.")
    @Length(min=8, max=30, message = "아이디는 8~30자리로 입력해주세요")
    private String userId;

    @NotBlank(message = "주소는 필수 입력 항목입니다.")
    private String address;

    @Email
    @NotBlank(message = "이메일은 필수 입력 항목입니다.")
    private String email;

    @NotBlank(message = "닉네임은 필수 입력 항목입니다.")
    private String nickname;

    @NotBlank(message = "이름은 필수 입력 항목입니다.")
    @Length(max=10, message="이름은 최대 10글자까지 입력가능합니다.")
    private String name;

    private String role;
    private int imageNo;
    private String regDate;
    
    //이메일 인증번호 전송 여부
    private boolean hasSentEmailAuth;
    
    //이메일 인증번호 확인 여부
    private boolean hasCheckedEmailAuth;
}
