package project.studycafe.domain.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.user.model.PatchUserReq;
import project.studycafe.domain.user.service.UserServiceImpl;
import project.studycafe.domain.util.FileService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
@Slf4j
public class MypageController {

	private final UserServiceImpl userService;
	private final FileService fileService;

	private final HttpSession session;

	@GetMapping
	public String getUserInfo(Model model) {
		String nickname = (String) session.getAttribute("userNickname");

		PatchUserReq patchUserReq = userService.getUserByNick(nickname);

		String uploadFileName = fileService.selectFile(patchUserReq.getId());

		patchUserReq.setUploadFileName(uploadFileName);

		model.addAttribute("patchUserReq", patchUserReq);
		return "mypage/updateUserInfo";
	}

	// 수정용 dto: 사진, 비밀번호, 닉네임, 이메일, 주소
	@PostMapping("/update")
	public String updateUser(@Validated @ModelAttribute PatchUserReq patchUserReq, 
			BindingResult bindingResult) throws Exception {

		// 중복체크
		if (userService.myNicknameDuplicateCheck(patchUserReq.getNickname()) != patchUserReq.getId()) {
			bindingResult.rejectValue("nickname", "invalid.nickname", new Object[] { patchUserReq.getNickname() },
					"이미 사용중인 닉네임입니다");
		}

		if (bindingResult.hasErrors()) {
			log.info("bindingResult: {}", bindingResult);
		} else {
			int result = userService.updateUser(patchUserReq);
			patchUserReq.getUserImageDTO().setUserId(patchUserReq.getId()); //이미지 수정용 회원 아이디 전달
			
			fileService.uploadUserImage(patchUserReq.getUserImageDTO());
			
			if (result > 0) {
				return "redirect:/";
			}
		}

		return "mypage/updateUserInfo";

	}

}
