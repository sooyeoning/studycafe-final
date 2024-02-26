package project.studycafe.domain.seats.controller.exception;

public class NotExistsLoginInformationException extends RuntimeException{
	private static final String MESSAGE = "noLogin";
	
	public NotExistsLoginInformationException() {
		// TODO Auto-generated constructor stub
		super(MESSAGE);
	}
}
