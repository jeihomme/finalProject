package web.dto;

public class FAQAns {

	private int answerNo;
	private String title;
	private String content;
	private int faqNo;
	
	
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
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
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	@Override
	public String toString() {
		return "FAQAns [answerNo=" + answerNo + ", title=" + title + ", content=" + content + ", faqNo=" + faqNo + "]";
	}
	
	
	
}
