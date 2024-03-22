package project.studycafe.domain.seats.controller.exception;

public class AlreadyReservedSeatException extends RuntimeException{
	private static final String MESSAGE = "alreadyReservedUser";
	
	public AlreadyReservedSeatException() {
		super(MESSAGE);
	}
}
