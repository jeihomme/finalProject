package web.dto;

import java.util.Date;

public class FAQ {

	private int rnum;
	private int faqNo;
	private String userId;
	private String question;
	private String answer;
	private Date writtenDate;
	
	
	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", userId=" + userId + ", question=" + question + ", answer=" + answer
				+ ", writtenDate=" + writtenDate + "]";
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


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public Date getWrittenDate() {
		return writtenDate;
	}


	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
	
	
	
	
	
		
}
