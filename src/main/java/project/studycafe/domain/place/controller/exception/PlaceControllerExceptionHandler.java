package project.studycafe.domain.place.controller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import project.studycafe.domain.place.controller.PlaceController;
import project.studycafe.domain.util.ErrorResponse;

@ControllerAdvice(assignableTypes = PlaceController.class)
public class PlaceControllerExceptionHandler {
	
	@ExceptionHandler
	public ResponseEntity<ErrorResponse> noPlaceException(NotExistsPlaceException e) {
		return ResponseEntity
				.status(HttpStatus.BAD_REQUEST)
				.body(new ErrorResponse(4400, e.getLocalizedMessage()));
	}
	

}
