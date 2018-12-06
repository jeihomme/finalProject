package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.MypageService;

@Controller
public class MypageController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mService;
	
	@RequestMapping(value = "/mypage/info", method=RequestMethod.GET)
	public void info() {
		logger.info("hihi");
		mService.infoView();
		
	}
	
	@RequestMapping(value = "/mypage/modifyInfo", method=RequestMethod.GET)
	public void modify() {
//		infoView
	}
	
	@RequestMapping(value = "/mypage/modifyInfo", method=RequestMethod.POST)
	public void modifyProc() {
//		infoModify
	}
	
	@RequestMapping(value = "/mypage/modifyPw", method=RequestMethod.GET)
	public void modifyPw() {
		
	}
	
	@RequestMapping(value = "/mypage/modifyPw", method=RequestMethod.POST)
	public void modifyPwProc() {
//		modifyPw
	}
//	--------------------------------------------------------------------	
	@RequestMapping(value = "/mypage/intro", method=RequestMethod.GET)
	public void intro() {
//		introList
	}
//	--------------------------------------------------------------------
	@RequestMapping(value = "/mypage/resume", method=RequestMethod.GET)
	public void resumeView() {
//		resumeView
	}
	
	@RequestMapping(value = "/mypage/modifyIntro", method=RequestMethod.GET)
	public void modifyResume() {
//		resumeView
	}
	
	@RequestMapping(value = "/mypage/basicInfo", method=RequestMethod.POST)
	public void uploadCreateBasicInfo() {
//		createBasicInfo
	}

	@RequestMapping(value = "/mypage/soundFile", method=RequestMethod.POST)
	public void uploadCreateSoundFile() {
//		createSoundFile
	}
	
	@RequestMapping(value = "/mypage/history", method=RequestMethod.POST)
	public void uploadCreateHistory() {
//		createHistory
	}
	
	@RequestMapping(value = "/mypage/intro", method=RequestMethod.POST)
	public void uploadCreateIntro() {
//		createIntro
	}
	
	@RequestMapping(value = "/mypage/modifyIntro", method=RequestMethod.POST)
	public void modifyResumeProc() {
//		resumeModify
	}
	
	@RequestMapping(value = "/mypage/insertSound", method=RequestMethod.POST)
	public void uploadSound() {
//		uploadSound
	}
	
	@RequestMapping(value = "/board/deleteSound", method=RequestMethod.POST)
	public void deleteSound() {
//		deleteSound
	}
//	--------------------------------------------------------------------
	@RequestMapping(value = "/mypage/volunteer", method=RequestMethod.POST)
	public void searchVolunteer() {
//		searchVolunteerUser
	}
	
	@RequestMapping(value = "/mypage/volunteerToBar", method=RequestMethod.GET)
	public void volunteerToBar() {
//		volunteerToBarViewList
	}
	
	@RequestMapping(value = "/mypage/volunteerToBar", method=RequestMethod.POST)
	public void volunteerToBarCancel() {
//		deleteVolunteerToBarView
	}
	
	@RequestMapping(value = "/mypage/volunteerToBand", method=RequestMethod.GET)
	public void volunteerToBand() {
//		volunteerToBandViewList
	}
	
	@RequestMapping(value = "/mypage/volunteerToBand", method=RequestMethod.POST)
	public void volunteerToBandCancel() {
//		deleteVolunteerToBandView
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/recommand", method=RequestMethod.GET)
	public void recommandBar() {
//		recommandBarViewList
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/calendar", method=RequestMethod.GET)
	public void calendar() {
//		calendarView
	}
	
	@RequestMapping(value = "/mypage/modifyCalendar", method=RequestMethod.GET)
	public void modifyCalendar() {
//		calendarView
	}
	
	@RequestMapping(value = "/mypage/modifyCalendar", method=RequestMethod.POST)
	public void modifyCalendarProc() {
//		calendarView
	}
	
	@RequestMapping(value = "/mypage/deleteCalendar", method=RequestMethod.POST)
	public void deleteCalendar() {
//		calendarView
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/userAdmin", method=RequestMethod.GET)
	public void userAdmin() {
//		userView
	}
	
	@RequestMapping(value = "/mypage/searchUser", method=RequestMethod.POST)
	public void searchUserAdmin() {
//		userSearch
	}
	
	@RequestMapping(value = "/mypage/deleteUser", method=RequestMethod.POST)
	public void deleteUserAdmin() {
//		userDelete
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/boardAdmin", method=RequestMethod.GET)
	public void boardAdmin() {
//		userView
	}
	
	@RequestMapping(value = "/mypage/searchBoard", method=RequestMethod.POST)
	public void searchBoardAdmin() {
//		calendarView
	}
	
	@RequestMapping(value = "/mypage/deleteBoard", method=RequestMethod.POST)
	public void deleteBoardAdmin() {
//		calendarView
	}
	
}
