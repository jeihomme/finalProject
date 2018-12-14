package web.dto;

public class Bar {
	
	private String barNo;
	private String barName;
	private String userId;
	private String profileNo;
	private String locationNo;
	private String barInfo;
	private String manager;
	private String contact;
	
	public String getBarNo() {
		return barNo;
	}
	public void setBarNo(String barNo) {
		this.barNo = barNo;
	}
	public String getBarName() {
		return barName;
	}
	public void setBarName(String barName) {
		this.barName = barName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProfileNo() {
		return profileNo;
	}
	public void setProfileNo(String profileNo) {
		this.profileNo = profileNo;
	}
	public String getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(String locationNo) {
		this.locationNo = locationNo;
	}
	public String getBarInfo() {
		return barInfo;
	}
	public void setBarInfo(String barInfo) {
		this.barInfo = barInfo;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	@Override
	public String toString() {
		return "Bar [barNo=" + barNo + ", barName=" + barName + ", userId=" + userId + ", profileNo=" + profileNo
				+ ", locationNo=" + locationNo + ", barInfo=" + barInfo + ", manager=" + manager + ", contact="
				+ contact + "]";
	}
	


}
