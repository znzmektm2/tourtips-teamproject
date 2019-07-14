package project.model.dto;

public class PopularLocationDTO {
	private String menu;
	private String category;
	private String name;
	private String text;
	private String placeId;
	private String cityId;
	private float avg;
	
	public PopularLocationDTO() {};

	public PopularLocationDTO(String menu, String category, String name, String text, String placeId, String cityId) {
		super();
		this.menu = menu;
		this.category = category;
		this.name = name;
		this.text = text;
		this.placeId = placeId;
		this.cityId = cityId;
	}

	public float getAvg() {
		return avg;
	}

	public void setAvg(float avg) {
		this.avg = avg;
	}

	public String getMenu() {
		return menu;
	}
	
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}

	public String getPlaceId() {
		return placeId;
	}

	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	
	@Override
	public String toString() {
		return "cityId: " + this.cityId + " placeId: " + this.placeId + " menu: " + this.menu;
	}
}
