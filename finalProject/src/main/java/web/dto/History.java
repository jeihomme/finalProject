package web.dto;

public class History {
	private int historyNo;
	private int year;
	private String historyInfo;
	@Override
	public String toString() {
		return "History [historyNo=" + historyNo + ", year=" + year + ", historyInfo=" + historyInfo + "]";
	}
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getHistoryInfo() {
		return historyInfo;
	}
	public void setHistoryInfo(String historyInfo) {
		this.historyInfo = historyInfo;
	}
	
	
}