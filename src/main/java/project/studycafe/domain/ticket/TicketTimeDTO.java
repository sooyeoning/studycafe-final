package project.studycafe.domain.ticket;

import java.time.Duration;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class TicketTimeDTO {
	
	private Duration residualTimes;
	private String name;

}
