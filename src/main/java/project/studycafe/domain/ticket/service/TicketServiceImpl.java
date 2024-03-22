package project.studycafe.domain.ticket.service;

import java.time.Duration;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.ticket.Ticket;
import project.studycafe.domain.ticket.TicketDTO;
import project.studycafe.domain.ticket.TicketTimeDTO;
import project.studycafe.domain.ticket.entity.TicketEntity;
import project.studycafe.domain.ticket.mapper.TicketMapper;
import project.studycafe.domain.ticket.model.CheckTicketAvailabilityReq;
import project.studycafe.domain.ticket.model.MyTicketRes;
import project.studycafe.domain.ticket.model.PatchTicketCodeReq;
import project.studycafe.domain.user.mapper.UserMapper;
import project.studycafe.domain.user.model.PatchUserPlaceIdReq;

@Service
@RequiredArgsConstructor
@Slf4j
public class TicketServiceImpl {

	private final TicketMapper ticketMapper;
	private final UserMapper userMapper;
	
	public String makeTicketCode(String ticketType) {
		String ticketTypeChar = "";
		String code = makeTicketTypeChar(ticketType,ticketTypeChar);
		
		int originCode = code.length();
		int num = 9 - originCode;

		//티켓코드가 3글자인경우
		if(originCode==3) {
			for(int i = 0; i < 1; i++) {
				// 26 영소문자 범위
				int Serial = (int)(Math.random() * 26);
				code += (char)(Serial + 61);
			}
			num--;
		}
		
		for(int i = 0; i < num; i++) {
			// 26 영대문자 범위, 26 영소문자 범위, 10 숫자 범위
			int Serial = (int)(Math.random() * (26 + 26 + 10));
			// 숫자 조건
			if (Serial < 10) {
				code += Serial;
			}
			// 소문자 조건
			else if (Serial > 35) { 
				code += (char)(Serial + 61);
			}
			// 대문자 조건
			else {
				code+= (char)(Serial + 55);
			}
		}
		
		return code;
	}
	
	public String makeTicketTypeChar(String ticketType, String ticketTypeChar) {
		for(Ticket one: Ticket.values()) {
			if(ticketType.equals(one.getEnglishName())) {
				ticketTypeChar = one.name();
			}			
		}
		return ticketTypeChar;
	}
	
	public TicketTimeDTO calculateTime(String code) {
		Duration residualTimes = null;
		String name = "";
		
		for(Ticket ticket : Ticket.values()) {
			if(code.startsWith(ticket.name())) {
				name = ticket.getTicketName();
				int time = ticket.getTime();
				residualTimes = Duration.ofHours(time);
			}
		}
		
		TicketTimeDTO dto = new TicketTimeDTO(residualTimes, name);
		return dto;
	}
	
	public void insertTicket(TicketDTO ticketDTO) {
		log.info(TicketEntity.toEntity(ticketDTO).toString());
		ticketMapper.insertTicket(TicketEntity.toEntity(ticketDTO));
	}
	
	public List<MyTicketRes> getMyTickets(int userId) {
		List<MyTicketRes> result = ticketMapper.selectMyTickets(userId);
		return result;
	}
	
	@Transactional
	public void updateTicketInfo(PatchTicketCodeReq patchTicketCodeReq) {
		ticketMapper.updateTicketPlaceId(patchTicketCodeReq);
		userMapper.updateUserPlaceId(
				new PatchUserPlaceIdReq(patchTicketCodeReq.getUserId(), patchTicketCodeReq.getPlaceId()));
	}

	public MyTicketRes getTicketInfo(String code) {
		return ticketMapper.selectTicketInfo(code);
	}

	public String checkRegisteredTicketForPlace(CheckTicketAvailabilityReq checkRegisteredTicketForPlaceReq) {
		return ticketMapper.checkTicketRegister(checkRegisteredTicketForPlaceReq);
	}
	
	public String checkTicketPurchase(int userId) {
		return ticketMapper.checkTicketPurchase(userId);
	}
}
