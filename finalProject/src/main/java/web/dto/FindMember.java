package web.dto;

import java.util.Date;

public class FindMember {
	
	private int findNo;
	private String bandName;
	private int position;
	private String title;
	private String content;
	private Date writtenDate;
	private String genre;
	private int musicNo;
	private int adsNo;
	
	
	@Override
	public String toString() {
		return "FindMember [findNo=" + findNo + ", bandName=" + bandName + ", position=" + position + ", title=" + title
				+ ", content=" + content + ", writtenDate=" + writtenDate + ", genre=" + genre + ", musicNo=" + musicNo
				+ "]";
	}


	public int getFindNo() {
		return findNo;
	}


	public void setFindNo(int findNo) {
		this.findNo = findNo;
	}


	public String getBandName() {
		return bandName;
	}


	public void setBandName(String bandName) {
		this.bandName = bandName;
	}


	public int getPosition() {
		return position;
	}


	public void setPosition(int position) {
		this.position = position;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getWrittenDate() {
		return writtenDate;
	}


	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public int getMusicNo() {
		return musicNo;
	}


	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}


	public int getAdsNo() {
		return adsNo;
	}


	public void setAdsNo(int adsNo) {
		this.adsNo = adsNo;
	}
	
	
	
}
