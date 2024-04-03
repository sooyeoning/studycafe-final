package project.studycafe.web;


import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.user.model.PatchUserPwReq;
import project.studycafe.domain.user.service.UserServiceImpl;

@Controller
@RequestMapping("/web/mypage")
@Slf4j
@RequiredArgsConstructor
public class WebMypageController {

	private final UserServiceImpl userService;
	private final HttpSession session;
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping("/info")
	public String updateUserInfoAuth() {
		return "mypage/updateUserInfoAuth";
	}

	//비밀번호 변경
	@GetMapping("/password")
	public String updateUserPw(Model model) {
		PatchUserPwReq patchUserPwReq = new PatchUserPwReq();
		model.addAttribute("patchUserPwReq", patchUserPwReq);
		
		return "mypage/updateUserPw";
	}
	
	//input 이이디에 맞는 현재 비밀번호 가져오기
  	//input 현재 비밀번호와 db상 비밀번호 맞는지 확인 - 맞지 않으면 현재 비밀번호 입력 오류
  	//input 새 비밀번호와 새 비밀번호 확인 맞는지 확인
  	@PostMapping("/password")
  	public String updateUserPw(
  			@Validated @ModelAttribute PatchUserPwReq patchUserPwReq,
  			BindingResult bindingResult) {
  	
  		if(bindingResult.hasErrors()) {
  			log.info("BindingResult Error: {}", bindingResult);
  		} else {
  			
  			//input 이이디에 맞는 db에 저장된 비밀번호 가져오기
  			String originDbPw = userService.getUserPw(patchUserPwReq.getUserId());
  			log.info("originDbPw: {}", originDbPw);
  			log.info("inputOriginPw: {}",patchUserPwReq.getOriginPw());
  			
  			//input 비밀번호랑 db에 암호화된 비밀번호랑 같은지 확인
  			String inputOriginPw = patchUserPwReq.getOriginPw();
  			boolean passwordAuth = passwordEncoder.matches(inputOriginPw, originDbPw);
  			
  			if(!passwordAuth) {
  				bindingResult.rejectValue("originPw", "invalid.originPw", new Object[] {inputOriginPw}, "입력하신 비밀번호가 올바르지 않습니다. 비밀번호 확인 후 다시 입력해주세요.");
  				return "mypage/updateUserPw"; //필수로 view 리턴해줘야 error 값 노출 가능
  			}
  			
  			String newPw = patchUserPwReq.getNewPw();
  			log.info("newPw: {}", newPw);
  			
  			//input 새 비밀번호와 기존 비밀번호 같은지 확인
  			boolean passwordOriginAuth = passwordEncoder.matches(newPw, originDbPw);

  			if(passwordOriginAuth) {
  				bindingResult.rejectValue("newPw", "invalid.newPw", new Object[] {newPw}, "변경할 비밀번호가 현재 비밀번호와 동일합니다. 새로운 비밀번호를 입력해주세요.");
  				return "mypage/updateUserPw"; //필수로 view 리턴해줘야 error 값 노출 가능
  			}
  			
  			
  			//input 새 비밀번호와 새 비밀번호 확인 맞는지 확인
  			if(!newPw.equals(patchUserPwReq.getCheckNewPw())) {
  				bindingResult.rejectValue("checkNewPw", "invalid.checkNewPw", new Object[] {patchUserPwReq.getCheckNewPw()}, "변경할 비밀번호를 위와 동일하게 입력해주세요.");
  				return "mypage/updateUserPw"; //필수로 view 리턴해줘야 error 값 노출 가능
  			}
  			
  			//db 비밀번호 수정 - 새로운 비밀번호 암호화
  			log.info("before encoding newPw: {}", newPw);

  		    String encodedPw = passwordEncoder.encode(newPw); //암호화 하는부분
  		    patchUserPwReq.setNewPw(encodedPw);
  		    patchUserPwReq.setOriginPw(originDbPw);
  		    
  			//홈으로 이동?
  			int result = userService.updateUserPw(patchUserPwReq);
  			if(result > 0) {
  				return "mypage/updateUserPwSuccess";
  			} else {
  				return "mypage/updateUserPwError";
  			}
  		}
			return "mypage/updateUserPw"; //필수로 view 리턴해줘야 error 값 노출 가능
  	
  	}
	
	//회원 삭제
	@GetMapping("/out/auth")
	public String deleteUserAuth() {
		return "mypage/deleteUserAuth";
	}
	
	//회원 삭제
	@GetMapping("/out")
	public String getDeleteUserPage() {
		return "mypage/deleteUser";
	}
	
	@DeleteMapping("/out/{id}")
	@ResponseBody
	public int deleteUser(@PathVariable int id) {
		int result = userService.deleteUser(id);
		
		//세션을 삭제
        session.invalidate();
        
		return result;
	}
}
