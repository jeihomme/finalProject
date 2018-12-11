package web.dto;

public class Resume {
	private int resumeNo;
	private String bandName;
	private int historyNo;
	private String BandInfo;
	private int musicNo;
	
	@Override
	public String toString() {
		return "Resume [resumeNo=" + resumeNo + ", bandName=" + bandName + ", historyNo=" + historyNo + ", BandInfo="
				+ BandInfo + ", musicNo=" + musicNo + "]";
	}
	
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getBandName() {
		return bandName;
	}
	public void setBandName(String bandName) {
		this.bandName = bandName;
	}
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public String getBandInfo() {
		return BandInfo;
	}
	public void setBandInfo(String bandInfo) {
		BandInfo = bandInfo;
	}
	public int getMusicNo() {
		return musicNo;
	}
	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}
}
