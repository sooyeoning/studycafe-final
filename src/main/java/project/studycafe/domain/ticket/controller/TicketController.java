package project.studycafe.domain.ticket.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.seats.controller.exception.NotExistsLoginInformationException;
import project.studycafe.domain.ticket.TicketDTO;
import project.studycafe.domain.ticket.TicketTimeDTO;
import project.studycafe.domain.ticket.controller.exception.ExistsRegisteredTicketForPlaceException;
import project.studycafe.domain.ticket.model.BuyTicketReq;
import project.studycafe.domain.ticket.model.CheckTicketAvailabilityReq;
import project.studycafe.domain.ticket.model.MyTicketRes;
import project.studycafe.domain.ticket.model.PatchTicketCodeReq;
import project.studycafe.domain.ticket.service.TicketServiceImpl;

@Controller
@RequiredArgsConstructor
@Slf4j
public class TicketController {

	private final TicketServiceImpl ticketService;
	private final HttpSession session;
	
	@PostMapping("/ticket/buy")
	@ResponseBody
	public void buyTicket(@RequestBody BuyTicketReq buyTicketReq) { //userId, 코드
		log.info("ticketType: {}",buyTicketReq.getTicketType());
		
		int userId = (int)session.getAttribute("id");
		
		TicketDTO ticketDTO = new TicketDTO();
		ticketDTO.setUserId(userId);
				
		//Service에서 티켓코드 발급
		String code = ticketService.makeTicketCode(buyTicketReq.getTicketType());
		ticketDTO.setCode(code);
		log.info("code: {}",code);

		//잔여시간, 잔여날짜 계산
		TicketTimeDTO dto = ticketService.calculateTime(code);
		ticketDTO.setResidualTimes(dto.getResidualTimes());
		ticketDTO.setName(dto.getName());
		
		log.info(ticketDTO.toString());
		
		//티켓등록
		ticketService.insertTicket(ticketDTO);
	}
	
	@GetMapping("/ticket/add/{code}")
	public ModelAndView getTicketListPage(@PathVariable String code) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/ticket/registerTicketPlace");
		MyTicketRes res = ticketService.getTicketInfo(code);
		
		mv.addObject("res", res);
		mv.addObject("ticketCode", res.getCode());

		return mv;
	}
	
	@PatchMapping(path = "/ticket/add", consumes="application/json")
	@ResponseBody
	public void patchTicketCode(@RequestBody PatchTicketCodeReq patchTicketCodeReq) {
		
		int userId = (int)session.getAttribute("id");
		
		patchTicketCodeReq.setUserId(userId);
		
		//한 지점당 한개의 티켓만 등록가능		
		CheckTicketAvailabilityReq checkTicketPurchaseReq = new CheckTicketAvailabilityReq(userId, patchTicketCodeReq.getPlaceId());
		if(ticketService.checkRegisteredTicketForPlace(checkTicketPurchaseReq) != null) {
			throw new ExistsRegisteredTicketForPlaceException();
		}
		ticketService.updateTicketInfo(patchTicketCodeReq);
	}
	
	@GetMapping("/ticket/list")
	@ResponseBody
	public ResponseEntity<List<MyTicketRes>> getTicketList() {
		
		int userId = (int)session.getAttribute("id");
		List<MyTicketRes> result = ticketService.getMyTickets(userId);
		return ResponseEntity.ok().body(result);
	}
	
	
}
