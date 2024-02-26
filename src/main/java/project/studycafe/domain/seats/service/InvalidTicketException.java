package project.studycafe.domain.seats.service;

public class InvalidTicketException extends RuntimeException{
	private static final String MESSAGE = "ticketUsed";
	
	public InvalidTicketException() {
		// TODO Auto-generated constructor stub
		super(MESSAGE);
	}
}
