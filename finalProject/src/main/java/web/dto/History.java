package web.dto;

public class History {
	private int historyNo;
	private int resumesNo;
	private String year;
	private String historyInfo;
	@Override
	public String toString() {
		return "History [historyNo=" + historyNo + ", resumesNo=" + resumesNo + ", year=" + year
				+ ", historyInfo=" + historyInfo + "]";
	}
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public int getResumesNo() {
		return resumesNo;
	}
	public void setResumesNo(int resumesNo) {
		this.resumesNo = resumesNo;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getHistoryInfo() {
		return historyInfo;
	}
	public void setHistoryInfo(String historyInfo) {
		this.historyInfo = historyInfo;
	}
	
	
}