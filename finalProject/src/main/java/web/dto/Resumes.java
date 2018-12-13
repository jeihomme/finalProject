package web.dto;

public class Resumes {
	private int resumesNo;
	private String bandName;
	private int historyNo;
	private String BandInfo;
	private int musicNo;
	@Override
	public String toString() {
		return "Resumes [resumesNo=" + resumesNo + ", bandName=" + bandName + ", historyNo=" + historyNo + ", BandInfo="
				+ BandInfo + ", musicNo=" + musicNo + "]";
	}
	public int getResumesNo() {
		return resumesNo;
	}
	public void setResumesNo(int resumesNo) {
		this.resumesNo = resumesNo;
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
