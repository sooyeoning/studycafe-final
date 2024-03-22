package project.studycafe.domain.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserImageEntity {
	
	private int id;
	
	private String filePath;
	
	private int userId;
	
	private String originFileName;

	private String uploadFileName;
	
	private String uploadDate;

	public UserImageEntity(String filePath, int userId, String originFileName, String uploadFileName) {
		this.filePath = filePath;
		this.userId = userId;
		this.originFileName = originFileName;
		this.uploadFileName = uploadFileName;
	}
	
	
}
