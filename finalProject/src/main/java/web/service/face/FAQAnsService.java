package web.service.face;

import java.util.List;

import web.dto.FAQAns;

public interface FAQAnsService {

	// 전체 조회
	public List getList();
	
	// 글쓰기
	public void write();
	
	// 글보기
	public FAQAns view(FAQAns faqAnsView);
	
	// 글삭제
	public void delete(FAQAns faqAns);
	
	// 글수정
	public void modify();
}
