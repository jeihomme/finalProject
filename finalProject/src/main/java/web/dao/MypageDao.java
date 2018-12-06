package web.dao;

public interface MypageDao {
	public void selectInfoByUserId();
	public void insertInfo();
	public void updateInfo();
	public void updatePw();
	
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
	
	public void selectUserList();
	public void selectUserByUserId();
	public void deleteUser();
	
	public void selectBoardList();
	public void selectBoardByBoardName();
	public void deleteBoard();
}
