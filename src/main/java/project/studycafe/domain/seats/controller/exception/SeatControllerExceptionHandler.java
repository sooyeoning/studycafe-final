package project.studycafe.domain.seats.controller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import project.studycafe.domain.seats.controller.SeatController;
import project.studycafe.domain.util.ErrorResponse;

@ControllerAdvice(assignableTypes = {SeatController.class})
public class SeatControllerExceptionHandler {
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> noLoginException(NotExistsLoginInformationException e) {
		return ResponseEntity
				.status(HttpStatus.UNAUTHORIZED)
				.body(new ErrorResponse(4101, e.getLocalizedMessage()));
	}
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> notExistsMyReservedSeatIdException(NotExistsMyReservedSeatIdException e) {
		return ResponseEntity
				.status(HttpStatus.BAD_REQUEST)
				.body(new ErrorResponse(4201, e.getLocalizedMessage()));
	}
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> alreadyReservedUserException(AlreadyReservedUserException e) {
		return ResponseEntity
				.status(HttpStatus.BAD_REQUEST)
				.body(new ErrorResponse(4202, e.getLocalizedMessage()));
	}
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> notExistsTicketException(NotExistsTicketException e) {
		return ResponseEntity
				.status(HttpStatus.BAD_REQUEST)
				.body(new ErrorResponse(4301, e.getLocalizedMessage()));
	}
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> notRegisteredTicketException(NotRegisteredTicketException e) {
		return ResponseEntity
				.status(HttpStatus.BAD_REQUEST)
				.body(new ErrorResponse(4303, e.getLocalizedMessage()));
	}
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> alreadyReservedSeatException(AlreadyReservedSeatException e){
		return ResponseEntity
				.status(HttpStatus.BAD_REQUEST)
				.body(new ErrorResponse(4203 ,e.getLocalizedMessage()));
	}
}

