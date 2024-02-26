package project.studycafe.domain.place.controller.exception;

public class NotExistsPlaceException extends RuntimeException{
	private static final String MESSAGE = "noPlace";

	public NotExistsPlaceException() {
		super();
	}

}
