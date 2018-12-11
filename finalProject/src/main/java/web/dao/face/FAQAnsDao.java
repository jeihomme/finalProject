package web.dao.face;

import java.util.List;

import web.dto.FAQAns;

public interface FAQAnsDao {

	// 전체조회
	public List selectAll();

	
	// FAQ 답변 쓰기
	public void insertFAQAns();
	
	// FAQ 답변 수정 
	public void updateFAQAns();
	
	// FAQ 답변  삭제
	public void deleteFAQAns();
	
	// FAQ 답변  상세보기
	public FAQAns selectFAQAns(int noticeNo);
	
	// 게시판 총 글수 출력
	public int selectFAQAnsCntAll();
	
}
