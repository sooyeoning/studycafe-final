package project.studycafe.domain.seats.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class GetMySeatTicketCodeReq {
	private int userId;
	private int id;
}
