package project.studycafe.domain.user.mapper;

import project.studycafe.domain.user.model.*;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    UserEntity getUser(int id);

    int insertUser(SignUpReq signUpReq);

    int updateUser(PatchUserReq patchUserReq);

    int deleteUser(int id);

    UserEntity login(String userId);

    String findId(FindIdReq findIdReq);
    
    String getEmailByUserId(String userId);
    
    String getUserIdByEmail(String email);
    
    int checkUserIdExist(String userId);

    int checkNicknameExist(String nickname);
    
    int checkMyNicknameExist(String nickname);

	PatchUserReq getUserByNick(String nickname);

	int checkEmailExist(String email);

	String getUserPwByUserId(String userId);

	int updateUserPwByEmailAndUserId(UpdatePwReq updatePwReq);
	
	//비밀번호 찾기시 새로운 비밀번호 생성 후 db 수정
	int updateUserPw(FindPwReq findPwReq);
	
	//비밀번호 수정
    int updateUserPw(PatchUserPwReq patchUserPwReq);

    void updateUserPlaceId(PatchUserPlaceIdReq patchUserPlaceIdReq);
    GetPlaceInfoByUserIdRes getPlaceInfoByUserId(int userId);


}
