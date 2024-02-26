package project.studycafe.domain.user.model;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import project.studycafe.domain.util.UserImageDTO;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PatchUserReq {
	
    private int id;
    
    @NotBlank(message = "주소는 필수 입력 항목입니다.")
    private String address;
    
    @NotBlank(message = "닉네임은 필수 입력 항목입니다.")
    private String nickname;
    
    @NotBlank(message = "이름은 필수 입력 항목입니다.")
    private String name;
    
    private String imagePath;
    
    private String placeId;
    
    private UserImageDTO userImageDTO;
    
    // 기존 정보 가져올때 필요한 이미지 이름
    private String uploadFileName;

}
