package project.studycafe.domain.user.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.user.model.EmailDuplicateCheckReq;
import project.studycafe.domain.user.model.EmailDuplicateCheckRes;
import project.studycafe.domain.user.model.SignUpReq;
import project.studycafe.domain.user.service.UserServiceImpl;

@Controller
@RequiredArgsConstructor
@RequestMapping("/signup")
@Slf4j
public class SignUpController {

	private final UserServiceImpl userService;
	private final PasswordEncoder passwordEncoder;

	@GetMapping
	public String signup(Model model) {
        model.addAttribute("signUpReq", new SignUpReq());
        return "user/signup";
    }
	
	// api 이름 변경
	// 가입용 dto: 아이디, 비밀번호, 이름, 닉네임, 이메일, 주소
	@PostMapping
	public String signup(@Validated @ModelAttribute SignUpReq signUpReq, 
			BindingResult bindingResult){

		//중복체크 - 중복체크가 회원가입 버튼 누르기 전에 미리 되는게 나을지도
		if(userService.nicknameDuplicateCheck(signUpReq.getNickname())==1) {
			bindingResult.rejectValue("nickname", "invalid.nickname", new Object[]{signUpReq.getNickname()}, "이미 사용중인 닉네임입니다");
		}
		
		if(userService.idDuplicateCheck(signUpReq.getUserId())==1) {
			bindingResult.rejectValue("userId","invalid.userId", new Object[]{signUpReq.getUserId()}, "이미 사용중인 아이디입니다");
		}
		
		//비밀번호 중복 확인
		if(!userService.checkPw(signUpReq.getUserPw(), signUpReq.getCheckPw())) {
			bindingResult.rejectValue("checkPw", "invalid.checkPw", new Object[] {signUpReq.getCheckPw()}, "입력하신 비밀번호가 올바르지 않습니다. 비밀번호 확인 후 다시 입력해주세요.");
		}
			
		//이메일 인증 확인절차
		if(!signUpReq.isHasSentEmailAuth()) {
			bindingResult.rejectValue("hasSentEmailAuth", "invalid.hasSentEmailAuth", new Object[]{signUpReq.isHasSentEmailAuth()}, "인증번호 받기 버튼을 눌러주세요.");
		}
		
		if(!signUpReq.isHasCheckedEmailAuth()) {
			bindingResult.rejectValue("hasCheckedEmailAuth", "invalid.hasCheckedEmailAuth", new Object[]{signUpReq.isHasCheckedEmailAuth()}, "새로 인증번호를 받은 후 인증번호 입력하고 인증번호 확인 버튼을 눌러주세요.");
		}
		
		if (bindingResult.hasErrors()) {
			log.info("bindingResult: {}", bindingResult);
		} else {
			//역할
			String role = "normal";
			if((signUpReq.getUserId()).equals("admin0915")){
				role = "admin";
				signUpReq.setRole(role);
			} else {
				signUpReq.setRole(role);
			}
			
		    String encodedPwd = passwordEncoder.encode(signUpReq.getUserPw()); //암호화 하는부분
		    signUpReq.setUserPw(encodedPwd);
		    
			int result = userService.insertUser(signUpReq);
			if (result > 0) {
				return "redirect:/";
			}
		}
		
		return "user/signup";

	}

	@PostMapping("/emailDuplicateCheck")
	public ResponseEntity<EmailDuplicateCheckRes> emailDuplicateCheck(@RequestBody EmailDuplicateCheckReq emailDuplicateCheckReq){
		String email = emailDuplicateCheckReq.getEmail();
		log.info("email: {}", email);
		int result = userService.emailDuplicateCheck(email);
		log.info("result: {}",result);
		
		EmailDuplicateCheckRes res = new EmailDuplicateCheckRes();
		if(result > 0) {
			res.setEmailDuplicated(true);
		}
		return ResponseEntity.ok(res);
	}
	
}
