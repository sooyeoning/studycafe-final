package project.studycafe.domain.ticket.entity;

import java.time.Duration;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.ticket.TicketDTO;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Slf4j
public class TicketEntity {
	
	private String code;

	private int userId;
	
	private String residualTimes; //duration -> timestamp -> mysql: datetime
	
	private String name;
	
	private int placeId;
	
	private String startTime;
	
	private String endTime;
	
	private int SeatId;

	public static TicketEntity toEntity(TicketDTO ticketDTO) {
		return TicketEntity.builder()
			.code(ticketDTO.getCode())
			.userId(ticketDTO.getUserId())
			.residualTimes(convertToMySQLTime(ticketDTO.getResidualTimes()))
			.name(ticketDTO.getName())
			.build();
	}
	
	private static String convertToMySQLTime(Duration duration) {
		long seconds = duration.getSeconds();
		int hours = (int)seconds/3600;
		
		String time = String.format("%02d:00:00", hours);
		return time;
	}
	
}
