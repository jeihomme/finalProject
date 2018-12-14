package web.dto;

public class Bar {
	
	private int barNo;
	private String barName;
	private String userId;
	private int profileNo;
	private int locationNo;
	private int contact;
	private String barInfo;
	private String manager;
	
	@Override
	public String toString() {
		return "Bar [barNo=" + barNo + ", barName=" + barName + ", userId=" + userId + ", profileNo=" + profileNo
				+ ", locationNo=" + locationNo + ", contact=" + contact + ", barInfo=" + barInfo + ", manager="
				+ manager + "]";
	}

	public int getBarNo() {
		return barNo;
	}

	public void setBarNo(int barNo) {
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

	public int getProfileNo() {
		return profileNo;
	}

	public void setProfileNo(int profileNo) {
		this.profileNo = profileNo;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public int getContact() {
		return contact;
	}

	public void setContact(int contact) {
		this.contact = contact;
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
	
	
	
	
	

}
