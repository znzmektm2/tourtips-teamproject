package project.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.model.dto.CityDTO;
import project.model.dto.PlaceDTO;
import project.util.DbUtil;

public class ProjectDAO {
	
	static ProjectDAO instance = new ProjectDAO();
	
	private ProjectDAO() {
		
	}

	static public ProjectDAO getInstance() {
		return instance;
	}
	
	/////////////////////////////////////////////////
	// City 관련
	
	public List<CityDTO> selectAllCity() throws SQLException {
		
		String sql = "SELECT * FROM CITY";
		
		Connection conn = DbUtil.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<CityDTO> result = new ArrayList<CityDTO>();
		
		while(rs.next()) {
			
		}
		
		return result;	
	}

	
	public List<PlaceDTO> selectAllPlace() {
		return null;
	}
}
