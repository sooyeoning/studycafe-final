package project.studycafe.domain.user.service;

import project.studycafe.domain.user.model.FindIdReq;
import project.studycafe.domain.user.model.FindPwReq;
import project.studycafe.domain.user.model.LoginReq;
import project.studycafe.domain.user.model.PatchUserReq;
import project.studycafe.domain.user.model.SignUpReq;
import project.studycafe.domain.user.model.UserEntity;

public interface UserService {
    UserEntity getUser(int userId);

    int insertUser(SignUpReq signUpReq);

    int updateUser(PatchUserReq patchUserReq);

    int deleteUser(int id);

    String login(LoginReq loginReq);
    
    String findId(FindIdReq findIdReq);

    String findPw(FindPwReq findPwReq);
}
