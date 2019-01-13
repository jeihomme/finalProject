package web.dao.face;

import java.util.List;

import web.dto.Bar;
import web.dto.Notice;

public interface MainDao {
	
	// Notice List 가져오기
	public List<Notice> selectNoticeList();
	
	// bar 추천 list 가져오기
	public List<Bar> selectBarList();
	

}
