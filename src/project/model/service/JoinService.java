package project.model.service;

import java.sql.SQLException;
import java.util.List;

import project.model.dao.UserDAO;
import project.model.dto.UserDTO;

public class JoinService {

	private static UserDAO joinDAO = new UserDAO();

	public static List<UserDTO> selectAll() throws SQLException {
		List<UserDTO> list = joinDAO.selectAll();
		return list;
	}

	public static int update(UserDTO joinDTO) throws SQLException {

		UserDTO dbjoin = joinDAO.selectById(joinDTO.getUserId());
		System.out.println(dbjoin);
		if (!dbjoin.getPassword().equals(joinDTO.getPassword())) {
			throw new SQLException("일치하지 않는 비밀번호 입니다");
		}
		int result = joinDAO.update(joinDTO);
		if (result == 0) {
			throw new SQLException("업데이트에 실패 했습니다.");
		}
		return result;
	}
}
