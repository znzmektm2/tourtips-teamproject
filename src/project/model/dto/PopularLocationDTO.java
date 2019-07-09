package project.model.dto;

public class PopularLocationDTO {
	private String menu;
	private String category;
	private String name;
	private String text;
	private String id;
	
	public PopularLocationDTO() {};
	
	public PopularLocationDTO(String menu, String category, String name, String text, String id) {
		super();
		this.menu = menu;
		this.category = category;
		this.name = name;
		this.text = text;
		this.id = id;
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
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
}
