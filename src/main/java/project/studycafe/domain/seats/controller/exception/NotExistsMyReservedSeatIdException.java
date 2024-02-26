package project.studycafe.domain.seats.controller.exception;

public class NotExistsMyReservedSeatIdException extends RuntimeException{
	private static final String MESSAGE = "notExistsMyReservedSeat";
	
	public NotExistsMyReservedSeatIdException() {
		// TODO Auto-generated constructor stub
		super(MESSAGE);
	}
}
