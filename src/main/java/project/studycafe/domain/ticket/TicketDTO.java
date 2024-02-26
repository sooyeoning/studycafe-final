package project.studycafe.domain.ticket;

import java.time.Duration;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TicketDTO {
	
	private String code;
	private int userId;
	private Duration residualTimes;   //24시간 초과하는 시간을 다룬다
	private String name;


}
