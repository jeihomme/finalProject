package web.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Music {
	private int musicNo;
	private int bandNo;
	private String musicTitle;
	private String path;
	private Date writtenDate;
	@Override
	public String toString() {
		return "Music [musicNo=" + musicNo + ", bandNo=" + bandNo + ", musicTitle=" + musicTitle + ", path=" + path
				+ ", writtenDate=" + writtenDate + "]";
	}
	public int getMusicNo() {
		return musicNo;
	}
	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}
	public int getBandNo() {
		return bandNo;
	}
	public void setBandNo(int bandNo) {
		this.bandNo = bandNo;
	}
	public String getMusicTitle() {
		return musicTitle;
	}
	public void setMusicTitle(String musicTitle) {
		this.musicTitle = musicTitle;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	
}
