package project.studycafe.domain.seats.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.seats.entity.SeatsEntity;
import project.studycafe.domain.seats.mapper.SeatMapper;
import project.studycafe.domain.seats.model.CheckMyReservationStatusReq;
import project.studycafe.domain.seats.model.CheckSeatAvailabilityReq;
import project.studycafe.domain.seats.model.GetMySeatReq;
import project.studycafe.domain.seats.model.GetMySeatTicketCodeReq;
import project.studycafe.domain.seats.model.GetReservedSeatListForReturnRes;
import project.studycafe.domain.seats.model.GetReservedSeatListRes;
import project.studycafe.domain.ticket.Ticket;
import project.studycafe.domain.ticket.mapper.TicketMapper;
import project.studycafe.domain.ticket.model.GetResidualTimeReq;
import project.studycafe.domain.ticket.model.PatchTicketReservReq;
import project.studycafe.domain.ticket.model.UpdateResidualTimeReq;
import project.studycafe.domain.user.SeatsDTO;
import project.studycafe.domain.user.mapper.UserMapper;
import project.studycafe.domain.user.model.PatchUserPlaceIdReq;

@Service
@RequiredArgsConstructor
@Slf4j
public class SeatServiceImpl {

	private final SeatMapper seatMapper;
	private final TicketMapper ticketMapper;
	private final UserMapper userMapper;
	private final HttpSession session;

	// 한 지점당 한개의 티켓만 등록 가능 - 제한!
	// 기간권
	// (티켓) 초기: 좌석 예약시에만 start_time, end_time 지정 후 추후 변화 x
	// (티켓) 2번째부터: 좌석번호만 변화
	// 시간 충전권
	// (티켓) 초기: 좌석 예약시에 start_time, end_time 지정
	// (티켓) 2번째부터: 잔여시간, 좌석번호, end_time 변화
	// 좌석: start_time, end_time 좌석 예약 시간, 반납 시간
	@Transactional
	public ResponseEntity<String> reserveSeat(SeatsDTO seatsDTO) {

		String ticketCode = seatsDTO.getTicketCode();
		int seatId = seatsDTO.getId();
		int placeId = seatsDTO.getPlaceId();
		//티켓코드, 시작시간-seats
		seatMapper.updateReservation(SeatsEntity.toEntity(seatsDTO));
		userMapper.updateUserPlaceId(
				new PatchUserPlaceIdReq((int)session.getAttribute("id"), placeId));
		//좌석id, 시작시간, 종료시간, 잔여시간 - ticket
		//티켓 테이블에 시간 저장하기
		PatchTicketReservReq patchTicketReservReq = new PatchTicketReservReq();
		patchTicketReservReq.setCode(ticketCode);
		patchTicketReservReq.setSeatId(seatId);
		
		if(ticketCode.startsWith("C")) {
			ticketMapper.updateTicketHourReservInfo(patchTicketReservReq);
		} else {
			if(ticketCode.startsWith("UR1")) {
				Ticket UR1 = Ticket.UR1;
				patchTicketReservReq.setUnitOfTime(UR1.getUnitOfTime());
				patchTicketReservReq.setEndTime(UR1.getTime());
			}
			if(ticketCode.startsWith("UR2")) {
			    Ticket UR2 = Ticket.UR2;
				patchTicketReservReq.setUnitOfTime(UR2.getUnitOfTime());
				patchTicketReservReq.setEndTime(UR2.getTime());
			}
			if(ticketCode.startsWith("UR4")) {
				Ticket UR4 = Ticket.UR4;
				patchTicketReservReq.setUnitOfTime(UR4.getUnitOfTime());
				patchTicketReservReq.setEndTime(UR4.getTime());
			}
			if(ticketCode.startsWith("R4")) {
				Ticket R4 = Ticket.R4;
				patchTicketReservReq.setUnitOfTime(R4.getUnitOfTime());
				patchTicketReservReq.setEndTime(R4.getTime());
			} 				
			ticketMapper.updateTicketPeriodReservInfo(patchTicketReservReq);
		}
		
		String result = seatId + "번 좌석 예약에 성공했습니다!";
		return ResponseEntity.ok(result);
	}

	public List<GetReservedSeatListRes> getReservedSeatList(int placeId) {
		List<GetReservedSeatListRes> result = seatMapper.getReservedSeatList(placeId);
		return result;
	}

	public void getReservedSeatListForReturn() {
		// 시간 지나면 강제 반납
		List<GetReservedSeatListForReturnRes> result = seatMapper.getReservedSeatListForReturn();
		for (GetReservedSeatListForReturnRes item : result) {
			String ticketCode = item.getCode();
			int placeId = item.getPlaceId();
			
			if (ticketCode.startsWith("C")) {
				String usedTime = ticketMapper.selectUsedTime(ticketCode); // 사용한 시간 계산
				String residualTime = ticketMapper.selectResidualTime(new GetResidualTimeReq(ticketCode, usedTime)); // 남은
																														// 시간																// 계산
				ticketMapper.updateResidualTime(new UpdateResidualTimeReq(ticketCode, residualTime)); // 잔여 시간 변경
				residualTime = ticketMapper.selectTicketInfo(ticketCode).getResidualTimes();
				
				if (residualTime.equals("00:00:00")) {
					seatMapper.returnMySeat(ticketCode); // 기존 테이블 - 반납시간,
																										// 좌석상태 변경
				}
			}
		}

	}

	public void getReservedPeriodSeatListForReturn() {
		// 시간 지나면 강제 반납
		List<GetReservedSeatListForReturnRes> result = seatMapper.getReservedSeatListForReturn();
		for (GetReservedSeatListForReturnRes item : result) {
			String ticketCode = item.getCode();
			int seatId = item.getSeatId();
			int placeId = item.getPlaceId();

			if (ticketCode.startsWith("R") || ticketCode.startsWith("UR")) {
				int diff = seatMapper.getPeriodDiff(ticketCode);
				if (diff <= 0) {
					seatMapper.returnMySeat(ticketCode); // 기존 테이블 - 반납시간,
																										// 좌석상태 변경
					ticketMapper.updateTicketResidualTimeToZero(ticketCode);
				}
			}
		}
	}

	public Integer getMyReservedSeatId(GetMySeatReq getMySeatReq) {
		return seatMapper.getMyReservedSeatId(getMySeatReq);
	}

	@Transactional
	public void returnMySeat(GetMySeatTicketCodeReq getMySeatTicketCodeReq) { // 다른 지점에서 좌석 반납 가능 오류
		// 티켓코드
		String ticketCode = seatMapper.getMySeatTicketCode(getMySeatTicketCodeReq);

		// 티켓 잔여시간 0으로 수정
		if (ticketCode.startsWith("C")) {
			String usedTime = ticketMapper.selectUsedTime(ticketCode); // 사용한 시간 계산
			String residualTime = ticketMapper.selectResidualTime(new GetResidualTimeReq(ticketCode, usedTime)); // 남은
																													// 시간																					// 계산
			ticketMapper.updateResidualTime(new UpdateResidualTimeReq(ticketCode, residualTime)); // 잔여 시간 변경
		}

		seatMapper.returnMySeat(ticketCode); // 좌석테이블 - 반납시간 수정
	}

	public String checkMyReservationStatus(CheckMyReservationStatusReq checkMyReservationStatusReq) {
		return seatMapper.checkMyReservationStatus(checkMyReservationStatusReq);
	}

	public String checkSeatAvailability(CheckSeatAvailabilityReq checkSeatAvailabilityReq) {
		return seatMapper.checkSeatAvailability(checkSeatAvailabilityReq);
	}

}
