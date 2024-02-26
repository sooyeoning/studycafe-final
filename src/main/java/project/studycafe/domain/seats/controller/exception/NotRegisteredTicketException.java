package project.studycafe.domain.seats.controller.exception;

public class NotRegisteredTicketException extends RuntimeException{
	private static final String MESSAGE = "needRegister";
	
	public NotRegisteredTicketException() {
		// TODO Auto-generated constructor stub
		super(MESSAGE);
	}
}
