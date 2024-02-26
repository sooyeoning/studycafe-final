package project.studycafe.domain.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserImageEntity {
	
	private int id;
	
	private String filePath;
	
	private int userId;
	
	private String originFileName;

	private String uploadFileName;
	
	private String uploadDate;
}
