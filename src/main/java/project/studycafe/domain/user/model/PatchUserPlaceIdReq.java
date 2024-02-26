package project.studycafe.domain.user.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class PatchUserPlaceIdReq {
	private int userId;
	private int placeId;
}
