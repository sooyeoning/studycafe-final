package project.studycafe.domain.ticket;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import project.studycafe.domain.ticket.model.PatchTicketReservReq;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public enum Ticket {
	C10("hour", 10, "charge10hrs", "[시간충전권] 10시간", "current_timestamp()"),
	C30("hour", 30, "charge30hrs", "[시간충전권] 30시간", "current_timestamp()"),
	C50("hour", 50, "charge50hrs", "[시간충전권] 50시간", "current_timestamp()"),
	C100("hour", 100, "charge100hrs", "[시간충전권] 100시간", "current_timestamp()"),
	C150("hour", 150, "charge150hrs", "[시간충전권] 150시간", "current_timestamp()"),
	C200("hour", 200, "charge200hrs", "[시간충전권] 200시간", "current_timestamp()"),
	UR1("day", 6, "unreserved1weeks", "[정기이용권] 1주 자유석", "current_date()"),
	UR2("day", 13, "unreserved2weeks", "[정기이용권] 2주 자유석", "current_date()"),
	UR4("day", 27, "unreserved4weeks", "[정기이용권] 4주 자유석", "current_date()"),
	R4("day", 27, "reserved4weeks", "[정기이용권] 4주 고정석", "current_date()");

	private String unitOfTime;
	private int time;
	private String englishName;
	private String ticketName;
	private String currentUnitOfTime;
	
	public PatchTicketReservReq getPatchTicketReserveReq(Ticket ticket, PatchTicketReservReq req) {
		//Ticket ticket = Ticket.valueOf(ticketType);
		req.setUnitOfTime(ticket.getUnitOfTime());
		req.setEndTime(ticket.getTime());
		return req;
	}
	
}
