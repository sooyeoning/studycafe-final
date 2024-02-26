package project.studycafe.domain.ticket.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class PatchTicketCodeReq {
	private int placeId;
	private String code;
	
	@Setter
	private int userId;
}
