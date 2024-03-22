package project.studycafe.domain.util;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Setter
@ToString
public class PlaceImageDTO {
	
	// 이미지 필수로 변경
	private MultipartFile file;
		
	private int placeId;
	
	private String uploadFileName;
	
	private String role;
	
}
