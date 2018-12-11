package web.dto;

public class FAQ {

	private int faqNo;
	private String userId;
	private String title;
	private String content;

	
	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", userId=" + userId + ", title=" + title + ", content=" + content + "]";
	}


	public int getFaqNo() {
		return faqNo;
	}


	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
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
	
	
	
	
}
