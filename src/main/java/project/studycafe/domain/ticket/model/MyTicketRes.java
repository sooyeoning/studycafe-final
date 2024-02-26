package project.studycafe.domain.ticket.model;

import java.sql.Time;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class MyTicketRes {
	private String code;
	private String residualTimes;
	private String name;
	private int placeId;
	private String placeName;
}
