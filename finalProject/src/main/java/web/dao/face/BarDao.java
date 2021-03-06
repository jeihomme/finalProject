package web.dao.face;

import java.util.List;

import web.dto.Bar;
import web.dto.CalendarD;
import web.dto.Member;
import web.dto.ProfilePic;

public interface BarDao {
	
	// 바 전체 리스트
	public List<Bar> getBarList(Bar bar, ProfilePic profilePic);
	
	// 지역 번호로 검색 (location Check)
	public List<Bar> getByLocation(List<String> location);
	
	// 리스트 더보기
	public List<Bar> getBarListMore(Bar bar);
	
	// 바 소개
	public Bar viewBar(Bar bar);
	
	// 연락처 가져오기
	public Member contact(Member member);
	
	// 일정보기 (calendar)
	public List<CalendarD> getBarCalendar(String BarName);
	
	// 공연요청
	public void barRequest(String barName, String bandName);
	
	// 바 정보 수정
	public void updateBarInfo(Bar bar);
	
	// 유저 연락처 수정
	public void updateMemberContact(Member member);
	
	// 프로파일 사진 가져오기
	public List<Bar> getProfilePic();
	 

}
