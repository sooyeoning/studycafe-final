package project.studycafe.domain.ticket.controller.exception;

public class ExistsRegisteredTicketForPlaceException extends RuntimeException{
	private static final String MESSAGE = "alreadyReservedUser";
	
	public ExistsRegisteredTicketForPlaceException() {
		// TODO Auto-generated constructor stub
		super(MESSAGE);
	}
}
