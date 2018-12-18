package web.dao.face;

import java.util.List;

import web.dto.Notice;
import web.utils.Paging;

public interface NoticeDao {
	
	public List selectPagingList(Paging paging);

	
	// 공지사항 답변 쓰기
	public void insertNotice(Notice notice);
	
	// 공지사항 답변 수정 
	public void updateNotice();
	
	// 공지사항 답변  삭제
	public void deleteNotice();
	
	// 공지사항 답변  상세보기
	public Notice selectNotice(int noticeNo);
	
	// 공지사항  총 글수 출력
	public int selectNoticeCntAll();
	

}
