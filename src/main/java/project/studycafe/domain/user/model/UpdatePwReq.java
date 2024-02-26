package project.studycafe.domain.user.model;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UpdatePwReq {
	
    private String email;
	
    private String userId;
    
    private String newPw;
}
