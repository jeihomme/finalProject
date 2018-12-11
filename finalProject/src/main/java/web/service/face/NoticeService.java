package web.service.face;

import java.util.List;

import web.dto.Notice;

public interface NoticeService {

	
	// 전체 조회
			public List getList();
			
			// 글쓰기
			public void write();
			
			// 글보기
			public Notice view(Notice noticeView);
			
			// 글삭제
			public void delete(Notice notice);
			
			// 글수정
			public void modify();
}
