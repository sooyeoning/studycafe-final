package project.studycafe.domain.api.user.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.api.user.service.ApiService;
import project.studycafe.domain.api.user.dao.UserInfo;

@RestController
@Slf4j
@RequiredArgsConstructor
public class ApiController {

	private final ApiService apiService;

	@GetMapping("/token")
	public ResponseEntity<UserInfo> getUserInfo(HttpServletRequest request) {

		String header = request.getHeader("Authorization");
		String token = header.substring(7);

		log.info("token substring" + token.substring(7));
		log.info(token.substring(8));

		int id = apiService.getUserIdByToken(token);
		UserInfo userInfo = apiService.getUserInfoById(id);

		return ResponseEntity.ok(userInfo);
	}
}
