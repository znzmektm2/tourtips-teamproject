package project.model.dto;

public class CityDTO {
  
    private String cityId;
    private String name;
    private String region;
    private int localTime;
    private String bestSeason;
    private String voltage;
    private String visaStatus;

    public CityDTO() {
	}

	public CityDTO(String cityId, String name, String region, int localTime, String bestSeason, String voltage,
			String visaStatus) {
		this.cityId = cityId;
		this.name = name;
		this.region = region;
		this.localTime = localTime;
		this.bestSeason = bestSeason;
		this.voltage = voltage;
		this.visaStatus = visaStatus;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
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
		return "CityDTO [cityId=" + cityId + ", name=" + name + ", region=" + region + ", localTime=" + localTime
				+ ", bestSeason=" + bestSeason + ", voltage=" + voltage + ", visaStatus=" + visaStatus + "]";
	}
}
