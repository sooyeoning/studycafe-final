package project.studycafe.domain.seats.controller.exception;

public class AlreadyReservedUserException extends RuntimeException{
	private static final String MESSAGE = "alreadyReservedUser";
	
	public AlreadyReservedUserException() {
		super(MESSAGE);
	}
}
