package project.studycafe.domain.api.user.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import io.jsonwebtoken.Jwts;
import lombok.RequiredArgsConstructor;
import project.studycafe.domain.api.user.dao.UserInfo;
import project.studycafe.domain.user.mapper.UserMapper;

@Service
@RequiredArgsConstructor
public class ApiService {
	
    private static final String KEY = "welcometostudycafechosim";
    private final UserMapper userMapper;
    
	public int getUserIdByToken(String token) {
		Map<String, Object> claim =
				Jwts.parser()
				.setSigningKey(KEY.getBytes())
				.parseClaimsJws(token)
				.getBody();
		
		int id = (int) claim.get("id");
		return id;
	}
	
	public UserInfo getUserInfoById(int id) {
		UserInfo userInfo = userMapper.getUserInfo(id);
		return userInfo;
	}
}
