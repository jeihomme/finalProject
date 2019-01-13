package web.dto;

public class CalendarD {
	
	private int calendarNo;
	private String calendarDate;
	private int barNo;
	private String barName;
	private int bandNo;
	private String bandName;
	private String startTime;
	private String endTime;
	@Override
	public String toString() {
		return "CalendarD [calendarNo=" + calendarNo + ", calendarDate=" + calendarDate + ", barNo=" + barNo
				+ ", barName=" + barName + ", bandNo=" + bandNo + ", bandName=" + bandName + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}
	public int getCalendarNo() {
		return calendarNo;
	}
	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}
	public String getCalendarDate() {
		return calendarDate;
	}
	public void setCalendarDate(String calendarDate) {
		this.calendarDate = calendarDate;
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
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
}
