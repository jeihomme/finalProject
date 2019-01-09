package web.dto;

import java.util.Date;

public class FindMember {
	
	private int findNo;
	private String bandName;
	private String bandNo;
	private String position;
	private String positionNo;
	private String title;
	private String content;
	private Date writtenDate;
	private String genre;
	private int musicNo;
	private String adsNo;
	private String ads;
	private String rnum;
	private String profileNo;
	
	
	


	@Override
	public String toString() {
		return "FindMember [findNo=" + findNo + ", bandName=" + bandName + ", bandNo=" + bandNo + ", position="
				+ position + ", positionNo=" + positionNo + ", title=" + title + ", content=" + content
				+ ", writtenDate=" + writtenDate + ", genre=" + genre + ", musicNo=" + musicNo + ", adsNo=" + adsNo
				+ ", ads=" + ads + ", rnum=" + rnum + ", profileNo=" + profileNo + "]";
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
	
	
	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
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

	public String getAdsNo() {
		return adsNo;
	}


	public void setAdsNo(String adsNo) {
		this.adsNo = adsNo;
	}


	public String getBandNo() {
		return bandNo;
	}


	public void setBandNo(String bandNo) {
		this.bandNo = bandNo;
	}


	public String getAds() {
		return ads;
	}


	public void setAds(String ads) {
		this.ads = ads;
	}


	public String getPositionNo() {
		return positionNo;
	}


	public void setPositionNo(String positionNo) {
		this.positionNo = positionNo;
	}


	public String getRnum() {
		return rnum;
	}


	public void setRnum(String rnum) {
		this.rnum = rnum;
	}


	public String getProfileNo() {
		return profileNo;
	}


	public void setProfileNo(String profileNo) {
		this.profileNo = profileNo;
	}
	
	
	
}
