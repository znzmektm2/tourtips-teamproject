package project.model.service;

import java.sql.SQLException;
import project.model.dao.UserDAO;
import project.model.dto.UserDTO;

public class UserService {

	private static UserDAO dao = new UserDAO();

	/**
	 * 로그인 메소드.
	 * @param userId
	 * @param userPwd
	 * @return
	 * @throws SQLException
	 */
	public static UserDTO LogIn(String userId, String userPwd) throws SQLException {
		UserDTO selected = dao.selectById(userId);
		if(selected != null && userId.equals(selected.getName()) && userPwd.equals(selected.getPassword()) ) {
			return selected;
		} else {
			throw new SQLException("회원정보가 맞지 않습니다.");
		}
		//return dao.loginCheck(userId, userPwd);
	}
	
	/**
	 * id로 유저를 선택하는 메소드.
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	public static UserDTO selectById(String userId) throws SQLException {

		UserDTO user = dao.selectById(userId);
		if (user == null) {
			throw new SQLException(userId + "가 존재하지 않습니다");
		}
		return user;
	}
	
	/**
	 * 회원가입을 하는 메소드.
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	public static int insert(UserDTO user) throws SQLException {
		
		int result = dao.insert(user);
		
		if(result == 0)
			throw new SQLException("저장에 실패하였습니다.");
		return result;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public static boolean idCheck(String id) throws SQLException {
		boolean result = dao.idCheck(id);
		if (result) {
			throw new SQLException("중복된 아이디입니다.");
		}
		return result;
	}
	
	/**
	 * 유저정보 수정
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	public static int update(UserDTO user) throws SQLException {

		UserDTO dbjoin = dao.selectById(user.getUserId());
		System.out.println(dbjoin);
		if (!dbjoin.getPassword().equals(user.getPassword())) {
			throw new SQLException("일치하지 않는 비밀번호 입니다");
		}
		int result = dao.update(user);
		System.out.println(result);
		if (result == 0) {
			throw new SQLException("업데이트에 실패 했습니다.");
		}
		return result;
	}
}
