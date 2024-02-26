package project.studycafe.domain.seats.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import project.studycafe.domain.user.SeatsDTO;

@Getter
@Builder
@AllArgsConstructor
@ToString
public class SeatsEntity {
	
	private int id;

	private int placeId;
	
	private Timestamp startTime;
	
	private String ticketCode;

	public static SeatsEntity toEntity(SeatsDTO seatsDTO) {
		return SeatsEntity.builder()
				.id(seatsDTO.getId())
				.placeId(seatsDTO.getPlaceId())
				.ticketCode(seatsDTO.getTicketCode())
				.build();
	}
}
