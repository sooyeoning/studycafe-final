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
		
		if(ticketType.equals("charge10hrs")) {
			ticketTypeChar = "C10"; 
		}
		if(ticketType.equals("charge30hrs")) {
			ticketTypeChar = "C30"; 
		}
		if(ticketType.equals("charge50hrs")) {
			ticketTypeChar = "C50"; 
		}
		if(ticketType.equals("charge100hrs")) {
			ticketTypeChar = "C100"; 
		}
		if(ticketType.equals("charge150hrs")) {
			ticketTypeChar = "C150"; 
		}
		if(ticketType.equals("charge200hrs")) {
			ticketTypeChar = "C200"; 
		}
		if(ticketType.equals("unreserved1weeks")) {
			ticketTypeChar = "UR1"; 
		}
		if(ticketType.equals("unreserved2weeks")) {
			ticketTypeChar = "UR2"; 
		}
		if(ticketType.equals("unreserved4weeks")) {
			ticketTypeChar = "UR4"; 
		}
		if(ticketType.equals("reserved4weeks")) {
			ticketTypeChar = "R4"; 
		}
		String code = ticketTypeChar;
		// log.info(String.valueOf(code.length()));
		int originCode = code.length();
		int num = 9 - originCode;

		for(int i = 0; i < 1; i++) {
			// 26 영소문자 범위
			int Serial = (int)(Math.random() * 26);
			code += (char)(Serial + 61);
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
	
	public TicketTimeDTO calculateTime(String code) {
		Duration residualTimes = null;
		String name = "";
		
		if(!code.contains("C100") && code.contains("C10")) {
			Ticket C10 = Ticket.C10;
			residualTimes = Duration.ofHours(10);
			name = C10.getName();
		}
		if(code.contains("C30")) {
			Ticket C30 = Ticket.C30;
			residualTimes = Duration.ofHours(30);
			name = C30.getName();
		}
		if(code.contains("C50")) {
			Ticket C50 = Ticket.C50;
			residualTimes = Duration.ofHours(50);
			name = C50.getName();
		}
		if(code.contains("C100")) {
			Ticket C100 = Ticket.C100;
			residualTimes = Duration.ofHours(100);
			name = C100.getName();
		}
		if(code.contains("C150")) {
			Ticket C150 = Ticket.C150;
			residualTimes = Duration.ofHours(150);
			name = C150.getName();
		}
		if(code.contains("C200")) {
			Ticket C200 = Ticket.C200;
			residualTimes = Duration.ofHours(200);
			name = C200.getName();
		}
		if(code.startsWith("UR1")) {
			Ticket UR1 = Ticket.UR1;
			residualTimes = Duration.ofDays(7);
			name = UR1.getName();
		}
		if(code.startsWith("UR2")) {
			Ticket UR2 = Ticket.UR2;
			residualTimes = Duration.ofDays(14);
			name = UR2.getName();
			//log.info(String.valueOf(duration));
		}
		if(code.startsWith("UR4")) {
			Ticket UR4 = Ticket.UR4;
			residualTimes = Duration.ofDays(28);
			name = UR4.getName();
		}
		if(code.startsWith("R4")) {
			Ticket R4 = Ticket.R4;
			residualTimes = Duration.ofDays(28);
			name = R4.getName();
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
