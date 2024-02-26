package project.studycafe.domain.ticket;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public enum Ticket {
	C10("hour", 10, "[시간충전권] 10시간", "current_timestamp()"),
	C30("hour", 30, "[시간충전권] 30시간", "current_timestamp()"),
	C50("hour", 50, "[시간충전권] 50시간", "current_timestamp()"),
	C100("hour", 100, "[시간충전권] 100시간", "current_timestamp()"),
	C150("hour", 150, "[시간충전권] 150시간", "current_timestamp()"),
	C200("hour", 200, "[시간충전권] 200시간", "current_timestamp()"),
	UR1("day", 6, "[정기이용권] 1주 자유석", "current_date()"),
	UR2("day", 13, "[시간충전권] 2주 자유석", "current_date()"),
	UR4("day", 27, "[시간충전권] 4주 자유석", "current_date()"),
	R4("day", 27, "[시간충전권] 4주 고정석", "current_date()");

	private String unitOfTime;
	private int time;
	private String name;
	private String currentUnitOfTime;
}
