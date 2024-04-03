package project.studycafe.domain.user.controller;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import java.util.Map;
import java.util.Random;

@Controller
@RequiredArgsConstructor
@RequestMapping("/email")
@Slf4j
public class EmailController {

	private final JavaMailSender mailSender;
	private final HttpServletRequest request;

	/**
	 * @param email
	 * @return Integer 인증번호
	 */
	@PostMapping("/sendAuth")
	@ResponseBody
	public ResponseEntity<Integer> sendEmailAuth(@RequestParam String email) {

		Random random = new Random();
		int authNum = random.nextInt(888888) + 111111;

		String setFrom = "studycafecompareprice@gmail.com";
		String toMail = email;
		String title = "이메일 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + authNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			jakarta.mail.internet.MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ResponseEntity.ok(authNum);
	}

	@GetMapping("/sendPassword")
	public String sendPassword() {

		Map<String, ?> paramMap = RequestContextUtils.getInputFlashMap(request);

		String pw = (String) paramMap.get("userPw");
		log.info("pw: {}", pw);
		
		if (!pw.equals("가입된 아이디와 맞지 않는 이메일입니다.") && !pw.equals("가입된 이메일과 맞지 않는 아이디입니다.")) {
			String setFrom = "studycafecompareprice@gmail.com";
			String toMail = (String) paramMap.get("email");
			String title = "비밀번호 찾기 안내 이메일 입니다.";
			String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "비밀번호는 " + pw + "입니다.";

			try {
				jakarta.mail.internet.MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);

				request.setAttribute("pwMsg", "비밀번호가 이메일로 전송되었습니다.");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("pwMsg", "이메일 전송 중 오류가 생겼습니다.");
			}
		} 
		return "user/findPwResult";

	}

}
