package web.service.face;

import java.util.List;

import web.dto.Notice;
import web.utils.Paging;

public interface NoticeService {

	
	// 전체 조회
			public List getList(Paging paging);
			
			// 페이징 정보 만들기
			public Paging getPaging(int curPage , int listCount , int pageCount);
			
			// 글쓰기
			public void write(Notice notice);
			
			// 글보기
			public Notice view(int noticeNo);
			
			// 글삭제
			public void delete(Notice notice);
			
			// 글수정
			public void modify(Notice notice);

			public int getTotalCount();
		
}
