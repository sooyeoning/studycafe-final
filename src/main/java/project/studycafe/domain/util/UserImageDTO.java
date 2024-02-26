package project.studycafe.domain.util;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserImageDTO {
	
	// 회원정보 수정시 수정에 필요한 이미지 파일
    private MultipartFile userImage;
    
	private int userId;
		
}
