package web.dto;

import java.util.Date;

public class Music {
	private int musicNo;
	private String bandName;
	private String musicTitle;
	private String originName;
	private String storedName;
	private Date written_date;
	@Override
	public String toString() {
		return "Music [musicNo=" + musicNo + ", bandName=" + bandName + ", musicTitle=" + musicTitle + ", originName="
				+ originName + ", storedName=" + storedName + ", written_date=" + written_date + "]";
	}
	public int getMusicNo() {
		return musicNo;
	}
	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}
	public String getBandName() {
		return bandName;
	}
	public void setBandName(String bandName) {
		this.bandName = bandName;
	}
	public String getMusicTitle() {
		return musicTitle;
	}
	public void setMusicTitle(String musicTitle) {
		this.musicTitle = musicTitle;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public Date getWritten_date() {
		return written_date;
	}
	public void setWritten_date(Date written_date) {
		this.written_date = written_date;
	}
}
