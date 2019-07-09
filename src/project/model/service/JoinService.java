package project.model.service;

import java.sql.SQLException;
import java.util.List;

import project.model.dao.UserDAO;
import project.model.dao.UserDAOImpl;
import project.model.dto.UserDTO;

public class JoinService {

	private static UserDAO joinDAO = new UserDAOImpl();
	
	public static  List<UserDTO> selectAll() throws SQLException{
	List<UserDTO> list = joinDAO.selectAll();
	return list;
	}
	
	public static int insert(UserDTO joinDTO) throws SQLException {
		
		int result = joinDAO.insert(joinDTO);
		
		if(result==0) {
			throw new SQLException("회원가입에 실패했습니다.");
		}else {
		if(idCheck(joinDTO.getUserId())) {
			
		}	
		}
		return result;
		
	}
	
	public static boolean idCheck(String id) throws SQLException {
		boolean result = joinDAO.idCheck(id);
		
		if(result = false) {
			throw new SQLException(" �̹� �����ϴ� ���̵��Դϴ�.");
		}
		return result;
		
	}
	 public static UserDTO selectById(String userId) throws SQLException {
			
		 UserDTO joinDTO = joinDAO.selectById(userId);
			 if(joinDTO==null) {
				 throw new SQLException(userId+"가 존재하지 않습니다");
			 }
			return joinDTO;
	 }
	public static int update(UserDTO joinDTO) throws SQLException {
	
		UserDTO dbjoin =
				joinDAO.selectById(joinDTO.getUserId());
		System.out.println(dbjoin);
		if(!dbjoin.getPassword().equals(joinDTO.getPassword())) {
			throw new SQLException("일치하지 않는 비밀번호 입니다");
		}
		int result = joinDAO.update(joinDTO);	
		if(result==0) {
			throw new SQLException("업데이트에 실패 했습니다.");
		}
		return result;
	}
	
	
}
