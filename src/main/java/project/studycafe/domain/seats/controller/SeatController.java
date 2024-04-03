package project.studycafe.domain.seats.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import project.studycafe.domain.seats.controller.exception.AlreadyReservedSeatException;
import project.studycafe.domain.seats.controller.exception.AlreadyReservedUserException;
import project.studycafe.domain.seats.controller.exception.NotExistsMyReservedSeatIdException;
import project.studycafe.domain.seats.controller.exception.NotRegisteredTicketException;
import project.studycafe.domain.seats.model.CheckMyReservationStatusReq;
import project.studycafe.domain.seats.model.CheckSeatAvailabilityReq;
import project.studycafe.domain.seats.model.GetMySeatReq;
import project.studycafe.domain.seats.model.GetMySeatTicketCodeReq;
import project.studycafe.domain.seats.model.GetReservedSeatListRes;
import project.studycafe.domain.seats.model.PostSeatReq;
import project.studycafe.domain.seats.service.SeatServiceImpl;
import project.studycafe.domain.ticket.model.CheckTicketAvailabilityReq;
import project.studycafe.domain.ticket.service.TicketServiceImpl;
import project.studycafe.domain.user.SeatsDTO;

@Controller
@RequiredArgsConstructor
public class SeatController {

	private final SeatServiceImpl seatService;
	private final TicketServiceImpl ticketService;
	private final HttpSession session;
	
	@PostMapping("/reserve/{id}")
	@ResponseBody
	public ResponseEntity<String> reserveSeat(@RequestBody PostSeatReq postSeatReq) {
		
		int userId = (int)session.getAttribute("id");
		int placeId = postSeatReq.getPlaceId();
		
		//회원이 이미 다른 자리를 사용하고 있는 경우
		if(seatService.checkMyReservationStatus(
			new CheckMyReservationStatusReq(placeId, userId)) != null) {
			throw new AlreadyReservedUserException(); 
		}
				
		//좌석을 다른 회원이 사용하고 있는 경우
		if(seatService.checkSeatAvailability(
			new CheckSeatAvailabilityReq(placeId, postSeatReq.getId()))!=null) {
			throw new AlreadyReservedSeatException();
		}
		
		//seat 테이블에 (변수)start_time, 티켓코드 필요/ where placeId, seatId
		//등록된 티켓이 없을때 - 예외처리
		if(ticketService.checkRegisteredTicketForPlace(
			new CheckTicketAvailabilityReq(userId,placeId)) == null) {
			throw new NotRegisteredTicketException();
		}
		
		String ticketCode = ticketService.checkRegisteredTicketForPlace(
				new CheckTicketAvailabilityReq(userId,placeId ));
		
		postSeatReq.setTicketCode(ticketCode);
		ResponseEntity<String> res = seatService.reserveSeat(new SeatsDTO(postSeatReq));			
		return res;
	}
	
	@GetMapping("/seats/{placeId}")
	@ResponseBody
	public List<GetReservedSeatListRes> getReservedSeatList(@PathVariable int placeId, Model model) {
		List<GetReservedSeatListRes> reservedSeats = seatService.getReservedSeatList(placeId);
		return reservedSeats;
	}
	
	@GetMapping("/myseat/{newPlaceId}")
	@ResponseBody
	public ResponseEntity<Integer> getMyReservedSeatId(@PathVariable int newPlaceId) {
		
		GetMySeatReq getMySeatReq = 
				new GetMySeatReq(newPlaceId,(int)session.getAttribute("id"));		
		
		if(seatService.getMyReservedSeatId(getMySeatReq) == null) {
			throw new NotExistsMyReservedSeatIdException();
		}
		
		Integer reservedSeatId = seatService.getMyReservedSeatId(getMySeatReq);
		
		return ResponseEntity.ok(reservedSeatId);
	}
	
	
	@GetMapping("return/{seatId}")
	@ResponseBody
	public void returnMySeat(@PathVariable int seatId, HttpServletRequest request) {
	
		int userId = (int)session.getAttribute("id");
		
		if((Integer)seatId == 0) {
			throw new NotExistsMyReservedSeatIdException();
		} else {			
			GetMySeatTicketCodeReq req = new GetMySeatTicketCodeReq(userId,seatId);
			seatService.returnMySeat(req);
		}
	}
	
	@GetMapping("/seats/buy")
	public String getBuyingPage() {
		return "/place/buyTicket";
	}
	

}
