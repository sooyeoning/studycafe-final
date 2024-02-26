package project.studycafe.domain.seats.model;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class GetMySeatReq {
	
	private int placeId;
	
	private int userId;

}
