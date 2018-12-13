package web.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Band;
import web.dto.BandMember;
import web.dto.Member;
import web.dto.Music;
import web.dto.Resumes;
import web.service.face.MypageService;
import web.utils.Paging;

@Controller
public class MypageController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mpService;
	
	@RequestMapping(value = "/mypage/info", method=RequestMethod.GET)
	public void info(
			HttpSession session
			, Model model
			) {
		logger.info("---info---");
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		if( member.getRoleId() == 2) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandName(band.getBandName());
			List<BandMember> bandMemberList = mpService.getBandMember(bandMember);
			
			logger.info(bandMember.toString());
			
			model.addAttribute("band", band);
			model.addAttribute("bandMemberList", bandMemberList);
		}
		model.addAttribute("member", member);
	}
	
	@RequestMapping(value = "/mypage/modifyInfo", method=RequestMethod.GET)
	public void modify(
			HttpSession session
			, Model model
			) {
		
		logger.info("---modify---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		if( member.getRoleId() == 2) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandName(band.getBandName());
			List<BandMember> bandMemberList = mpService.getBandMember(bandMember);
			
			logger.info(bandMemberList.toString());
			
			model.addAttribute("band", band);
			model.addAttribute("bandMemberList", bandMemberList);
		}
		model.addAttribute("member", member);
	}
	
	@RequestMapping(value = "/mypage/modifyInfo", method=RequestMethod.POST)
	public String modifyProc(
			HttpSession session
			, HttpServletRequest req
			) {
		logger.info("---modifyProc---");
		
		try {
			req.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Member member = (Member) session.getAttribute("loginInfo");
		member.setEmail(req.getParameter("email"));
		member.setTelcom(req.getParameter("telcom"));
		member.setContact( Integer.parseInt(req.getParameter("contact")) );
		
		if( member.getRoleId() == 2) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandName(band.getBandName());
			List<BandMember> bandMemberList = mpService.getBandMember(bandMember);
			
			int i = 1;
			for(BandMember bM : bandMemberList) {
				bM.setBandMemberNo(i);
				bM.setBandMemName(req.getParameter("bandMemName"+i));
				bM.setBandMemInfo(req.getParameter("bandMemInfo"+i));
				
				i++;
				mpService.infoBandMemberModify(bM);
				
				logger.info(bandMemberList.toString());
			}
			logger.info(bandMemberList.toString());
		}
		mpService.infoModify(member);
		
		return "redirect:/mypage/modifyInfo";
	}
	
	@RequestMapping(value = "/mypage/addMemberlist", method=RequestMethod.POST)
	public String addMemberlistProc(
			HttpSession session
			) {
			logger.info("---addMemberlist---");
			
			Member member = (Member) session.getAttribute("loginInfo");
			logger.info(member.toString());
			
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandName(band.getBandName());
			mpService.addMemberList(bandMember);
		
		return "redirect:/mypage/modifyInfo";
	}
	
	@RequestMapping(value = "/mypage/minMemberlist", method=RequestMethod.POST)
	public String minMemberlistProc(
			HttpSession session
			) {
			logger.info("---addMemberlist---");
			
			Member member = (Member) session.getAttribute("loginInfo");
			logger.info(member.toString());
			
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandName(band.getBandName());
			
			mpService.minMemberList(bandMember);
		
		return "redirect:/mypage/modifyInfo";
	}
	
	@RequestMapping(value = "/mypage/modifyPw", method=RequestMethod.POST)
	public String modifyPwProc(
			HttpSession session
			, HttpServletRequest req
			) {
		logger.info("---modifyPwProc---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		member.setPassword(req.getParameter("newPassword"));
		
		mpService.modifyPw(member);
		
		return "redirect:/mypage/modifyInfo";
	}
//	--------------------------------------------------------------------	
	@RequestMapping(value = "/mypage/intro", method=RequestMethod.GET)
	public void intro(
			HttpSession session
			, Model model
			) {
		logger.info("---intro---");
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		Band band = new Band();
		band.setUserId(member.getUserId());
		band = mpService.getBand(band);
		logger.info(band.toString());
		
		Resumes resumes = new Resumes();
		resumes.setBandName(band.getBandName());
		logger.info(resumes.toString());
		List<Resumes> resumesList = mpService.getResumesList(resumes);
		logger.info(resumesList.toString());
		
		Music music = new Music();
		music.setBandName(band.getBandName());
		logger.info(music.toString());
		List<Music> musicList = mpService.getMusicList(music);
		logger.info(musicList.toString());
		
		model.addAttribute("member", member);
		model.addAttribute("band", band);
		model.addAttribute("resumesList", resumesList);
		model.addAttribute("musicList", musicList);
//		introList
	}
//	--------------------------------------------------------------------
	@RequestMapping(value = "/mypage/resumes", method=RequestMethod.GET)
	public void resumesView() {
		logger.info("---resumesView---");

//		resumeView
	}
	
	@RequestMapping(value = "/mypage/modifyIntro", method=RequestMethod.GET)
	public void modifyResumes() {
		logger.info("---modifyResumes---");
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
	public void modifyResumesProc() {
		logger.info("---modifyResumesProc---");
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
	@RequestMapping(value = "/mypage/volunteer", method=RequestMethod.GET)
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
	public void userAdmin(
			HttpServletRequest req
			, Model model
			) {
		logger.info("---userAdmin---");
		
		int CurPage = mpService.getCurPage(req);
		
		logger.info("---getTotalCount---");
		int totalCount = mpService.getTotalCount();
		
		logger.info("---Paging---");
		Paging paging = new Paging(totalCount, CurPage);
		
		logger.info("---getPagingList---");
		List<Member> mbList = mpService.userView(paging);
		
		logger.info("---addAttribute---");
		model.addAttribute("mbList", mbList);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value = "/mypage/userAdmin", method=RequestMethod.POST)
	public void searchUserAdmin(
			HttpServletRequest req
			, Model model
			) {
		logger.info("---searchUserAdmin---");
		
		System.out.println(req.getParameter("searchCategory"));
		System.out.println(req.getParameter("searchKeyowrd"));
		
		int CurPage = mpService.getCurPage(req);
		
		String search = mpService.getSearch(req);
		Paging paging;
		
//		검색어가 있다면
		if( search!=null && !"".equals(search) ) {
			logger.info("---getTotalCount---");
			logger.info("---search String : "+search);
			int totalCount = mpService.getTotalCount(search);
			logger.info("---totalCount String : "+totalCount);
			
			logger.info("---Paging---");
			paging = new Paging(totalCount, CurPage);
			
			//페이징 객체에 검색어 적용
			paging.setSearch(search);
			
			logger.info("---getPagingList---");
			
			List<Member> mbList = mpService.userSearch(paging);
			
			logger.info("---addAttribute---");
			model.addAttribute("mbList", mbList);
			model.addAttribute("paging", paging);
			
		}
//		검색어가 없다면,
		else {
			logger.info("---getTotalCount---");
			int totalCount = mpService.getTotalCount();
			
			logger.info("---Paging---");
			paging = new Paging(totalCount, CurPage);
			
			logger.info("---getPagingList---");
			
			List<Member> mbList = mpService.userView(paging);
			
			logger.info("---addAttribute---");
			model.addAttribute("mbList", mbList);
			model.addAttribute("paging", paging);
		}
	}
	
	@RequestMapping(value = "/mypage/deleteUser", method=RequestMethod.POST)
	public String deleteUserAdmin(
			HttpServletRequest req
			) {
		logger.info("---deleteUserAdmin---");
		Member member = new Member();
		member.setUserId(req.getParameter("userId"));
		
		logger.info(member.toString());
		mpService.userDelete(member);
		
		return "redirect:/mypage/userAdmin";
	}
//	-------------------------------------------------------------------
	@RequestMapping(value = "/mypage/boardAdmin", method=RequestMethod.GET)
	public void boardAdmin(
			HttpServletRequest req
			, Model model
			) {
			logger.info("---boardAdmin---");
			
			int CurPage = mpService.getCurPage(req);
			
			logger.info("---getTotalCount---");
			int totalCount = mpService.getTotalCount();
			
			logger.info("---Paging---");
			Paging paging = new Paging(totalCount, CurPage);
			
			logger.info("---getPagingList---");
			List<Resumes> rsList = mpService.boardView(paging);
			
			logger.info("---addAttribute---");
			model.addAttribute("rsList", rsList);
			model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value = "/mypage/boardAdmin", method=RequestMethod.POST)
	public void searchBoardAdmin(
			HttpServletRequest req
			, Model model
			) {
			logger.info("---searchBoardAdmin---");
			
			System.out.println(req.getParameter("searchCategory"));
			System.out.println(req.getParameter("searchKeyowrd"));
			
			int CurPage = mpService.getCurPage(req);
			
			String search = mpService.getSearch(req);
			Paging paging;
			
	//		검색어가 있다면
			if( search!=null && !"".equals(search) ) {
				logger.info("---getTotalCount---");
				logger.info("---search String : "+search);
				int totalCount = mpService.getTotalCount(search);
				logger.info("---totalCount String : "+totalCount);
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				//페이징 객체에 검색어 적용
				paging.setSearch(search);
				
				logger.info("---getPagingList---");
				
				List<Resumes> rsList = mpService.boardSearch(paging);
				
				logger.info("---addAttribute---");
				model.addAttribute("rsList", rsList);
				model.addAttribute("paging", paging);
				
			}
	//		검색어가 없다면,
			else {
				logger.info("---getTotalCount---");
				int totalCount = mpService.getTotalCount();
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				logger.info("---getPagingList---");
				
				List<Resumes> rsList = mpService.boardView(paging);
				
				logger.info("---addAttribute---");
				model.addAttribute("rsList", rsList);
				model.addAttribute("paging", paging);
			}
	}
	
	@RequestMapping(value = "/mypage/deleteBoard", method=RequestMethod.POST)
	public String deleteBoardAdmin(
			HttpServletRequest req
			) {
			logger.info("---deleteBoardAdmin---");
			Resumes resumes = new Resumes();
			resumes.setResumesNo(Integer.parseInt(req.getParameter("resumeNo") ));
			
			logger.info(resumes.toString());
			mpService.boardDelete(resumes);
			
			int[] a = { 1, 2, 3};
			
			for(int i =0; i < a.length; i++) {
				
			}
			return "redirect:/mypage/boardAdmin";
	}
	
}
