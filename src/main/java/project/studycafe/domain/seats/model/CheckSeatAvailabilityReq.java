package project.studycafe.domain.seats.model;

import java.sql.Timestamp;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CheckSeatAvailabilityReq {
	
	private int placeId;
	
	private int seatId;
	

}
