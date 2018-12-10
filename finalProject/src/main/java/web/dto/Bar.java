package web.dto;

public class Bar {
	
	private String barName;
	private String userId;
	private int profileNo;
	private int lovationNo;
	private String barInfo;
	private String manager;
	private int contact;
	
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
	public int getLovationNo() {
		return lovationNo;
	}
	public void setLovationNo(int lovationNo) {
		this.lovationNo = lovationNo;
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
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	
	@Override
	public String toString() {
		return "Bar [barName=" + barName + ", userId=" + userId + ", profileNo=" + profileNo + ", lovationNo="
				+ lovationNo + ", barInfo=" + barInfo + ", manager=" + manager + ", contact=" + contact + "]";
	}
	
	

}
