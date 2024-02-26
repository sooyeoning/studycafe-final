package project.studycafe.domain.seats.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class CheckMyReservationStatusReq {
	private int placeId;
	private int userId;
	
}
