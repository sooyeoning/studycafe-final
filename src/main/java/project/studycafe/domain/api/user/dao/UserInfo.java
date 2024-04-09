package project.studycafe.domain.api.user.dao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserInfo {

	private int id;
	
	private String role;
	
	private String nickname;
	
	private String userId;
	
	private int placeId;
	
}
