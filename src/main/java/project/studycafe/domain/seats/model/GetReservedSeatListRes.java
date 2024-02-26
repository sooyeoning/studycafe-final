package project.studycafe.domain.seats.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class GetReservedSeatListRes {
	private String endTime;
	private int id;
	private int userId;
	private int counts;
}
