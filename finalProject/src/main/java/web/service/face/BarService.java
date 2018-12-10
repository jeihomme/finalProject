package web.service.face;

import java.util.List;

import web.dto.Bar;
import web.dto.Calendar;
import web.dto.Location;

public interface BarService {
	
	// 바 전체 리스트
	public List<Bar> barList();
	
	// 지역번호로 검색 (location Check)
	public List<Bar> barLocation(int locationNo);
	
	// 리스트 더보기
	public List<Bar> barListMore();
	
	// 바 소개
	public Bar barView(String barInfo);
	
	// 일정 보기 (calendar)
	public List<Calendar> barCalendar(String barName);
	
	// 공연 요청
	public void RequestShow(String barName, String bandName);
	
	// 바 정보 수정
	public void barUpdate(Bar Info, Location locationName);
	

}
