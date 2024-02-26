package project.studycafe.domain.user.model;


import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LoginReq {
    private String userPw;
    private String userId;

}
