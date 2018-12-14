package web.dto;

public class Band {
	private String BandNo;
	private String bandName;
	private String userId;
	private int profileNo;
	private int calendarNo;
	@Override
	public String toString() {
		return "Band [BandNo=" + BandNo + ", bandName=" + bandName + ", userId=" + userId + ", profileNo=" + profileNo
				+ ", calendarNo=" + calendarNo + "]";
	}
	public String getBandNo() {
		return BandNo;
	}
	public void setBandNo(String bandNo) {
		BandNo = bandNo;
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
	public int getCalendarNo() {
		return calendarNo;
	}
	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}
	
	
	
	
}
