package web.dto;


public class Location {
	
	// 위치 번호
	private String locationNo;
	
	// 위치 주소
	private String locationName;

	public String getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(String locationNo) {
		this.locationNo = locationNo;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	@Override
	public String toString() {
		return "Location [locationNo=" + locationNo + ", locationName=" + locationName + "]";
	}


	
}
