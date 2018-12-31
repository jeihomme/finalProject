package web.dto;

public class Band {
	private int rnum;
	private int bandNo;
	private String bandName;
	private String userId;
	private int profileNo;
	private int calendarNo;

	@Override
	public String toString() {
		return "Band [rnum=" + rnum + ", bandNo=" + bandNo + ", bandName=" + bandName + ", userId=" + userId
				+ ", profileNo=" + profileNo + ", calendarNo=" + calendarNo + "]";
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getBandNo() {
		return bandNo;
	}
	public void setBandNo(int bandNo) {
		this.bandNo = bandNo;
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
