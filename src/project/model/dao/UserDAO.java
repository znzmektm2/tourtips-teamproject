package project.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.model.dto.UserDTO;
import project.model.dao.DbUtil;

public class UserDAO {

	public List<UserDTO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UserDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM USERLIST";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				UserDTO dto = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(dto);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	/**
	 * ID로 검색하기
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	public UserDTO selectById(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO user = null;
		String sql = "select * from userlist where user_Id=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			if (rs.next()) {
				user = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return user;
	}
	/**
	 * 회원가입 
	 * @param userDTO
	 * @return
	 * @throws SQLException
	 */
	public int insert(UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into userlist (user_Id,password,name,email) values(?,?,?,?)";
		int result = 0;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userDTO.getUserId());
			ps.setString(2, userDTO.getPassword());
			ps.setString(3, userDTO.getName());
			ps.setString(4, userDTO.getEmail());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	/**
	 * 중복체크
	 * @param id
	 * @return
	 */
	public boolean idCheck(String id) {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from userlist where user_Id=?";
		boolean result = false;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}

	/**
	 * 
	 * @param userDTO
	 * @return
	 * @throws SQLException
	 */
	public int update(UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update userlist set password=?,name=?,email=?where user_Id=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userDTO.getPassword());
			ps.setString(2, userDTO.getName());
			ps.setString(3, userDTO.getEmail());
			ps.setString(4, userDTO.getUserId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}


	public boolean loginCheck(String userId, String password) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select password FROM userlist WHERE user_Id=?";
		String dbPW = "";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			if (rs.next()) {
				dbPW = rs.getString("password");
				System.out.println("dbPw:" + dbPW);
				System.out.println("pw:" + password);
				if (dbPW.equals(password)) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return false;
	}
}
