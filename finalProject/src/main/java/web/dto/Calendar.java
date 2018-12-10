package web.dto;

public class Calendar {
	
	private int calendarId;
	private String barName;
	private String bandName;
	
	public int getCalendarId() {
		return calendarId;
	}
	public void setCalendarId(int calendarId) {
		this.calendarId = calendarId;
	}
	public String getBarName() {
		return barName;
	}
	public void setBarName(String barName) {
		this.barName = barName;
	}
	public String getBandName() {
		return bandName;
	}
	public void setBandName(String bandName) {
		this.bandName = bandName;
	}
	
	@Override
	public String toString() {
		return "Calendar [calendarId=" + calendarId + ", barName=" + barName + ", bandName=" + bandName + "]";
	}

}
