package project.model.service;

import java.sql.SQLException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import project.model.dao.UserDAO;
import project.model.dao.UserDAOImpl;
import project.model.dto.UserDTO;

public class LoginService {

	private static UserDAO joinDAO = new UserDAOImpl();
	
	public static boolean LogIn(String userId,String userPwd) 
	throws SQLException{
	boolean loginCheck = joinDAO.loginCheck(userId, userPwd);
	System.out.println("loginCheck :"+loginCheck);
	if(loginCheck) {
		return true;
	}else {
	return false;
	}
	}
}
