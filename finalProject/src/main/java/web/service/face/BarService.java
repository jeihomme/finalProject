package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Calendar;
import web.dto.Location;
import web.dto.Member;
import web.dto.ProfilePic;

public interface BarService {
	
	// 바 전체 리스트
	public List<Bar> barList(Bar bar, ProfilePic profilePic);
	
	// 페이징 처리
	public Map listPaging(String curPage);
	
	// 바 지역 리스트
	public List<Location> locationList();
	
	// 지역번호로 검색 (location Check)
	public List<Bar> barLocation(List<String> locationN);
	
	// 리스트 더보기
	public List<Bar> barListMore(Bar bar, ProfilePic profilePic);
	
	// 바 소개
	public Bar barView(Bar bar);
	
	// 일정 보기 (calendar)
	public List<Calendar> barCalendar(Bar bar);
	
	// 공연 요청
	public void RequestShow(Bar bar, Band band);
	
	// 바 정보 수정
	public void barUpdate(Bar bar);
	
	// 멤버 연락처 수정
	public void memberContactUpdate(Member member);
	
	// 프로파일 사진
	public List<Bar> getProfilePic();
	

}
