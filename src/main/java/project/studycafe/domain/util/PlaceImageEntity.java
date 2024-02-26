package project.studycafe.domain.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import project.studycafe.domain.place.model.Role;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlaceImageEntity {
	
	private int id;
	
	private String filePath;
	
	//user pk
	private int placeId;
	
	private String originFileName;

	private String uploadFileName;
	
	private String uploadDate;
	
	private Role role;
	
	//public static PlaceImageEntity toEntity(PlaceImage)
}
