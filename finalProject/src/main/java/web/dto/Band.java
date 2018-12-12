package web.dto;

public class Band {
	private String bandName;
	private String userId;
	private int profileNo;
	@Override
	public String toString() {
		return "Band [bandName=" + bandName + ", userId=" + userId + ", profileNo=" + profileNo + "]";
	}
	public String getBandName() {
		return bandName;
	}
	public void setBandName(String bandName) {
		this.bandName = bandName;
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
	
	
}
