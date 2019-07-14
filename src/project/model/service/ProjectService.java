package project.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	
	public Map<String, List<PopularLocationDTO>> selectAllPopular() {
		try {
			List<PopularLocationDTO> popularList = dao.selectAllPopular();
			Map<String, List<PopularLocationDTO>> result = new HashMap<>();
			
			for(PopularLocationDTO dto : popularList) {
				if(!result.containsKey(dto.getCityId())) {
					result.put(dto.getCityId(), new ArrayList<>());
				}
				List<PopularLocationDTO> locations = result.get(dto.getCityId());
				locations.add(dto);
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Map<String, PopularLocationDTO> selectAllPopularByPlaceId() {
		try {
			List<PopularLocationDTO> popularList = dao.selectAllPopular();
			Map<String, PopularLocationDTO> result = new HashMap<>();
			
			for(PopularLocationDTO dto : popularList) {
				result.put(dto.getPlaceId(), dto);
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
