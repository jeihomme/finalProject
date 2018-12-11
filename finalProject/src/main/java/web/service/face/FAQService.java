package web.service.face;

import java.util.List;

import web.dto.FAQ;

public interface FAQService {
	// 전체 조회
		public List getList();
		
		// 글쓰기
		public void write();
		
		// 글보기
		public FAQ view(FAQ faqView);
		
		// 글삭제
		public void delete(FAQ faq);
		
		// 글수정
		public void modify();
}
