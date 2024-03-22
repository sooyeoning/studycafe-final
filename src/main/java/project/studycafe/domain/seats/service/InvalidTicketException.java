package project.studycafe.domain.seats.service;

public class InvalidTicketException extends RuntimeException{
	private static final String MESSAGE = "ticketUsed";
	
	public InvalidTicketException() {
		super(MESSAGE);
	}
}
