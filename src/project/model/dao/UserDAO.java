package project.model.dao;

import java.sql.SQLException;
import java.util.List;

import project.model.dto.UserDTO;

public interface UserDAO {
	/*
	 * 1.ȸ���� ��� ������ �˻��ϱ� ���� ��ü �˻�
	 * */
	List<UserDTO> selectAll() throws SQLException;
	
	int insert(UserDTO userDTO);
	
	
	boolean idCheck(String id);
	

	  int update(UserDTO userDTO) throws SQLException;

	  UserDTO selectById(String userId) throws SQLException;

	boolean loginCheck(String id, String pw);
}
