package web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Application;
import web.dto.Band;
import web.dto.BandGenre;
import web.dto.BandMember;
import web.dto.Bar;
import web.dto.CalendarD;
import web.dto.Genre;
import web.dto.History;
import web.dto.Location;
import web.dto.Member;
import web.dto.Music;
import web.dto.PTime;
import web.dto.ProfilePic;
import web.dto.Resumes;
import web.service.face.CalendarService;
import web.service.face.MemberService;
import web.service.face.MypageService;
import web.utils.Paging;

@Controller
public class MypageController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mpService;
	@Autowired MemberService mbService;
	
	@RequestMapping(value = "/mypage/info", method=RequestMethod.GET)
	public String info(
			HttpSession session
			, Model model
			) {
		logger.info("---info---");
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		if( member.getRoleId() == 1) {
			Bar bar = new Bar();
			bar.setUserId(member.getUserId());
			bar = mpService.getBar(bar);
			
			model.addAttribute("bar", bar);
			
		} else if( member.getRoleId() == 2) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandNo(band.getBandNo());
			List<BandMember> bandMemberList = mpService.getBandMember(bandMember);
			
			logger.info(bandMember.toString());
			
			model.addAttribute("band", band);
			model.addAttribute("bandMemberList", bandMemberList);
		}
		
		model.addAttribute("member", member);
		return "mypage/info";
	}
	
	@RequestMapping(value = "/mypage/modifyInfo", method=RequestMethod.GET)
	public void modifyInfoView(
			HttpSession session
			, Model model
			, HttpServletRequest req
			) {
		logger.info("---modifyInfoView---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		if( member.getRoleId() == 1) {
			Bar bar = new Bar();
			bar.setUserId(member.getUserId());
			bar = mpService.getBar(bar);
			
			
			model.addAttribute("bar", bar);
		} else if( member.getRoleId() == 2) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandNo(band.getBandNo());
			List<BandMember> bandMemberList = mpService.getBandMember(bandMember);
			
			int rnum = bandMemberList.size();
			
			logger.info(bandMemberList.toString());
			
			model.addAttribute("band", band);
			model.addAttribute("rnum", rnum);
			model.addAttribute("bandMemberList", bandMemberList);
		}
		model.addAttribute("member", member);
	}
	
	@RequestMapping(value = "/mypage/modifyInfo", method=RequestMethod.POST)
	public String modifyInfoProc(
			HttpSession session
			, HttpServletRequest req
//			, @RequestParam(value="bandMemName" ,required=false) List<String> arrayParams
			) {
		logger.info("---modifyInfoProc---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		member.setEmail(req.getParameter("email"));
		member.setTelcom(req.getParameter("telcom"));
		member.setContact(req.getParameter("contact") );
		
		if( member.getRoleId() == 2) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandNo(band.getBandNo());
			List<BandMember> bandMemberList = mpService.getBandMember(bandMember);
			
			int i = 0;
			for(BandMember bM : bandMemberList) {
				bM.setBandMemberNo(Integer.parseInt( req.getParameterValues("bandMemberNo")[i]) );
				bM.setBandMemName(req.getParameterValues("bandMemName")[i]);
				bM.setmPosition(req.getParameterValues("mPosition")[i]);
				
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
			bandMember.setBandNo(band.getBandNo());
			mpService.addMemberList(bandMember);
		
		return "redirect:/mypage/modifyInfo";
	}
	
	@RequestMapping(value = "/mypage/minMemberlist", method=RequestMethod.POST)
	public String minMemberlistProc(
			HttpSession session
			, HttpServletRequest req
			) {
			logger.info("---minMemberlist---");
			
//			Member member = (Member) session.getAttribute("loginInfo");
//			logger.info(member.toString());
//			
//			Band band = new Band();
//			band.setUserId(member.getUserId());
//			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandNo(Integer.parseInt( req.getParameter("bandNo") ) );
			int rnum = Integer.parseInt( req.getParameter("rnum") );
			mpService.minMemberList(bandMember, rnum);
		
		return "redirect:/mypage/modifyInfo";
	}
	
	@RequestMapping(value = "/mypage/modifyPw", method=RequestMethod.POST)
	public void modifyPwProc(
			HttpSession session
			, HttpServletRequest req
			, Writer out
			) {
		logger.info("---modifyPwProc---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		
		if(	member.getPassword().equals(req.getParameter("currPassword"))
			&& req.getParameter("newPasswordFisrt").equals(req.getParameter("newPasswordSecond"))) {
			
			try {
				out.write("{\"res\": true}" );
				
				member.setPassword(req.getParameter("newPasswordSecond"));
				
				mpService.modifyPw(member);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
//		return "redirect:/mypage/modifyInfo";
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
		
		if( member.getRoleId() == 1) {
			Bar bar = new Bar();
			bar.setUserId(member.getUserId());
			bar = mpService.getBar(bar);
			logger.info(bar.toString());
			
			Genre genre = new Genre();
			genre.setGenreNo(bar.getGenreNo());
			genre = mpService.getGenre(genre);
			logger.info(genre.toString());
			
			Location location = new Location();
			location.setLocationNo(bar.getLocationNo());
			location = mpService.getLocation(location);
			
			ProfilePic pPic = new ProfilePic();
			pPic.setProfileNo(bar.getProfileNo());
			pPic = mpService.getProfilePic(pPic);
			
			model.addAttribute("bar", bar);
			model.addAttribute("genre", genre);
			model.addAttribute("location", location);
			model.addAttribute("pPic", pPic);
			
		} else if( member.getRoleId() == 2) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			logger.info(band.toString());
			
			ProfilePic pPic = new ProfilePic();
			pPic.setProfileNo(band.getProfileNo());
			pPic = mpService.getProfilePic(pPic);
			
			Resumes resumes = new Resumes();
			resumes.setBandNo(band.getBandNo());
	//		logger.info(resumes.toString());
			List<Resumes> resumesList = mpService.getResumesList(resumes);
			int rListRnum = resumesList.size();
			
			logger.info(resumesList.toString());
			
			Music music = new Music();
			music.setBandNo(band.getBandNo());
	//		logger.info(music.toString());
			List<Music> musicList = mpService.getMusicList(music);
			int mListRnum = musicList.size();
			
			logger.info(musicList.toString());
			
			model.addAttribute("band", band);
			model.addAttribute("pPic", pPic);
			model.addAttribute("resumesList", resumesList);
			model.addAttribute("musicList", musicList);
			
			model.addAttribute("rListRnum", rListRnum);
			model.addAttribute("mListRnum", mListRnum);
		}

		model.addAttribute("member", member);
	}
	
	@RequestMapping(value = "/mypage/modifyIntro", method=RequestMethod.GET)
	public void modifyIntro(
			HttpSession session
			, Model model
			) {
		logger.info("---intro---");
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		Bar bar = new Bar();
		bar.setUserId(member.getUserId());
		bar = mpService.getBar(bar);
		logger.info(bar.toString());
		
		Genre genre = new Genre();
		genre.setGenreNo(bar.getGenreNo());
		genre = mpService.getGenre(genre);
		logger.info(genre.toString());
		
		Location location = new Location();
		location.setLocationNo(bar.getLocationNo());
		location = mpService.getLocation(location);
		
		ProfilePic pPic = new ProfilePic();
		pPic.setProfileNo(bar.getProfileNo());
		pPic = mpService.getProfilePic(pPic);
		
		model.addAttribute("bar", bar);
		model.addAttribute("genre", genre);
		model.addAttribute("location", location);
		model.addAttribute("pPic", pPic);
			

		model.addAttribute("member", member);
	}
	
	@RequestMapping(value = "/mypage/modifyIntro", method=RequestMethod.POST)
	public void modifyIntroProc(
			HttpServletRequest req
			, Writer out
			) {
		logger.info("---modifyIntroProc---");

		if ( !req.getParameter("barNo").equals("") && req.getParameter("barNo") != null) {
			
			try {
				out.write("{\"res\": true}" );
				
				Bar bar = new Bar();
				bar.setBarNo(Integer.parseInt(req.getParameter("barNo")));
				
				bar.setLocationNo( Integer.parseInt(req.getParameter("locationNo")) );
				bar.setBarAddress( req.getParameter("barAddress") );
				bar.setBarInfo( req.getParameter("barInfo") );
				bar.setGenreNo( Integer.parseInt(req.getParameter("genreNo")) );
				
				mpService.updateBar(bar);
				logger.info(bar.toString());
				
		//		ProfilePic pPic = new ProfilePic();
		//		pPic.setProfileNo(bar.getProfileNo());
		//		pPic = mpService.getProfilePic(pPic);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		return "redirect:/mypage/modifyIntro";
	}
	
	@RequestMapping(value = "/mypage/resumes", method=RequestMethod.GET)
	public void resumes(
			HttpSession session
			, Model model
			, HttpServletRequest req
			) {
		logger.info("---resumes---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Resumes resumes = new Resumes();
		resumes.setResumesNo(Integer.parseInt( req.getParameter("resumesNo")) );
		resumes = mpService.getResumes(resumes);
		logger.info(resumes.toString());
		
		if ( member.getRoleId() == 1 && req.getParameter("appNo") != null && !"".equals(req.getParameter("appNo")) ) {
			Application app = new Application();
			app.setAppNo(Integer.parseInt(req.getParameter("appNo") ));
			
			logger.info(app.toString());
			mpService.appReadUpdate(app);
		}
		
		Band band = new Band();
		band.setBandNo(resumes.getBandNo());
		band = mpService.getBandByBandNo(band);
		logger.info(band.toString());
		
		BandGenre bandGenre = new BandGenre();
		bandGenre.setBandNo(resumes.getBandNo());
		bandGenre.setResumesNo(resumes.getResumesNo());
		bandGenre = mpService.getBandGenre(bandGenre);
		logger.info(bandGenre.toString());
		
		Genre genre = new Genre();
		genre.setGenreNo(bandGenre.getGenreNo());
		genre = mpService.getGenre(genre);
		logger.info(genre.toString());
		
		Music music = new Music();
		if ( resumes.getMusicNo() != 0) {
			music = mpService.getMusic(resumes);
			logger.info(music.toString());
		}
		
		List<History> historyList = mpService.getHistoryList(resumes);
		
		ProfilePic pPic = new ProfilePic();
		pPic.setProfileNo(band.getProfileNo());
		pPic = mpService.getProfilePic(pPic);
		
		model.addAttribute("member", member);
		model.addAttribute("band", band);
		model.addAttribute("genre", genre);
		
		model.addAttribute("resumes", resumes);
		model.addAttribute("music", music);
		model.addAttribute("historyList", historyList);
		
		model.addAttribute("pPic", pPic);
		
		
	}
	
	
	@RequestMapping(value = "/mypage/commitPublicResumes", method=RequestMethod.POST)
	public String commitPublicResumes(
			HttpSession session
			, HttpServletRequest req
			) {
		logger.info("---commitPublicResumes---");
//		resumeView
		
		logger.info("---intro---");
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		Band band = new Band();
		band.setUserId(member.getUserId());
		band = mpService.getBand(band);
		logger.info(band.toString());
		
		mpService.updatePublicResumes(band);
		
		Resumes resumes = new Resumes();
		System.out.println(Integer.parseInt(req.getParameter("resumesNo")));
		resumes.setResumesNo(Integer.parseInt(req.getParameter("resumesNo")));
			
		mpService.updatePublicResumes(resumes);
		
		
		return "redirect:/mypage/intro";
	}
	
	@RequestMapping(value = "/mypage/modifyResumes", method=RequestMethod.GET)
	public void modifyResumes(
			HttpSession session
			, Model model
			, HttpServletRequest req
//			, @RequestParam(required=false , defaultValue="0") int cutPage
			) {
		logger.info("---modifyResumes---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Band band = new Band();
		band.setUserId(member.getUserId());
		band = mpService.getBand(band);
		logger.info(band.toString());
		
		Music music = new Music();
		music.setBandNo(band.getBandNo());
		
		ProfilePic pPic = new ProfilePic();
		pPic.setProfileNo(band.getProfileNo());
		pPic = mpService.getProfilePic(pPic);
		
		List<Music> musicList = mpService.getMusicList(music);
		logger.info(musicList.toString());
		
		Resumes resumes = new Resumes();
		Genre genre = new Genre();
		BandGenre bandGenre = new BandGenre();
		
		if ( req.getParameter("resumesNo") != null && !"".equals(req.getParameter("resumesNo")) ) {
			resumes.setResumesNo(Integer.parseInt( req.getParameter("resumesNo")) );
			resumes = mpService.getResumes(resumes);	
			logger.info(resumes.toString());
			
			bandGenre.setBandNo(band.getBandNo());
			bandGenre.setResumesNo(resumes.getResumesNo());
			bandGenre = mpService.getBandGenre(bandGenre);
			logger.info(bandGenre.toString());
			
			genre = new Genre();
			genre.setGenreNo(bandGenre.getGenreNo());
			genre = mpService.getGenre(genre);
			logger.info(genre.toString());
			
		} else {
			resumes.setBandNo(band.getBandNo());
			mpService.createResumes(resumes);
			logger.info(resumes.toString());
			
			bandGenre.setBandNo(band.getBandNo());
			bandGenre.setResumesNo(resumes.getResumesNo());
			mpService.createBandGenre(bandGenre);
			logger.info(bandGenre.toString());
			
		}
		
		List<History> historyList = mpService.getHistoryList(resumes);
		int hList = historyList.size();
		
		model.addAttribute("pPic", pPic);
		model.addAttribute("band", band);
		model.addAttribute("member", member);
		model.addAttribute("resumes", resumes);
		model.addAttribute("musicList", musicList);
		model.addAttribute("hList", hList);
		model.addAttribute("historyList", historyList);
		model.addAttribute("genre", genre);
		
	}
	
	@RequestMapping(value = "/mypage/addHistorylist", method=RequestMethod.POST)
	public String addHistorylistProc(
			HttpSession session
			, HttpServletRequest req
			) {
			logger.info("---addHistorylistProc---");
			
			Member member = (Member) session.getAttribute("loginInfo");
			logger.info(member.toString());
			
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			logger.info(band.toString());
			
			History history = new History();
			history.setResumesNo(Integer.parseInt( req.getParameter("resumesNo") ));
			mpService.addHistoryList(history);
		
			return "redirect:/mypage/modifyResumes?resumesNo="+history.getResumesNo();
	}
	
	@RequestMapping(value = "/mypage/minHistorylist", method=RequestMethod.POST)
	public String minHistorylistProc(
			HttpSession session
			, HttpServletRequest req
			) {
			logger.info("---minHistorylistProc---");
			
			Member member = (Member) session.getAttribute("loginInfo");
			logger.info(member.toString());
			
			History history = new History();
			history.setResumesNo(Integer.parseInt( req.getParameter("resumesNo") ));
			
			int rnum = Integer.parseInt( req.getParameter("rnum") );
			mpService.minHistoryList(history, rnum);
		
			return "redirect:/mypage/modifyResumes?resumesNo="+history.getResumesNo();
	}
	
	@RequestMapping(value = "/mypage/modifyResumesProc", method=RequestMethod.POST)
	public String modifyResumesProc(
			HttpServletRequest req
			){
		logger.info("---modifyResumesProc---");
//		밴드소개 제목 저장
//		밴드 소개란 저장
//		첨부파일 선택 저장
		Resumes resumes = new Resumes();
		resumes.setResumesNo(Integer.parseInt(req.getParameter("resumesNo")) );
		resumes = mpService.getResumes(resumes);
		
		if ( req.getParameter("resumesTitle") != null && !"".equals(req.getParameter("resumesTitle"))) {
			logger.info("---setResumesInfo---");
			mpService.setResumesInfo(req);
		
//		히스토리 저장
			History history = new History();
			history.setResumesNo(resumes.getResumesNo());
				
			List<History> historyList = mpService.getHistoryList(resumes);
			
			int i = 0;
			for(History his : historyList) {
//				if ( req.getParameter("historyNo") != null && !"".equals(req.getParameter("historyNo"))) {
					his.setHistoryNo(Integer.parseInt( req.getParameterValues("historyNo")[i]) );
//				}
				his.setYear(req.getParameterValues("year")[i] );
				his.setHistoryInfo(req.getParameterValues("historyInfo")[i]);
				
				mpService.modifyHistoryInfo(his);
				
				logger.info(his.toString());
				i++;
			}
		}
		
//		장르 저장
		if ( req.getParameter("genreNo") != null && !"".equals(req.getParameter("genreNo"))) {
			BandGenre bandGenre = new BandGenre();
			bandGenre.setBandNo(resumes.getBandNo());
			bandGenre.setGenreNo(Integer.parseInt(req.getParameter("genreNo")) );
			bandGenre.setResumesNo(Integer.parseInt(req.getParameter("resumesNo")) );
			mpService.updateBandGenre(bandGenre);
		}
		
		return "redirect:/mypage/resumes?resumesNo="+resumes.getResumesNo();
	}
	
	@RequestMapping(value = "/mypage/deleteResumes", method=RequestMethod.POST)
	public String deleteResumes(
			Resumes resumes
			) {
		logger.info("---deleteResumes---");
		
		mpService.deleteResumes(resumes);
		mpService.deleteBandGenre(resumes);
		
		return "redirect:/mypage/intro";
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
	
	@Autowired ServletContext context;

//	private Object barMemberList;
	@RequestMapping(value = "/mypage/uploadSoundIntro", method=RequestMethod.POST)
	public String uploadSoundIntro(
		@RequestParam(value="file",required=false) MultipartFile file
		, HttpServletRequest req
		, HttpSession session
		) {
			logger.info("---uploadSound---");
			
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		Band band = new Band();
		band.setUserId(member.getUserId());
		band = mpService.getBand(band);
		logger.info(band.toString());
		
		Music music = new Music();
		music.setBandNo( band.getBandNo() ); 
		mpService.uploadSound(context, music, file);
		
		return "redirect:/mypage/intro";
	}
	
	@RequestMapping(value = "/mypage/uploadProfilePicIntro", method=RequestMethod.POST)
	public String uploadProfilePicIntro(
		@RequestParam(value="uploadFile",required=false) MultipartFile file
		, HttpServletRequest req
		, HttpSession session
		) {
			logger.info("---uploadProfilePicIntro---");
			
		Member member = (Member) session.getAttribute("loginInfo");
		logger.info(member.toString());
		
		ProfilePic pPic = new ProfilePic();
		
		if ( member.getRoleId() == 1 ) {
			Bar bar = new Bar();
			bar.setUserId(member.getUserId());
			bar = mpService.getBar(bar);
			logger.info(bar.toString());
			
			pPic = new ProfilePic();
			
			if ( bar.getProfileNo() == 0 ) {
				mpService.insertBarProfile(bar);
			}
			
			pPic.setProfileNo(bar.getProfileNo());
			
			mpService.uploadPicture(context, pPic, file);
			
			
					
		} else if ( member.getRoleId() == 2 ) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			logger.info(band.toString());
			
			pPic = new ProfilePic();
			
			if( band.getProfileNo() == 0) {
				mpService.insertBandProfile(band);
			}
			
			pPic.setProfileNo(band.getProfileNo());
			
			mpService.uploadPicture(context, pPic, file);
		}
		
		return "redirect:/mypage/intro";
	}
	
	@RequestMapping(value = "/mypage/deleteSound", method=RequestMethod.POST)
	public String deleteSound(
			HttpServletRequest req
			) {
		logger.info("---deleteSound---");
		
		Music music = new Music();
		music.setBandNo( Integer.parseInt(req.getParameter("bandNo")) );
		music.setMusicNo( Integer.parseInt(req.getParameter("musicNo")) );
		
		mpService.updateSoundBandTable(music);
		mpService.deleteSound(music);
		
		
		return "redirect:/mypage/intro";
	}
//	--------------------------------------------------------------------
	@RequestMapping(value = "/mypage/applicationToBar", method=RequestMethod.GET)
	public void applicationToBarView(
			HttpServletRequest req
			, Model model
			, HttpSession session
			) {
		logger.info("---applicationToBarView---");
//		searchApplicationUser
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		Bar bar = new Bar();
		Band band = new Band();
		
		if ( member.getRoleId() == 1 ) {
			bar.setUserId(member.getUserId());
			bar = mpService.getBar(bar);
			logger.info(bar.toString());
			
			String startDate = req.getParameter("appStartDate");
			String endDate = req.getParameter("appEndDate");
			
			System.out.println(startDate + " ~ " + endDate);
			
			int CurPage = mpService.getCurPage(req);
			
			Paging paging;
			
//			검색어가 있다면
			if( startDate!=null && !"".equals(startDate) || endDate!=null && !"".equals(endDate)) {
				logger.info("---getAppTotalCount---");
				int totalCount = mpService.getAppTotalCountAppliedBand(bar, startDate, endDate);
				logger.info("---totalCount String : "+totalCount);
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				logger.info("---appView---");
				List<Application> aList = mpService.appViewAppliedBand(paging, bar, startDate, endDate);
				List<Band> bandNoList = new ArrayList<>();
				List<CalendarD> calList = new ArrayList<>();
				List<PTime> stList = new ArrayList<>();
				List<PTime> enList = new ArrayList<>();
				
				for(Application app : aList) {
					
					Resumes resumes = new Resumes();
					resumes.setResumesNo(app.getResumesNo());
					
					resumes = mpService.getResumes(resumes);
					logger.info(resumes.toString());
					
					CalendarD cal = new CalendarD();
					cal.setCalendarNo(app.getCalendarNo());
					cal = mpService.getCalendar(cal);
					
					PTime startTime = new PTime();
					startTime.setTimeId(cal.getStartTime());
					startTime = mpService.getPTime(startTime);
					
					PTime endTIme = new PTime();
					endTIme.setTimeId(cal.getEndTime());
					endTIme = mpService.getPTime(endTIme);
					
					System.out.println(resumes.getBandNo());
					Band addBand = new Band();
					addBand.setBandNo(resumes.getBandNo());
					addBand = mpService.getBandByBandNo(addBand);
					
					bandNoList.add(addBand);
					calList.add(cal);
					stList.add(startTime);
					enList.add(endTIme);
				}
				logger.info("---addAttribute---");
				model.addAttribute("startDate", startDate);
				model.addAttribute("endDate", endDate);
				model.addAttribute("aList", aList);
				model.addAttribute("calList", calList);
				model.addAttribute("bandNoList", bandNoList);
				model.addAttribute("paging", paging);
				
				model.addAttribute("stList", stList);
				model.addAttribute("enList", enList);
			
			} else {
//				검색어가 없다면,
				int totalCount = mpService.getAppTotalCountAppliedBand(bar);
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				logger.info("---appView---");
				List<Application> aList = mpService.appViewAppliedBand(paging, bar);
				List<Band> bandNoList = new ArrayList<>();
				List<CalendarD> calList = new ArrayList<>();
				List<PTime> stList = new ArrayList<>();
				List<PTime> enList = new ArrayList<>();
				
				for(Application app : aList) {
					
					Resumes resumes = new Resumes();
					resumes.setResumesNo(app.getResumesNo());
					
					resumes = mpService.getResumes(resumes);
					logger.info(resumes.toString());
					
					CalendarD cal = new CalendarD();
					cal.setCalendarNo(app.getCalendarNo());
					cal = mpService.getCalendar(cal);
					
					PTime startTime = new PTime();
					startTime.setTimeId(cal.getStartTime());
					startTime = mpService.getPTime(startTime);
					
					PTime endTIme = new PTime();
					endTIme.setTimeId(cal.getEndTime());
					endTIme = mpService.getPTime(endTIme);
					
					System.out.println(resumes.getBandNo());
					Band addBand = new Band();
					addBand.setBandNo(resumes.getBandNo());
					addBand = mpService.getBandByBandNo(addBand);
					
					bandNoList.add(addBand);
					calList.add(cal);
					stList.add(startTime);
					enList.add(endTIme);
				}
				
				logger.info("---addAttribute---");
				model.addAttribute("aList", aList);
				model.addAttribute("calList", calList);
				model.addAttribute("bandNoList", bandNoList);
				model.addAttribute("paging", paging);
				
				model.addAttribute("stList", stList);
				model.addAttribute("enList", enList);
			}
			
			
			
		} else if ( member.getRoleId() == 2 ) {
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			logger.info(band.toString());
			
			String startDate = req.getParameter("appStartDate");
			String endDate = req.getParameter("appEndDate");
			
			System.out.println(startDate + " ~ " + endDate);
			
			int CurPage = mpService.getCurPage(req);
			
			Paging paging;
			
//			검색어가 있다면
			if( startDate!=null && !"".equals(startDate) || endDate!=null && !"".equals(endDate)) {
				logger.info("---getAppTotalCountAppliedBand(band, startDate, endDate)---");
				int totalCount = mpService.getAppTotalCountAppliedBand(band, startDate, endDate);
				logger.info("---totalCount String : "+totalCount);
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				logger.info("---appViewAppliedBand(paging, band, startDate, endDate)---");
				List<Application> aList = mpService.appViewAppliedBand(paging, band, startDate, endDate);
				List<Band> bandNoList = new ArrayList<>();
				List<CalendarD> calList = new ArrayList<>();
				List<PTime> stList = new ArrayList<>();
				List<PTime> enList = new ArrayList<>();
				
				for(Application app : aList) {
					
					Resumes resumes = new Resumes();
					resumes.setResumesNo(app.getResumesNo());
					
					resumes = mpService.getResumes(resumes);
					logger.info(resumes.toString());
					
					CalendarD cal = new CalendarD();
					cal.setCalendarNo(app.getCalendarNo());
					cal = mpService.getCalendar(cal);
					
					PTime startTime = new PTime();
					startTime.setTimeId(cal.getStartTime());
					startTime = mpService.getPTime(startTime);
					
					PTime endTIme = new PTime();
					endTIme.setTimeId(cal.getEndTime());
					endTIme = mpService.getPTime(endTIme);
					
					System.out.println(resumes.getBandNo());
					Band addBand = new Band();
					addBand.setBandNo(resumes.getBandNo());
					addBand = mpService.getBandByBandNo(addBand);
					
					bandNoList.add(addBand);
					calList.add(cal);
					stList.add(startTime);
					enList.add(endTIme);
				}
				
				logger.info("---addAttribute---");
				model.addAttribute("startDate", startDate);
				model.addAttribute("endDate", endDate);
				model.addAttribute("aList", aList);
				model.addAttribute("calList", calList);
				model.addAttribute("bandNoList", bandNoList);
				model.addAttribute("paging", paging);
				
				model.addAttribute("stList", stList);
				model.addAttribute("enList", enList);
			
			} else {
//				검색어가 없다면,
				int totalCount = mpService.getAppTotalCountAppliedBand(band);
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				logger.info("---appView---");
				List<Application> aList = mpService.appViewAppliedBand(paging, band);
				List<Band> bandNoList = new ArrayList<>();
				List<CalendarD> calList = new ArrayList<>();
				List<PTime> stList = new ArrayList<>();
				List<PTime> enList = new ArrayList<>();
				
				for(Application app : aList) {
					
					Resumes resumes = new Resumes();
					resumes.setResumesNo(app.getResumesNo());
					
					resumes = mpService.getResumes(resumes);
					logger.info(resumes.toString());
					
					CalendarD cal = new CalendarD();
					cal.setCalendarNo(app.getCalendarNo());
					cal = mpService.getCalendar(cal);
					
					PTime startTime = new PTime();
					startTime.setTimeId(cal.getStartTime());
					startTime = mpService.getPTime(startTime);
					
					PTime endTIme = new PTime();
					endTIme.setTimeId(cal.getEndTime());
					endTIme = mpService.getPTime(endTIme);
					
					System.out.println(resumes.getBandNo());
					Band addBand = new Band();
					addBand.setBandNo(resumes.getBandNo());
					addBand = mpService.getBandByBandNo(addBand);
					
					bandNoList.add(addBand);
					calList.add(cal);
					stList.add(startTime);
					enList.add(endTIme);
				}
				
				logger.info("---addAttribute---");
				model.addAttribute("aList", aList);
				model.addAttribute("calList", calList);
				model.addAttribute("bandNoList", bandNoList);
				model.addAttribute("paging", paging);
				
				model.addAttribute("stList", stList);
				model.addAttribute("enList", enList);
			}
		}
	}
	
	@RequestMapping(value = "/mypage/applicationToBand", method=RequestMethod.GET)
	public void applicationToBandView(
			HttpServletRequest req
			, Model model
			, HttpSession session
//			, Writer out
			) {
		logger.info("---applicationToBandView---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Bar bar = new Bar();
		Band band = new Band();
		
		
		if ( member.getRoleId() == 1 ) {
			bar.setUserId(member.getUserId());
			bar = mpService.getBar(bar);
			
			int CurPage = mpService.getCurPage(req);
			
			String startDate = req.getParameter("appStartDate");
			String endDate = req.getParameter("appEndDate");
			
			System.out.println(startDate + " ~ " + endDate);
			
			Paging paging;
			
//			검색어가 있다면
			if( startDate!=null && !"".equals(startDate) || endDate!=null && !"".equals(endDate)) {
					
					logger.info("---getAppTotalCountAppliedBar(bar, startDate, endDate)---");
					int totalCount = mpService.getAppTotalCountAppliedBar(bar, startDate, endDate);
					logger.info("---totalCount String : "+totalCount);
					
					logger.info("---Paging---");
					paging = new Paging(totalCount, CurPage);
					
					logger.info("---appView---");
					List<Application> aList = mpService.appViewAppliedBar(paging, bar, startDate, endDate);
					List<Band> bandNoList = new ArrayList<>();
					List<CalendarD> calList = new ArrayList<>();
					List<PTime> stList = new ArrayList<>();
					List<PTime> enList = new ArrayList<>();
					
					for(Application app : aList) {
						
						Resumes resumes = new Resumes();
						resumes.setResumesNo(app.getResumesNo());
						
						resumes = mpService.getResumes(resumes);
						logger.info(resumes.toString());
						
						CalendarD cal = new CalendarD();
						cal.setCalendarNo(app.getCalendarNo());
						cal = mpService.getCalendar(cal);
						
						PTime startTime = new PTime();
						startTime.setTimeId(cal.getStartTime());
						startTime = mpService.getPTime(startTime);
						
						PTime endTIme = new PTime();
						endTIme.setTimeId(cal.getEndTime());
						endTIme = mpService.getPTime(endTIme);
						
						System.out.println(resumes.getBandNo());
						Band addBand = new Band();
						addBand.setBandNo(resumes.getBandNo());
						addBand = mpService.getBandByBandNo(addBand);
						
						bandNoList.add(addBand);
						calList.add(cal);
						stList.add(startTime);
						enList.add(endTIme);
					}
					
					logger.info("---addAttribute---");
					model.addAttribute("startDate", startDate);
					model.addAttribute("endDate", endDate);
					model.addAttribute("aList", aList);
					model.addAttribute("calList", calList);
					model.addAttribute("bandNoList", bandNoList);
					model.addAttribute("paging", paging);
					
					model.addAttribute("stList", stList);
					model.addAttribute("enList", enList);
			}
//			검색어가 없다면,
			else {
				logger.info("---getAppTotalCount(bar)---");
				int totalCount = mpService.getAppTotalCountAppliedBar(bar);
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				logger.info("---appView---");
				List<Application> aList = mpService.appViewAppliedBar(paging, bar);
				List<Band> bandNoList = new ArrayList<>();
				List<CalendarD> calList = new ArrayList<>();
				List<PTime> stList = new ArrayList<>();
				List<PTime> enList = new ArrayList<>();
				
				for(Application app : aList) {
					
					Resumes resumes = new Resumes();
					resumes.setResumesNo(app.getResumesNo());
					
					resumes = mpService.getResumes(resumes);
					logger.info(resumes.toString());
					
					CalendarD cal = new CalendarD();
					cal.setCalendarNo(app.getCalendarNo());
					cal = mpService.getCalendar(cal);
					
					PTime startTime = new PTime();
					startTime.setTimeId(cal.getStartTime());
					startTime = mpService.getPTime(startTime);
					
					PTime endTIme = new PTime();
					endTIme.setTimeId(cal.getEndTime());
					endTIme = mpService.getPTime(endTIme);
					
					System.out.println(resumes.getBandNo());
					Band addBand = new Band();
					addBand.setBandNo(resumes.getBandNo());
					addBand = mpService.getBandByBandNo(addBand);
					
					bandNoList.add(addBand);
					calList.add(cal);
					stList.add(startTime);
					enList.add(endTIme);
				}
				
				logger.info("---addAttribute---");
				model.addAttribute("aList", aList);
				model.addAttribute("calList", calList);
				model.addAttribute("bandNoList", bandNoList);
				model.addAttribute("paging", paging);
				
				model.addAttribute("stList", stList);
				model.addAttribute("enList", enList);
			}
			
		} else if ( member.getRoleId() == 2 ) {
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			int CurPage = mpService.getCurPage(req);
			
			String startDate = req.getParameter("appStartDate");
			String endDate = req.getParameter("appEndDate");
			
			System.out.println(startDate + " ~ " + endDate);
			
			Paging paging;
			
//			검색어가 있다면
			if( startDate!=null && !"".equals(startDate) || endDate!=null && !"".equals(endDate)) {
					
					logger.info("---getAppTotalCountAppliedBar(band, startDate, endDate)---");
					int totalCount = mpService.getAppTotalCountAppliedBar(band, startDate, endDate);
					logger.info("---totalCount String : "+totalCount);
					
					logger.info("---Paging---");
					paging = new Paging(totalCount, CurPage);
					
					logger.info("---appView---");
					List<Application> aList = mpService.appViewAppliedBar(paging, band, startDate, endDate);
					List<Band> bandNoList = new ArrayList<>();
					List<CalendarD> calList = new ArrayList<>();
					List<PTime> stList = new ArrayList<>();
					List<PTime> enList = new ArrayList<>();
					
					for(Application app : aList) {
						
						Resumes resumes = new Resumes();
						resumes.setResumesNo(app.getResumesNo());
						
						resumes = mpService.getResumes(resumes);
						logger.info(resumes.toString());
						
						CalendarD cal = new CalendarD();
						cal.setCalendarNo(app.getCalendarNo());
						cal = mpService.getCalendar(cal);
						
						PTime startTime = new PTime();
						startTime.setTimeId(cal.getStartTime());
						startTime = mpService.getPTime(startTime);
						
						PTime endTIme = new PTime();
						endTIme.setTimeId(cal.getEndTime());
						endTIme = mpService.getPTime(endTIme);
						
						System.out.println(resumes.getBandNo());
						Band addBand = new Band();
						addBand.setBandNo(resumes.getBandNo());
						addBand = mpService.getBandByBandNo(addBand);
						
						bandNoList.add(addBand);
						calList.add(cal);
						stList.add(startTime);
						enList.add(endTIme);
					}
					
					logger.info("---addAttribute---");
					model.addAttribute("startDate", startDate);
					model.addAttribute("endDate", endDate);
					model.addAttribute("aList", aList);
					model.addAttribute("calList", calList);
					model.addAttribute("bandNoList", bandNoList);
					model.addAttribute("paging", paging);
					
					model.addAttribute("stList", stList);
					model.addAttribute("enList", enList);
				
			}
//			검색어가 없다면,
			else {
				logger.info("---getAppTotalCount(band)---");
				int totalCount = mpService.getAppTotalCountAppliedBar(band);
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				logger.info("---appView---");
				List<Application> aList = mpService.appViewAppliedBar(paging, band);
				List<Band> bandNoList = new ArrayList<Band>();
				List<CalendarD> calList = new ArrayList<>();
				List<PTime> stList = new ArrayList<>();
				List<PTime> enList = new ArrayList<>();
				
				for(Application app : aList) {
					
					Resumes resumes = new Resumes();
					resumes.setResumesNo(app.getResumesNo());
					
					resumes = mpService.getResumes(resumes);
					logger.info(resumes.toString());
					
					CalendarD cal = new CalendarD();
					cal.setCalendarNo(app.getCalendarNo());
					cal = mpService.getCalendar(cal);
					
					PTime startTime = new PTime();
					startTime.setTimeId(cal.getStartTime());
					startTime = mpService.getPTime(startTime);
					
					PTime endTIme = new PTime();
					endTIme.setTimeId(cal.getEndTime());
					endTIme = mpService.getPTime(endTIme);
					
					System.out.println(resumes.getBandNo());
					Band addBand = new Band();
					addBand.setBandNo(resumes.getBandNo());
					addBand = mpService.getBandByBandNo(addBand);
					
					bandNoList.add(addBand);
					calList.add(cal);
					stList.add(startTime);
					enList.add(endTIme);
				}
				
				System.out.println(bandNoList);
				logger.info("---addAttribute---");
				model.addAttribute("aList", aList);
				model.addAttribute("calList", calList);
				model.addAttribute("bandNoList", bandNoList);
				model.addAttribute("paging", paging);
				
				model.addAttribute("stList", stList);
				model.addAttribute("enList", enList);
			}
		}
		
	}
	
	@RequestMapping(value = "/mypage/applicationToBandAccept", method=RequestMethod.POST)
	public String applicationToBandAccept(
			HttpServletRequest req
			, HttpSession session
			) {
		logger.info("---applicationToBandAccept---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		if ( member.getRoleId() == 1 ) {
			if( req.getParameter("appNo")!=null && !"".equals(req.getParameter("appNo")) ) {
				if( req.getParameter("accept").equals("1") ) {
					
					Application app = new Application();
					app.setAppNo(Integer.parseInt(req.getParameter("appNo") ));
					app.setAccept(Integer.parseInt(req.getParameter("accept") ));
					logger.info(app.toString());
					mpService.appAcceptUpdate(app);
					
					app = mpService.getApp(app);
					
					Resumes res = new Resumes();
					res.setResumesNo(app.getResumesNo());
					res = mpService.getResumes(res);
					
					CalendarD cal = new CalendarD();
					cal.setCalendarNo( app.getCalendarNo() );
					cal.setBandNo(res.getBandNo());
					mpService.updateCalendarByBandNo(cal);
					
					
				} else if( req.getParameter("accept").equals("2") ) {
					Application app = new Application();
					app.setAppNo(Integer.parseInt(req.getParameter("appNo") ));
					app.setAccept(Integer.parseInt(req.getParameter("accept") ));
					
					logger.info(app.toString());
					mpService.appAcceptUpdate(app);
				}
					
			}
			
			return "redirect:/mypage/applicationToBar";
			
		} else {
			if( req.getParameter("appNo")!=null && !"".equals(req.getParameter("appNo")) ) {
				if( req.getParameter("accept").equals("1") ) {
					
					Application app = new Application();
					app.setAppNo(Integer.parseInt(req.getParameter("appNo") ));
					app.setAccept(Integer.parseInt(req.getParameter("accept") ));
					logger.info(app.toString());
					mpService.appAcceptUpdate(app);
					
					app = mpService.getApp(app);
					
					Bar bar = new Bar();
					bar.setBarName(app.getBarName());
					bar = mpService.getBarByBarName(bar);
					
					CalendarD cal = new CalendarD();
					cal.setCalendarNo( app.getCalendarNo() );
					cal.setBarNo(bar.getBarNo());
					mpService.updateCalendarByBarNo(cal);
					
					
				} else if( req.getParameter("accept").equals("2") ) {
					Application app = new Application();
					app.setAppNo(Integer.parseInt(req.getParameter("appNo") ));
					app.setAccept(Integer.parseInt(req.getParameter("accept") ));
					
					logger.info(app.toString());
					mpService.appAcceptUpdate(app);
				}
					
			}
			
			return "redirect:/mypage/applicationToBand";
			
		}
	}
	
	@RequestMapping(value = "/mypage/applicationToBarCancel", method=RequestMethod.POST)
	public String applicationToBarCancel(
			HttpServletRequest req
			, HttpSession session
			) {
		logger.info("---applicationToBarCancel---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Application app = new Application();
		app.setAppNo(Integer.parseInt(req.getParameter("appNo") ));
		
		logger.info(app.toString());
		mpService.appDelete(app);
		if ( member.getRoleId() == 1 ) {
			return "redirect:/mypage/applicationToBar";
		} else {
			return "redirect:/mypage/applicationToBand";
		}
	}
//	--------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/mypage/recommand", method=RequestMethod.GET)
	public void recommandBar(
			HttpSession session
			, Model model
			, HttpServletRequest req
			) {
		logger.info("---recommandBar---");
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Band band = new Band();
		band.setUserId(member.getUserId());
		band = mpService.getBand(band);
		
		Resumes resumes = new Resumes();
		resumes.setBandNo(band.getBandNo() );
		resumes = mpService.getResumesByBandNoWithPublic(resumes);
		
		BandGenre bandGenre = new BandGenre();
		bandGenre.setBandNo(band.getBandNo());
		bandGenre.setResumesNo(resumes.getResumesNo());
		bandGenre = mpService.getBandGenre(bandGenre);
		logger.info(bandGenre.toString());
		
		logger.info("---barView---");
		List<Bar> barList = mpService.barView(bandGenre);
		
		logger.info("---addAttribute---");
		model.addAttribute("barList", barList);
		
	}
//	--------------------------------------------------------------------------------------------------------------------------------------
	
	@Autowired CalendarService calendar;
	
	@RequestMapping(value = "/mypage/calendar", method=RequestMethod.GET)
	public void calendar(
			HttpSession session
			, Model model
			) {
		logger.info("---calendar---");
//		calendarView
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Band band = new Band();
		Bar bar = new Bar();
		
		if ( member.getRoleId() == 1 ) {
			bar.setUserId(member.getUserId());
			bar = mpService.getBar(bar);
			
			Map map = new HashMap();
			
//			map.put("map", calendar.getCalendar());
			map = calendar.getCalendar();
			
			
			Map map2 = mpService.getScheduleByBarNo(map, bar.getBarNo());
//			List list3 = calendar.getInfoBar();
			
			model.addAttribute("number", bar.getBarNo());
//			model.addAttribute("bars", list3);
			model.addAttribute("map", map);
			
		} else if ( member.getRoleId() == 2 ) {
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			Map map = new HashMap();
			
//			map.put("map", calendar.getCalendar());
			map = calendar.getCalendar();
			
			
			Map map2 = mpService.getScheduleByBandNo(map, band.getBandNo());
//			List list3 = calendar.getInfoBar();
			
			model.addAttribute("number", band.getBandNo());
//			model.addAttribute("bars", list3);
			model.addAttribute("map", map);
		}
		
		
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
//	--------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/mypage/userAdmin", method=RequestMethod.GET)
	public void userAdmin(
			HttpServletRequest req
			, Model model
			) {
		logger.info("---userAdmin---");
		
		int CurPage = mpService.getCurPage(req);
		
		logger.info("---getTotalCount---");
		int totalCount = mpService.getUserTotalCount();
		
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
		
		int CurPage = mpService.getCurPage(req);
		
		String search = mpService.getSearch(req);
		int category = mpService.getCategory(req);
		
		Paging paging;
		
//		검색어가 있다면
		if( search!=null && !"".equals(search) && category > 0) {
			logger.info("---getTotalCount---");
			logger.info("---search String : "+search);
			int totalCount = mpService.getUserTotalCount(search, category);
			logger.info("---totalCount String : "+totalCount);
			
			logger.info("---Paging---");
			paging = new Paging(totalCount, CurPage);
			
			//페이징 객체에 검색어 적용
			paging.setSearch(search);
			
			logger.info("---getPagingList---");
			
			List<Member> mbList = mpService.userSearch(paging, category);
			
			logger.info("---addAttribute---");
			model.addAttribute("search", search);
			model.addAttribute("mbList", mbList);
			model.addAttribute("paging", paging);
			
		}
//		검색어가 없다면,
		else {
			logger.info("---getTotalCount---");
			int totalCount = mpService.getUserTotalCount();
			
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
			int totalCount = mpService.getResumesTotalCount();
			
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
			
			int CurPage = mpService.getCurPage(req);
			
			String search = mpService.getSearch(req);
			int category = mpService.getCategory(req);
			
			Paging paging;
			
	//		검색어가 있다면
			if( search!=null && !"".equals(search) && category > 0) {
				logger.info("---getTotalCount---");
				logger.info("---search String : "+search);
				
				int totalCount = mpService.getResumesTotalCount(search, category);
				logger.info("---totalCount String : "+totalCount);
				
				logger.info("---Paging---");
				paging = new Paging(totalCount, CurPage);
				
				//페이징 객체에 검색어 적용
				paging.setSearch(search);
				
				logger.info("---getPagingList---");
				
				List<Resumes> rsList = mpService.boardSearch(paging, category);
				
				logger.info("---addAttribute---");
				model.addAttribute("search", search);
				model.addAttribute("rsList", rsList);
				model.addAttribute("paging", paging);
				
			}
	//		검색어가 없다면,
			else {
				logger.info("---getTotalCount---");
				int totalCount = mpService.getResumesTotalCount();
				
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
			resumes.setResumesNo(Integer.parseInt(req.getParameter("resumesNo") ));
			
			logger.info(resumes.toString());
			mpService.boardDelete(resumes);
			
			return "redirect:/mypage/boardAdmin";
	}
	
//	//bar 소개
//	@RequestMapping(value = "/mypage/barInfo", method=RequestMethod.GET)
//	public void barInfo(Bar bar, //bar dto
//			HttpSession session, //세션
//			HttpServletRequest req, // 요청
//			Model model) { //jsp로 보냄
//		Member member = (Member) session.getAttribute("loginInfo"); //
//		logger.info(member.toString());
//		
//		if( member.getRoleId() == 1) {
//			bar.setUserId(member.getUserId());
//			bar.setBarNo(bar.getBarNo());
//			bar = mpService.getBar(bar);
//			logger.info(bar.toString());
//			
////			BandMember bandMember = new BandMember();
////			List<BandMember> bandMemberList = mpService.getBandMember(bandMember);
//			
//			model.addAttribute("bar", bar);
////			model.addAttribute("barMemberList", barMemberList);
//		}
//		model.addAttribute("member", member);
////		return;
//	
//	}
	
}

