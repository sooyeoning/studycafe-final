package project.studycafe.domain.seats.controller.exception;

public class NotRegisteredTicketException extends RuntimeException{
	private static final String MESSAGE = "needRegister";
	
	public NotRegisteredTicketException() {
		super(MESSAGE);
	}
}
