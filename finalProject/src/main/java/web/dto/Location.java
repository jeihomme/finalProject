package web.dto;

public class Location {
	
	// 위치 번호
	private int locationNo;
	
	// 위치 주소
	private String locationName;
	
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
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
