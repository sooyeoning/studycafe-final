package project.studycafe.domain.user.service;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.user.mapper.UserMapper;
import project.studycafe.domain.user.model.FindIdReq;
import project.studycafe.domain.user.model.FindPwReq;
import project.studycafe.domain.user.model.GetPlaceInfoByUserIdRes;
import project.studycafe.domain.user.model.LoginReq;
import project.studycafe.domain.user.model.PatchUserPwReq;
import project.studycafe.domain.user.model.PatchUserReq;
import project.studycafe.domain.user.model.SignUpReq;
import project.studycafe.domain.user.model.UpdatePwReq;
import project.studycafe.domain.user.model.UserEntity;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {

	private final UserMapper userMapper;
	private final PasswordEncoder passwordEncoder;
	private final HttpServletRequest request;

	@Override
	public UserEntity getUser(int id) {
		return userMapper.getUser(id);
	}

	public PatchUserReq getUserByNick(String nickname) {
		return userMapper.getUserByNick(nickname);
	}

	@Override
	public int insertUser(SignUpReq signUpReq) {
		return userMapper.insertUser(signUpReq);
	}

	@Override
	public int updateUser(PatchUserReq patchUserReq) {
		HttpSession session = request.getSession();
		session.setAttribute("userNickname", patchUserReq.getNickname());

		return userMapper.updateUser(patchUserReq);
	}

	@Override
	public int deleteUser(int id) {
		return userMapper.deleteUser(id);
	}

	@Override
	public String login(LoginReq loginReq) {
		//https://kedric-me.tistory.com/entry/Spring-Password-Encoder-%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8-%EC%95%94%ED%98%B8%ED%99%94#%EC%99%9C%20%EC%9D%B4%EB%9F%B0%20%EC%95%94%ED%98%B8%ED%99%94%EB%A5%BC%20%EC%93%B0%EA%B3%A0%20%EC%96%B4%EB%96%A4%EC%8B%9D%EC%9C%BC%EB%A1%9C%20%EC%95%94%ED%98%B8%ED%99%94%20%EB%90%98%EB%8A%94%EC%A7%80%20%EC%95%8C%EC%95%84%EB%B3%B4%EC%9E%90.-1
		//입력한 비밀번호와 db 비밀번호(입력한 아이디와 맞는 비밀번호 가져오기) 맞는지 확인
		
		String resultmsg = "로그인 실패";
		String userId = loginReq.getUserId();
		String userPw = loginReq.getUserPw();
		
		boolean passwordAuth = passwordEncoder.matches(userPw, userMapper.getUserPwByUserId(userId));
			
			if(passwordAuth == true) {
				UserEntity user = userMapper.login(userId);
				HttpSession session = request.getSession();
				
				session.setAttribute("id", user.getId());
				session.setAttribute("userNickname", user.getNickname());
				session.setAttribute("userId", userId);
				session.setAttribute("userRole", user.getRole());
				session.setAttribute("address", user.getAddress()); //관심 있는 지역
				session.setAttribute("isLogin", true);

				resultmsg = "로그인 성공";
		}

		return resultmsg;
	}

	@Override
	public String findId(FindIdReq findIdReq) {
		// 마스킹 처리
		if (userMapper.findId(findIdReq) != null) {
			String userId = userMapper.findId(findIdReq);

			// 아이디 길이 구하기
			int userIdLength = userId.length();

			// 시작 인덱스, 끝+1 인덱스
			String firstId = userId.substring(0, 2);
			String lastId = userId.substring(userIdLength - 2, userIdLength);
			String middleId = "*".repeat(userIdLength - 4);

			String maskedId = firstId + middleId + lastId;
			return maskedId;
		} else {
			return "입력하신 정보에 해당하는 아이디가 없습니다.";
		}

	}

	/**
	 * return 새로 생성한 비밀번호
	 */
	@Override
	public String findPw(FindPwReq findPwReq) {
		String dbEmail = this.getEmailByUserId(findPwReq.getUserId());
		String dbUserId = this.getUserIdByEmail(findPwReq.getEmail());
		
		//비밀번호 재설정
		//1 비밀번호 새로 만들기
		//랜덤 Ascii 값으로만 이뤄진 8개 문자열 반환
		String stringNewPw = String.valueOf(RandomStringUtils.randomAscii(8));
		
		//2 새로 만든 비밀번호 db에 저장
	    String encodedPw = passwordEncoder.encode(stringNewPw); //암호화 하는부분

		UpdatePwReq updatePwReq = new UpdatePwReq(dbEmail, dbUserId, encodedPw);
		userMapper.updateUserPwByEmailAndUserId(updatePwReq);
		
		//3 새로 만들어진 비밀번호 전달
		return stringNewPw;
	}

	public String getEmailByUserId(String userId) {
		return userMapper.getEmailByUserId(userId);
	};

	public String getUserIdByEmail(String email) {
		return userMapper.getUserIdByEmail(email);
	};

	public int idDuplicateCheck(String userId) {
		int result = this.checkUserIdExist(userId);
		log.info("resultId: {}", result);
		return result;
	}

	public int nicknameDuplicateCheck(String nickname) {
		int result = userMapper.checkNicknameExist(nickname);
		log.info("resultNick: {}", result);
		return result;
	}

	public int emailDuplicateCheck(String email) {
		log.info("email: {}", email);
		int result = this.checkEmailExist(email);
		log.info("resultEmail: {}", result);
		return result;
	}

	public boolean checkPw(String pw, String checkPw) {
		boolean result = false;
		if (pw.equals(checkPw)) {
			result = true;
		}
		return result;
	}

	public String getUserPw(String userId) {
		return userMapper.getUserPwByUserId(userId);
	}

	public int updateUserPw(PatchUserPwReq patchUserPwReq) {
		return userMapper.updateUserPw(patchUserPwReq);
	}
	
	public int checkUserIdExist(String userId) {
		return userMapper.checkUserIdExist(userId);
	}
	
	public int checkEmailExist(String email) {
		return userMapper.checkEmailExist(email);
	}

	public GetPlaceInfoByUserIdRes getPlaceInfoByUserId(int userId) {
		return userMapper.getPlaceInfoByUserId(userId);
	}

	public int myNicknameDuplicateCheck(String nickname) {
		return userMapper.checkMyNicknameExist(nickname);
	}



}
