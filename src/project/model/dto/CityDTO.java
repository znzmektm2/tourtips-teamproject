package project.model.dto;

public class CityDTO {
  
    private String id;
    private String name;
    private String region;
    private int localTime;
    private String bestSeason;
    private String voltage;
    private String visaStatus;
    
	public CityDTO() {
	}
	
	public CityDTO(String id, String name, String region, int localTime, String bestSeason, String voltage,
			String visaStatus) {
		this.id = id;
		this.name = name;
		this.region = region;
		this.localTime = localTime;
		this.bestSeason = bestSeason;
		this.voltage = voltage;
		this.visaStatus = visaStatus;
	}
	public String getId() {
		return id;
	}
	public void setCity(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getLocalTime() {
		return localTime;
	}
	public void setLocalTime(int localTime) {
		this.localTime = localTime;
	}
	public String getBestSeason() {
		return bestSeason;
	}
	public void setBestSeason(String bestSeason) {
		this.bestSeason = bestSeason;
	}
	public String getVoltage() {
		return voltage;
	}
	public void setVoltage(String voltage) {
		this.voltage = voltage;
	}
	public String getVisaStatus() {
		return visaStatus;
	}
	public void setVisaStatus(String visaStatus) {
		this.visaStatus = visaStatus;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CityDTO [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", region=");
		builder.append(region);
		builder.append(", localTime=");
		builder.append(localTime);
		builder.append(", bestSeason=");
		builder.append(bestSeason);
		builder.append(", voltage=");
		builder.append(voltage);
		builder.append(", visaStatus=");
		builder.append(visaStatus);
		builder.append("]");
		return builder.toString();
	}
	
	
}
