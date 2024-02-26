package project.studycafe.domain.seats.controller.exception;

public class AlreadyReservedUserException extends RuntimeException{
	private static final String MESSAGE = "alreadyReservedUser";
	
	public AlreadyReservedUserException() {
		// TODO Auto-generated constructor stub
		super(MESSAGE);
	}
}
