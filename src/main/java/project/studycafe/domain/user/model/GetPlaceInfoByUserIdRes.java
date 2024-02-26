package project.studycafe.domain.user.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class GetPlaceInfoByUserIdRes {
	private String name;
	private int placeId;
}
