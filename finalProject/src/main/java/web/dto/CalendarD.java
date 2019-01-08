package web.dto;

public class CalendarD {
	
	private String calendarNo;
	private String calendarDate;
	private String barNo;
	private String bandNo;
	private String startTime;
	private String endTime;
	
	@Override
	public String toString() {
		return "CalendarDTO [calendarNo=" + calendarNo + ", calendarDate=" + calendarDate + ", barNo=" + barNo
				+ ", bandNo=" + bandNo + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	public String getCalendarNo() {
		return calendarNo;
	}
	public void setCalendarNo(String calendarNo) {
		this.calendarNo = calendarNo;
	}
	public String getCalendarDate() {
		return calendarDate;
	}
	public void setCalendarDate(String calendarDate) {
		this.calendarDate = calendarDate;
	}
	public String getBarNo() {
		return barNo;
	}
	public void setBarNo(String barNo) {
		this.barNo = barNo;
	}
	public String getBandNo() {
		return bandNo;
	}
	public void setBandNo(String bandNo) {
		this.bandNo = bandNo;
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
