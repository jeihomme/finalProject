package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.MypageService;

@Controller
public class MypageController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mService;
	
	@RequestMapping(value = "/mypage/info", method=RequestMethod.GET)
	public void info() {
		logger.info("---info---");
		mService.infoView();
		
	}
	
	@RequestMapping(value = "/mypage/modifyInfo", method=RequestMethod.GET)
	public void modify() {
		logger.info("---modify---");
		mService.infoView();
	}
	
	@RequestMapping(value = "/mypage/modifyInfo", method=RequestMethod.POST)
	public void modifyProc() {
		logger.info("---modifyProc---");
//		infoModify
	}
	
	@RequestMapping(value = "/mypage/modifyPw", method=RequestMethod.GET)
	public void modifyPw() {
		logger.info("---modifyPw---");
	}
	
	@RequestMapping(value = "/mypage/modifyPw", method=RequestMethod.POST)
	public void modifyPwProc() {
		logger.info("---modifyPwProc---");
//		modifyPw
	}
//	--------------------------------------------------------------------	
	@RequestMapping(value = "/mypage/intro", method=RequestMethod.GET)
	public void intro() {
		logger.info("---intro---");
//		introList
	}
//	--------------------------------------------------------------------
	@RequestMapping(value = "/mypage/resume", method=RequestMethod.GET)
	public void resumeView() {
		logger.info("---resumeView---");

//		resumeView
	}
	
	@RequestMapping(value = "/mypage/modifyIntro", method=RequestMethod.GET)
	public void modifyResume() {
		logger.info("---modifyResume---");
//		resumeView
	}
	
	@RequestMapping(value = "/mypage/basicInfo", method=RequestMethod.POST)
	public void uploadCreateBasicInfo() {
		logger.info("---uploadCreateBasicInfo---");
//		createBasicInfo
	}

	@RequestMapping(value = "/mypage/soundFile", method=RequestMethod.POST)
	public void uploadCreateSoundFile() {
		logger.info("---uploadCreateSoundFile---");
//		createSoundFile
	}
	
	@RequestMapping(value = "/mypage/history", method=RequestMethod.POST)
	public void uploadCreateHistory() {
		logger.info("---uploadCreateHistory---");
//		createHistory
	}
	
	@RequestMapping(value = "/mypage/intro", method=RequestMethod.POST)
	public void uploadCreateIntro() {
		logger.info("---uploadCreateIntro---");
//		createIntro
	}
	
	@RequestMapping(value = "/mypage/modifyIntro", method=RequestMethod.POST)
	public void modifyResumeProc() {
		logger.info("---modifyResumeProc---");
//		resumeModify
	}
	
	@RequestMapping(value = "/mypage/insertSound", method=RequestMethod.POST)
	public void uploadSound() {
		logger.info("---uploadSound---");
//		uploadSound
	}
	
	@RequestMapping(value = "/board/deleteSound", method=RequestMethod.POST)
	public void deleteSound() {
		logger.info("---deleteSound---");
//		deleteSound
	}
//	--------------------------------------------------------------------
	@RequestMapping(value = "/mypage/volunteer", method=RequestMethod.POST)
	public void searchVolunteer() {
		logger.info("---searchVolunteer---");
//		searchVolunteerUser
	}
	
	@RequestMapping(value = "/mypage/volunteerToBar", method=RequestMethod.GET)
	public void volunteerToBar() {
		logger.info("---volunteerToBar---");
//		volunteerToBarViewList
	}
	
	@RequestMapping(value = "/mypage/volunteerToBar", method=RequestMethod.POST)
	public void volunteerToBarCancel() {
		logger.info("---volunteerToBarCancel---");
//		deleteVolunteerToBarView
	}
	
	@RequestMapping(value = "/mypage/volunteerToBand", method=RequestMethod.GET)
	public void volunteerToBand() {
		logger.info("---volunteerToBand---");
//		volunteerToBandViewList
	}
	
	@RequestMapping(value = "/mypage/volunteerToBand", method=RequestMethod.POST)
	public void volunteerToBandCancel() {
		logger.info("---volunteerToBandCancel---");
//		deleteVolunteerToBandView
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/recommand", method=RequestMethod.GET)
	public void recommandBar() {
		logger.info("---recommandBar---");
//		recommandBarViewList
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/calendar", method=RequestMethod.GET)
	public void calendar() {
		logger.info("---calendar---");
//		calendarView
	}
	
	@RequestMapping(value = "/mypage/modifyCalendar", method=RequestMethod.GET)
	public void modifyCalendar() {
		logger.info("---modifyCalendar---");
//		calendarView
	}
	
	@RequestMapping(value = "/mypage/modifyCalendar", method=RequestMethod.POST)
	public void modifyCalendarProc() {
		logger.info("---modifyCalendarProc---");
//		calendarView
	}
	
	@RequestMapping(value = "/mypage/deleteCalendar", method=RequestMethod.POST)
	public void deleteCalendar() {
		logger.info("---deleteCalendar---");
//		calendarView
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/userAdmin", method=RequestMethod.GET)
	public void userAdmin() {
		logger.info("---userAdmin---");
//		userView
	}
	
	@RequestMapping(value = "/mypage/searchUser", method=RequestMethod.POST)
	public void searchUserAdmin() {
		logger.info("---searchUserAdmin---");
//		userSearch
	}
	
	@RequestMapping(value = "/mypage/deleteUser", method=RequestMethod.POST)
	public void deleteUserAdmin() {
		logger.info("---deleteUserAdmin---");
//		userDelete
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/boardAdmin", method=RequestMethod.GET)
	public void boardAdmin() {
		logger.info("---boardAdmin---");
//		userView
	}
	
	@RequestMapping(value = "/mypage/searchBoard", method=RequestMethod.POST)
	public void searchBoardAdmin() {
		logger.info("---searchBoardAdmin---");
//		calendarView
	}
	
	@RequestMapping(value = "/mypage/deleteBoard", method=RequestMethod.POST)
	public void deleteBoardAdmin() {
		logger.info("---deleteBoardAdmin---");
//		calendarView
	}
	
}
