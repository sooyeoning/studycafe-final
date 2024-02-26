package project.studycafe.domain.ticket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.studycafe.domain.ticket.entity.TicketEntity;
import project.studycafe.domain.ticket.model.CheckTicketAvailabilityReq;
import project.studycafe.domain.ticket.model.GetResidualTimeReq;
import project.studycafe.domain.ticket.model.MyTicketRes;
import project.studycafe.domain.ticket.model.PatchTicketCodeReq;
import project.studycafe.domain.ticket.model.PatchTicketReservReq;
import project.studycafe.domain.ticket.model.UpdateResidualTimeReq;

@Mapper
public interface TicketMapper {
	
	void insertTicket(TicketEntity ticketEntity);
	
	List<MyTicketRes> selectMyTickets(int userId);
		
	void updateTicketPlaceId(PatchTicketCodeReq patchTicketCodeReq);

	String checkTicketRegister(CheckTicketAvailabilityReq checkTicketAvailabilityReq);

	String checkTicketPurchase(int userId);

	void updateTicketHourReservInfo(PatchTicketReservReq patchTicketReservReq);
	
	void updateTicketPeriodReservInfo(PatchTicketReservReq patchTicketReservReq);
	
	void updateTicketResidualTimeToZero(String code);
	
	void updateResidualTime(UpdateResidualTimeReq updateResidualTimeReq);
	
	String selectResidualTime(GetResidualTimeReq getResidualTimeReq);
	
	String selectUsedTime(String code);
	
	MyTicketRes selectTicketInfo(String code);
}
