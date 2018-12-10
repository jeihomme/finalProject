package web.service.face;

public interface MypageService {
	public void infoView();
	public void infoModify();
	public void modifyPw();
	
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
	
	public void userView();
	public void userSearch();
	public void userDelete();
	
	public void boardView();
	public void boardSearch();
	public void boardDelete();
}
