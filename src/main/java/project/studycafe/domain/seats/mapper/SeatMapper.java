package project.studycafe.domain.seats.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.studycafe.domain.seats.entity.SeatsEntity;
import project.studycafe.domain.seats.model.CheckMyReservationStatusReq;
import project.studycafe.domain.seats.model.CheckSeatAvailabilityReq;
import project.studycafe.domain.seats.model.GetMySeatReq;
import project.studycafe.domain.seats.model.GetMySeatTicketCodeReq;
import project.studycafe.domain.seats.model.GetReservedSeatListForReturnRes;
import project.studycafe.domain.seats.model.GetReservedSeatListRes;

@Mapper
public interface SeatMapper {
	
	void updateReservation(SeatsEntity seatsEntity);
	
	List<GetReservedSeatListRes> getReservedSeatList(int placeId);

	List<GetReservedSeatListForReturnRes> getReservedSeatListForReturn();

	Integer getMyReservedSeatId(GetMySeatReq getMySeatReq);
	
	String getMySeatTicketCode(GetMySeatTicketCodeReq getMySeatTicketCodeReq);

	void returnMySeat(String ticketCode);
		
	void updateEndTime(int seatId);
	
	Integer getTimeDiff(String endTime);
	
	Integer getPeriodDiff(String code);

	String checkMyReservationStatus(CheckMyReservationStatusReq checkMyReserveStatusReq);

	String checkSeatAvailability(CheckSeatAvailabilityReq checkSeatAvailabilityReq);
}
