package project.studycafe.domain.seats.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class GetReservedSeatListForReturnRes {
	private String residualTimes;
	private String code;
	private String endTime;
	private int seatId;
	private int userId;
	private int placeId;
}
