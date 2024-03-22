package project.studycafe.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import project.studycafe.domain.seats.controller.exception.NotExistsLoginInformationException;
import project.studycafe.domain.user.model.GetPlaceInfoByUserIdRes;
import project.studycafe.domain.user.service.UserServiceImpl;

@Controller
@RequiredArgsConstructor
public class WebSeatController {

	private final UserServiceImpl userService;
	private final HttpSession session;

	@GetMapping("/getSeatsImage/{placeId}")
	public String getSeatsImage(@PathVariable int placeId) {
		return "seats/"+placeId;
	}
	
	@GetMapping("/getPlaceName")
	@ResponseBody
	public GetPlaceInfoByUserIdRes getPlaceNameByUserId() {
		if(session == null || session.getAttribute("id") == null) {
			throw new NotExistsLoginInformationException();
		}
		
		int userId = (int)session.getAttribute("id");
				
		GetPlaceInfoByUserIdRes res = userService.getPlaceInfoByUserId(userId);
		
		return res;
	}
	
	
}
