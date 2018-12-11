package web.dto;

import java.util.Date;

public class Notice {

	private int noticeNo;
	private String userId;
	private String title;
	private String content;
	private Date writtenDate;
	
	
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", userId=" + userId + ", title=" + title + ", content=" + content
				+ ", writtenDate=" + writtenDate + "]";
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
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
	
	
}
