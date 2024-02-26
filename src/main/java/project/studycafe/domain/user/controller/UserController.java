package project.studycafe.domain.user.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.user.model.FindIdReq;
import project.studycafe.domain.user.model.FindPwReq;
import project.studycafe.domain.user.model.LoginReq;
import project.studycafe.domain.user.model.UserEntity;
import project.studycafe.domain.user.service.UserServiceImpl;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/user")
public class UserController {

    private final UserServiceImpl userService;
    private final HttpServletRequest request;

    @GetMapping("/{id}")
    public ResponseEntity<UserEntity> getUser(@PathVariable int id) {
        UserEntity userdto = userService.getUser(id);
        log.info("userdto {}", userdto);

        return ResponseEntity.ok(userdto);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable int id) {
        int result = userService.deleteUser(id);
        String message = "탈퇴 실패했습니다.";

        if (result > 0) {
            message = "탈퇴 성공했습니다.";
        }
        return ResponseEntity.ok(message);
    }

    /**
     * @param loginReq
     * @return 로그인 성공 여부 메시지 -> ajax
     */
    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody LoginReq loginReq) {
        String result = userService.login(loginReq);
        
        return ResponseEntity.ok(result);

    }

    @GetMapping("/logout")
    public String logout(){
        //세션을 삭제
        HttpSession session = request.getSession(false);
        // session이 null이 아니라는건 기존에 세션이 존재했었다는 뜻이므로
        // 세션이 null이 아니라면 session.invalidate()로 세션 삭제해주기.
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/findId")
    public String findId(Model model) {
    	model.addAttribute("findIdReq", new FindIdReq());
    	return "user/findId";
    }
    
    @PostMapping("/findId")
    public String findId(
    		@Validated @ModelAttribute FindIdReq findIdReq,
    		BindingResult bindingResult) {
    	    	
    	if (bindingResult.hasErrors()) {
			log.info("bindingResult: {}", bindingResult);
			
	    	return "user/findId";
		} else {
			String maskedId = userService.findId(findIdReq);		
			
			request.setAttribute("userId", maskedId);
	    	return "user/findIdResult";
		}

    }

    @GetMapping("/findPw")
    public String findPw(Model model) {
    	model.addAttribute("findPwReq", new FindPwReq());
    	return "user/findPw";
    }
    
    @PostMapping("/findPw")
    public String findPw(
    		@Validated @ModelAttribute FindPwReq findPwReq,
    		BindingResult bindingResult, RedirectAttributes redirectAttributes) {
    	
    	//회원가입된 정보와 입력한 정보가 안 맞는 경우
    	String inputUserId = findPwReq.getUserId();
    	String inputEmail = findPwReq.getEmail();
    	int checkUserIdExist = userService.checkUserIdExist(inputUserId);
    	int checkEmailExist = userService.checkEmailExist(inputEmail);

    	String dbEmail = userService.getEmailByUserId(inputUserId);
		String dbUserId = userService.getUserIdByEmail(inputEmail);
		
		//서비스에서 체크 - db 이용
		if(checkUserIdExist < 1 && inputUserId != "") {
			bindingResult.rejectValue("userId", "null.userId", "해당 아이디는 가입된 아이디가 아닙니다.");
		}
		if(checkEmailExist < 1 && inputEmail != "") {
			bindingResult.rejectValue("email", "null.email", "해당 이메일은 가입된 이메일이 아닙니다.");
		}
		if(dbEmail != null && !dbEmail.equals(inputEmail)) {
			bindingResult.rejectValue("email", "invalid.email", "가입된 아이디와 맞지 않는 이메일입니다.");
		}
		if(dbUserId != null && !dbUserId.equals(inputUserId)) {
			bindingResult.rejectValue("userId", "invalid.userId", "가입된 이메일과 맞지 않는 아이디입니다.");
		}
		
    	if (bindingResult.hasErrors()) {
			log.info("bindingResult: {}", bindingResult);
	    	return "user/findPw";
		} else {
			String newPw = userService.findPw(findPwReq);
			log.info("newPw: {}", newPw);
			
			/**
			 * redirect시에 데이터 같이 전송: redirectAttributes.addFlashAttribute("userPw", userPw)
			 * 다른 controller에서 전송된 데이터 받을때
			 * Map<String, ?> paramMap = RequestContextUtils.getInputFlashMap(request);
			 * String pw = (String)paramMap.get("userPw");
			 */
			redirectAttributes.addFlashAttribute("userPw", newPw);
			redirectAttributes.addFlashAttribute("email", findPwReq.getEmail());
			
			return "redirect:/email/sendPassword";
		}
    }

  
}
