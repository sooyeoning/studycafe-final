package project.studycafe.domain.seats.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ReturnMySeatReq {
	private int seatId;
	private int userId;
}
