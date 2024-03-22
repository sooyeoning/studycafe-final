package project.studycafe.domain.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import project.studycafe.domain.place.model.Role;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlaceImageEntity {
	
	private int id;
	
	private String filePath;
	
	private int placeId;
	
	private String originFileName;

	private String uploadFileName;
	
	private String uploadDate;
	
	private Role role;

	public PlaceImageEntity(String filePath, int placeId, String originFileName, String uploadFileName,
			Role role) {
		this.filePath = filePath;
		this.placeId = placeId;
		this.originFileName = originFileName;
		this.uploadFileName = uploadFileName;
		this.role = role;
	}
	
	
	
}
