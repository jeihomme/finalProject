package web.dto;

import java.util.Date;

public class Collaboration {

	private int collaboNo;
	private String bandName;
	private String title;
	private String content;
	private Date wirttenDate;
	private int adsNo;
	
	
	
	
	@Override
	public String toString() {
		return "Collaboration [collaboNo=" + collaboNo + ", bandName=" + bandName + ", title=" + title + ", content="
				+ content + ", wirttenDate=" + wirttenDate + "]";
	}
	public int getCollaboNo() {
		return collaboNo;
	}
	public void setCollaboNo(int collaboNo) {
		this.collaboNo = collaboNo;
	}
	public String getBandName() {
		return bandName;
	}
	public void setBandName(String bandName) {
		this.bandName = bandName;
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
	public Date getWirttenDate() {
		return wirttenDate;
	}
	public void setWirttenDate(Date wirttenDate) {
		this.wirttenDate = wirttenDate;
	}
	public int getAdsNo() {
		return adsNo;
	}
	public void setAdsNo(int adsNo) {
		this.adsNo = adsNo;
	}
	
	
	
	
}
