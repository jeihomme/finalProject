package web.dao.face;

import java.util.List;

import web.dto.Member;
import web.dto.Resume;
import web.utils.Paging;

public interface MypageDao {
//	회원정보
	public Member selectInfoByUserId(Member member);
//	회원정보 업데이트
	public void updateInfo(Member member);
//	회원정보 비밀번호 업데이트
	public void updatePw(Member member);
	
	public void selectIntroListByUserId();
	
	public void selectResumeByUserId();
	public void insertBasicInfo();
	public void insertSoundFile();
	public void insertHistory();
	public void insertIntro();
	public void updateBasicInfo();
	public void updateSoundFile();
	public void updateHistory();
	public void updateIntro();
	
	public void insertResume();
	public void updateResume();
	
	public void insertSound();
	public void deleteSound();
	
	public void selectVolunteerListByUserId();
	public void selectVolunteerToBarListByVolunteerId();
	public void deleteVolunteerToBar();
	public void selectVolunteerToBandListByVolunteerId();
	public void deleteVolunteerToBand();
	
	public void selectRecommandBarViewByUserId();
	
	public void selectCalendarViewByUserId();
	public void insertCalendar();
	public void updateCalendar();
	public void deleteCalendar();
	
	public int selectUserListCnt();
	public int selectCntAll(String search);
	public List<Member> selectUserList(Paging paging);
	public List<Member> selectUserByUserId(Paging paging);
	public void deleteUser(Member member);
	
	public List<Resume> selectBoardList(Paging paging);
	public List<Resume> selectBoardByResumeNo(Paging paging);
	public void deleteBoard(Resume resume);
	
	//bar 소개
	public void barInfoD();
	
	
}
