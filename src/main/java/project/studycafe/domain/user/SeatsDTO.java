package project.studycafe.domain.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import project.studycafe.domain.seats.model.PostSeatReq;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SeatsDTO {
	private int id;
	
	private int placeId;

	private String ticketCode;

	public SeatsDTO(PostSeatReq postSeatReq){
		this.placeId = postSeatReq.getPlaceId();
		this.id = postSeatReq.getId();
		this.ticketCode = postSeatReq.getTicketCode();
	}

}
