package project.studycafe.domain.ticket.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class CheckTicketAvailabilityRes {
	private String code;
	private String residualTimes;
	private int placeId;
}
