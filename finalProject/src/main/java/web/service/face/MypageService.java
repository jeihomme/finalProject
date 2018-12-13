package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Member;
import web.dto.Resume;
import web.utils.Paging;

public interface MypageService {
//	회원정보
	public Member infoView(Member member);
//	회원정보 수정
	public void infoModify(Member member);
//	회원 비밀번호 수정
	public void modifyPw(Member member);
	
	public void introList();
	
	public void resumeView();
	public void createBasicInfo();
	public void createSoundFile();
	public void createHistory();
	public void createIntro();
	
	public void resumeModify();
	
	public void uploadSound();
	public void deleteSound();
	
	public void searchVolunteerUser();
	public void volunteerToBarViewList();
	public void deleteVolunteerToBarView();
	public void volunteerToBandViewList();
	public void deleteVolunteerToBandView();
	
	public void recommandBarViewList();
	
	public void calendarView();
	public void modifyCalendar();
	public void deleteCalendar();
	
//	public void userView();
	public int getCurPage(HttpServletRequest req);
	public String getSearch(HttpServletRequest req);
	public int getTotalCount(String search);
	public int getTotalCount();
	public List<Member> userView(Paging paging);
	public List<Member> userSearch(Paging paging);
	public void userDelete(Member member);
	
	public List<Resume> boardView(Paging paging);
	public List<Resume> boardSearch(Paging paging);
	public void boardDelete(Resume resume);
	
	//bar 소개
	public void barInfo();
	
	
}
