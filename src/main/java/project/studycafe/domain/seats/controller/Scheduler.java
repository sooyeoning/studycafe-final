package project.studycafe.domain.seats.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.seats.service.SeatServiceImpl;

@Component
@AllArgsConstructor
@Slf4j
public class Scheduler {
	
	private final SeatServiceImpl seatService;
	
	@Scheduled(cron="0 */5 * * * *")
	public void returnInvalidSeat() {
		//현재 예약중인 좌석 중 시간이 만료된거 찾기
		log.info("returnInvalidSeat start");
		seatService.getReservedSeatListForReturn();
	}
	
	@Scheduled(cron="0 1 0 * * *")
	public void returnInvalidPeriodSeat() {
		//현재 예약중인 좌석 중 시간이 만료된거 찾기
		log.info("returnPeriodInvalidSeat start");
		seatService.getReservedPeriodSeatListForReturn();
	}
}
