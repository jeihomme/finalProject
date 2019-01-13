package web.dto;

public class Application {
	private int appNo;
	private int resumesNo;
	private String barName;
	private String appDate;
	private int accept;
	private int read;
	private int decliend;
	private int applied;
	private int calendarNo;
	
	@Override
	public String toString() {
		return "Application [appNo=" + appNo + ", resumesNo=" + resumesNo + ", barName=" + barName + ", appDate="
				+ appDate + ", accept=" + accept + ", read=" + read + ", decliend=" + decliend + ", applied=" + applied
				+ ", calendarNo=" + calendarNo + "]";
	}
	public int getAppNo() {
		return appNo;
	}
	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}
	public int getResumesNo() {
		return resumesNo;
	}
	public void setResumesNo(int resumesNo) {
		this.resumesNo = resumesNo;
	}
	public String getBarName() {
		return barName;
	}
	public void setBarName(String barName) {
		this.barName = barName;
	}
	public String getAppDate() {
		return appDate;
	}
	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}
	public int getAccept() {
		return accept;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public int getDecliend() {
		return decliend;
	}
	public void setDecliend(int decliend) {
		this.decliend = decliend;
	}
	public int getApplied() {
		return applied;
	}
	public void setApplied(int applied) {
		this.applied = applied;
	}
	public int getCalendarNo() {
		return calendarNo;
	}
	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}
}
