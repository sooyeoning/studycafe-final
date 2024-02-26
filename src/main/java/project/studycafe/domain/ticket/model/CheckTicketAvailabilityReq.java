package project.studycafe.domain.ticket.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CheckTicketAvailabilityReq {
	
	private int userId;
	private int placeId;
}
