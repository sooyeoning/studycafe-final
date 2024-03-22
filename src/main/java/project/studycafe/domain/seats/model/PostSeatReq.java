package project.studycafe.domain.seats.model;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PostSeatReq {
	
	private int placeId;
	
	private int id;
	
	private String ticketCode;

}
