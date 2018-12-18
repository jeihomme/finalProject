package web.dao.face;

import java.util.List;

import web.dto.FAQ;
import web.utils.Paging;

public interface FAQDao {

	// 전체조회
	public List selectPagingList(Paging paging);

	
	// FAQ 답변 쓰기
	public void insertFAQ(FAQ faq);
	
	// FAQ 답변 수정 
	public void updateFAQ();
	
	// FAQ 답변  삭제
	public void deleteFAQ();
	
	// FAQ 답변  상세보기
	public FAQ selectFAQ(int faqNo);
	
	// 게시판 총 글수 출력
	public int selectFAQCntAll();
	
	
}
