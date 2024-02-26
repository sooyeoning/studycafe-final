package project.studycafe.domain.ticket.controller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import project.studycafe.domain.seats.controller.exception.NotExistsLoginInformationException;
import project.studycafe.domain.ticket.controller.TicketController;
import project.studycafe.domain.util.ErrorResponse;

@ControllerAdvice(assignableTypes = {TicketController.class})
public class TicketControllerExceptionHandler {
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> existsRegisteredTicketForPlaceException(ExistsRegisteredTicketForPlaceException e) {
		return ResponseEntity
				.status(HttpStatus.BAD_REQUEST)
				.body(new ErrorResponse(4302, e.getLocalizedMessage()));
	}
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> noLoginException(NotExistsLoginInformationException e) {
		return ResponseEntity
				.status(HttpStatus.UNAUTHORIZED)
				.body(new ErrorResponse(4101, e.getLocalizedMessage()));
	}
	
	
}
