package project.model.service;

import java.sql.SQLException;
import java.util.Map;

import project.model.dao.ProjectDAO;
import project.model.dto.CityDTO;
import project.model.dto.PlaceDTO;
import project.model.dto.PopularLocationDTO;

public class ProjectService {
	
	private ProjectDAO dao = ProjectDAO.getInstance();

	/////////////////////////////////////////////////
	// City 관련

	public Map<String, CityDTO> selectAllCity() {

		try {
			return dao.selectAllCity();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	/////////////////////////////////////////////////
	// Place 관련
	
	public Map<String, PlaceDTO> selectAllPlace() {
		
		try {
			return dao.selectAllPlace();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/////////////////////////////////////////////////
	// PopularLocation 관련
	
	public Map<String, PopularLocationDTO> selectAllPopular() {
		try {
			return dao.selectAllPopular();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
