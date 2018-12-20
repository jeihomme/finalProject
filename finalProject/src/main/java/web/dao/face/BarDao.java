package web.dao.face;

import java.util.List;

import web.dto.Bar;
import web.dto.Calendar;
import web.dto.Location;
import web.dto.ProfilePic;

public interface BarDao {
	
	// 바 전체 리스트
	public List<Bar> getBarList(Bar bar, ProfilePic profilePic);
	
	// 지역 번호로 검색 (location Check)
	public List<Bar> getByLocation(int locationNo);
	
	// 리스트 더보기
	public List<Bar> getBarListMore();
	
	// 바 소개
	public Bar viewBar(Bar bar);
	
	// 일정보기 (calendar)
	public List<Calendar> getBarCalendar(String BarName);
	
	// 공연요청
	public void barRequest(String barName, String bandName);
	
	// 바 정보 수정
	public Bar updateBarInfo(Bar bar);
	 

}
