package web.dao.face;

import java.util.List;

import web.dto.FAQ;

public interface FAQDao {

	// 전체조회
	public List selectAll();

	
	// FAQ 답변 쓰기
	public void insertFAQ();
	
	// FAQ 답변 수정 
	public void updateFAQ();
	
	// FAQ 답변  삭제
	public void deleteFAQ();
	
	// FAQ 답변  상세보기
	public FAQ selectFAQ(int faqNo);
	
	// 게시판 총 글수 출력
	public int selectFAQCntAll();
	
	
}
