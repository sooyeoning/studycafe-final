package project.studycafe.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "home";
	}

	@GetMapping("/logout")
	public String logout() {
		return "home";
	}

	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	@GetMapping("/place/getlist")
	public String getList() {
		return "place/placeList";
	}

	@GetMapping("/test")
	public String testHome() {
		return "place/testHome";
	}
	
	@GetMapping("/testUser")
	public String testUser() {
		return "place/testHomeLogin";
	}
	
	@GetMapping("/seats/guest")
	public String getSeatsPage() {
		return "seats/guestSeats";
	}
	
	@GetMapping("/seats")
	public String reserveSeats() {
		return "seats/seats";
	}
}
