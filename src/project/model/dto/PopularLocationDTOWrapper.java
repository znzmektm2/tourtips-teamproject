package project.model.dto;

import java.util.ArrayList;
import java.util.List;

public class PopularLocationDTOWrapper {

	private String menu;
	private List<PopularLocationDTO> popularLocations = new ArrayList<>();
	
	public PopularLocationDTOWrapper() {}
	
	public PopularLocationDTOWrapper(String menu) {
		this.menu = menu;
	}
	
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public List<PopularLocationDTO> getPopularLocations() {
		return popularLocations;
	}
	public void setPopularLocations(List<PopularLocationDTO> popularLocations) {
		this.popularLocations = popularLocations;
	}
}
