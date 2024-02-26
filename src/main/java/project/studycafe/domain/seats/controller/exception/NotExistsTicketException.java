package project.studycafe.domain.seats.controller.exception;

public class NotExistsTicketException extends RuntimeException{
	private static final String MESSAGE = "needPurchase";
	
	public NotExistsTicketException() {
		// TODO Auto-generated constructor stub
		super(MESSAGE);
	}
}
