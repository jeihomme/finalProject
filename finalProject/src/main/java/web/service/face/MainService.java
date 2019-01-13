package web.service.face;

import java.util.List;

import web.dto.Bar;
import web.dto.Notice;

public interface MainService {

	// 공지사항  list 조회
	public List<Notice> getNoticeList();
	
	// bar list 조회
	public List<Bar> getBarList();
	
			
}
