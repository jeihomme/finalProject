package web.service.face;

import java.util.List;

import web.dto.FAQ;
import web.utils.Paging;

public interface FAQService {
	// 전체 조회
		public List getList(Paging paging);
	
		//페이지 정보 만들기
		public Paging getPaging(int curPage , int listCount , int pageCount);
		
		// 글쓰기
		public void write(FAQ faq);
		
		// 글보기
		public FAQ view(int faqNo);
		
		// 글삭제
		public void delete(int faqNo);
		
		// 글수정
		public void modify(FAQ faqNo);
}
