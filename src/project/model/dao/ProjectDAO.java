package project.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.model.dto.CityDTO;
import project.model.dto.PlaceDTO;
import project.model.dto.PopularLocationDTO;
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

	public Map<String, CityDTO> selectAllCity() throws SQLException {

		String sql = "SELECT * FROM CITY";

		Connection conn = DbUtil.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Map<String, CityDTO> result = new HashMap<>();

		while (rs.next()) {
			String id = rs.getString("CITY_ID");
			String name = rs.getString("NAME");
			String region = rs.getString("REGION");
			int localTime = Integer.parseInt(rs.getString("LOCAL_TIME"));
			String bestSeoson = rs.getString("BEST_SEASON");
			String voltage = rs.getString("VOLTAGE");
			String visaStatus = rs.getString("VISA_STATUS");
			result.put(id, new CityDTO(id, name, region, localTime, bestSeoson, voltage, visaStatus));
		}
		return result;
	}

	/////////////////////////////////////////////////
	// Place 관련

	public Map<String, PlaceDTO> selectAllPlace() throws SQLException {
		String sql = "SELECT * FROM PLACE";

		Connection conn = DbUtil.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Map<String, PlaceDTO> result = new HashMap<>();

		while (rs.next()) {
			String id = rs.getString("PLACE_ID");
			String name = rs.getString("NAME");
			String cityId = rs.getString("CITY_ID");
			String type = rs.getString("TYPE");
			String localTime = rs.getString("LOCAL_NAME");
			String website = rs.getString("WEBSITE");
			String area = rs.getString("AREA");
			String enterance = rs.getString("ENTERANCE");
			String operating = rs.getString("OPERATING");
			String howto = rs.getString("HOWTO");
			String call = rs.getString("CALL");
			String content = rs.getString("CONTENT");
			
			result.put(id, new PlaceDTO(id, name, cityId, type,localTime, website, area, enterance, operating, howto, call, content));
			
		}
		return result;
	}

	/////////////////////////////////////////////////
	// PopularLocation 관련
	
	public Map<String, PopularLocationDTO> selectAllPopular() throws SQLException {
		String sql = "SELECT * FROM  POPULAR_LOACTION";

		Connection conn = DbUtil.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Map<String, PopularLocationDTO> result = new HashMap<>();

		while (rs.next()) {
			String nemu = rs.getString("MENU");
			String category = rs.getString("CATEGORY");
			String cityname = rs.getString("NAME");
			String text = rs.getString("TEXT");
			String id = rs.getString("PLACE_ID");
			result.put(id, new PopularLocationDTO(nemu, category, cityname, text, id));
		}
		return result;
	}
	
}
