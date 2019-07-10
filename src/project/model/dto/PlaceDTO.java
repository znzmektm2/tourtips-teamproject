package project.model.dto;

public class PlaceDTO {

	private int id;
	private String name;
	private String cityId;
	private String type;
	private String localName;
	private String website;
	private String area;
	private String enterance;
	private String operating;
	private String howto;
	private String call;
	private String content;

	public PlaceDTO() {
	}

	public PlaceDTO(int id, String name, String cityId, String type, String localName, String website, String area,
			String enterance, String operating, String howto, String call, String content) {
		this.id = id;
		this.name = name;
		this.cityId = cityId;
		this.type = type;
		this.localName = localName;
		this.website = website;
		this.area = area;
		this.enterance = enterance;
		this.operating = operating;
		this.howto = howto;
		this.call = call;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getEnterance() {
		return enterance;
	}

	public void setEnterance(String enterance) {
		this.enterance = enterance;
	}

	public String getOperating() {
		return operating;
	}

	public void setOperating(String operating) {
		this.operating = operating;
	}

	public String getHowto() {
		return howto;
	}

	public void setHowto(String howto) {
		this.howto = howto;
	}

	public String getCall() {
		return call;
	}

	public void setCall(String call) {
		this.call = call;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
