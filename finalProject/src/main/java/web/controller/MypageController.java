package web.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;

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
import web.dto.Genre;
import web.dto.History;
import web.dto.HistoryList;
import web.dto.Location;
import web.dto.Member;
import web.dto.Music;
import web.dto.ProfilePic;
import web.dto.Resumes;
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
	public void modifyView(
			HttpSession session
			, Model model
			) {
		
		logger.info("---modifyView---");
		
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
		member.setContact(req.getParameter("contact") );
		
		if( member.getRoleId() == 2) {
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandNo(band.getBandNo());
			List<BandMember> bandMemberList = mpService.getBandMember(bandMember);
			
			int i = 1;
			for(BandMember bM : bandMemberList) {
				bM.setBandMemberNo(i);
				bM.setBandMemName(req.getParameter("bandMemName"+i));
				bM.setmPosition(req.getParameter("mPosition"+i));
				
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
			) {
			logger.info("---addMemberlist---");
			
			Member member = (Member) session.getAttribute("loginInfo");
			logger.info(member.toString());
			
			Band band = new Band();
			band.setUserId(member.getUserId());
			band = mpService.getBand(band);
			
			BandMember bandMember = new BandMember();
			bandMember.setBandNo(band.getBandNo());
			
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
			
			Resumes resumes = new Resumes();
			resumes.setBandNo(band.getBandNo());
	//		logger.info(resumes.toString());
			List<Resumes> resumesList = mpService.getResumesList(resumes);
			logger.info(resumesList.toString());
			
			Music music = new Music();
			music.setBandNo(band.getBandNo());
	//		logger.info(music.toString());
			List<Music> musicList = mpService.getMusicList(music);
			logger.info(musicList.toString());
			
			model.addAttribute("band", band);
			model.addAttribute("resumesList", resumesList);
			model.addAttribute("musicList", musicList);
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
	public String modifyIntroProc(
			HttpServletRequest req
			) {
		logger.info("---modifyIntroProc---");
		
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
		
		return "redirect:/mypage/modifyIntro";
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
			app.setRead(Integer.parseInt(req.getParameter("read") ));
			
			logger.info(app.toString());
			mpService.appReadUpdate(app);
		}

		Band band = new Band();
		band.setBandNo(resumes.getBandNo());
		band = mpService.getBand(band);
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
		
		model.addAttribute("member", member);
		model.addAttribute("band", band);
		model.addAttribute("genre", genre);
		
		model.addAttribute("resumes", resumes);
		model.addAttribute("music", music);
		model.addAttribute("historyList", historyList);
		
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
		
		Resumes resumes = new Resumes();
		resumes.setBandNo(band.getBandNo());
		logger.info(resumes.toString());
		
		List<Resumes> resumesList = mpService.getResumesList(resumes);
		logger.info(resumesList.toString());
		
		for(Resumes rs : resumesList) {
			
			logger.info(rs.toString());
			logger.info(req.getParameter("publicResumes"));
			
			rs.setResumesNo(Integer.parseInt(req.getParameter("resumesNo")));
			rs.setPublicResumes(Integer.parseInt(req.getParameter("publicResumes")) );
			
			mpService.updatePublicResumes(rs);
			
		}
		logger.info(resumesList.toString());
		
		
		return "redirect:/mypage/intro";
	}
	
	@RequestMapping(value = "/mypage/modifyResumes", method=RequestMethod.POST)
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
		
		Resumes resumes = new Resumes();
		if ( req.getParameter("resumesNo") != null && !"".equals(req.getParameter("resumesNo")) ) {
			resumes.setResumesNo(Integer.parseInt( req.getParameter("resumesNo")) );
			resumes = mpService.getResumes(resumes);	
			logger.info(resumes.toString());
			
			List<History> historyList = mpService.getHistoryList(resumes);
			model.addAttribute("music", music);
			model.addAttribute("historyList", historyList);
		} else {
//			resumes.setResumesNo(Integer.parseInt( req.getParameter("resumesNo")) );
			resumes.setBandNo(band.getBandNo());
			resumes = mpService.getResumes(resumes);
			logger.info(resumes.toString());
		}
		
		BandGenre bandGenre = new BandGenre();
		bandGenre.setBandNo(band.getBandNo());
		bandGenre.setResumesNo(resumes.getResumesNo());
		bandGenre = mpService.getBandGenre(bandGenre);
		logger.info(bandGenre.toString());
		
		Genre genre = new Genre();
		genre.setGenreNo(bandGenre.getGenreNo());
		genre = mpService.getGenre(genre);
		logger.info(genre.toString());
		
		List<Music> musicList = mpService.getMusicList(music);
		logger.info(musicList.toString());
		
		model.addAttribute("band", band);
		model.addAttribute("genre", genre);
		model.addAttribute("member", member);
		model.addAttribute("resumes", resumes);
		model.addAttribute("musicList", musicList);
	}
	
	@RequestMapping(value = "/mypage/addHistorylist", method=RequestMethod.POST)
	public String addHistorylistProc(
			HttpSession session
			, HttpServletRequest req
			) {
			logger.info("---addHistorylistProc---");
			
			Member member = (Member) session.getAttribute("loginInfo");
			logger.info(member.toString());
			
			History history = new History();
			history.setResumesNo(Integer.parseInt( req.getParameter("resumesNo") ));
			mpService.addHistoryList(history);
		
			return "redirect:/mypage/modifyResumes";
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
			mpService.minHistoryList(history);
		
			return "redirect:/mypage/modifyResumes";
	}
	
	@RequestMapping(value = "/mypage/modifyResumesProc", method=RequestMethod.POST)
	public String modifyResumesProc(
			HistoryList hList
			, HttpSession session
			, HttpServletRequest req
			){
		logger.info("---modifyResumesProc---");
//		밴드소개 제목 저장
//		밴드 소개란 저장
//		첨부파일 선택 저장
		Resumes resumes = new Resumes();
		resumes.setResumesNo(Integer.parseInt(req.getParameter("resumesNo")) );
		resumes = mpService.getResumes(resumes);
		
		System.out.println(hList);
		
		logger.info(hList.toString());
		
		
//		String[] historyNo = req.getParameterValues("historyNo");
//		String[] year = req.getParameterValues("year");
//		String[] historyInfo = req.getParameterValues("historyInfo");
		
		if ( req.getParameter("resumesTitle") != null && !"".equals(req.getParameter("resumesTitle"))) {
			logger.info("---setResumesInfo---");
			mpService.setResumesInfo(req);
		
//		히스토리 저장
//			History history = new History();
//			history.setResumesNo(resumes.getResumesNo());
				
//			List<History> historyList = (List<History>) hList;
//	
//			for(History his : historyList) {
//				if ( req.getParameter("historyNo") != null && !"".equals(req.getParameter("historyNo"))) {
//					his.setHistoryNo(Integer.parseInt( req.getParameter("historyNo")) );
//				}
//				his.setYear(req.getParameter("year") );
//				his.setHistoryInfo(req.getParameter("historyInfo"));
//				
//				mpService.modifyHistoryInfo(his);
//				
//				logger.info(hList.toString());
//			}
		}
		
//		장르 저장
		if ( req.getParameter("genreNo") != null && !"".equals(req.getParameter("genreNo"))) {
			BandGenre bandGenre = new BandGenre();
			bandGenre.setBandNo(resumes.getBandNo());
			bandGenre.setGenreNo(Integer.parseInt(req.getParameter("genreNo")) );
			bandGenre.setResumesNo(Integer.parseInt(req.getParameter("resumesNo")) );
			mpService.updateBandGenre(bandGenre);
		}
		
//		사진 저장
//		
//		장르저장
//		mpService.createResumes(resumes);
//		resumeView
		return "redirect:/mypage/resumes?resumesNo="+resumes.getResumesNo();
	}
	
	@RequestMapping(value = "/mypage/deleteResumes", method=RequestMethod.POST)
	public String deleteResumes(
			Resumes resumes
			) {
		logger.info("---deleteResumes---");
		
		mpService.deleteResumes(resumes);
		
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
		@RequestParam(value="file") MultipartFile file
		, HttpServletRequest req
		) {
			logger.info("---uploadSound---");
			
		//context, filepload
//		서버 컨텍스트 리얼패스, 업로드파일정보 전달
		Music music = new Music();
		music.setBandNo( Integer.parseInt( req.getParameter("bandNo")) ); 
		mpService.uploadSound(context, music, file);
		
		return "redirect:/mypage/intro";
	}
	
	@RequestMapping(value = "/mypage/deleteSound", method=RequestMethod.POST)
	public String deleteSound(
			Music music
			) {
		logger.info("---deleteSound---");
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
		bar.setUserId(member.getUserId());
		bar = mpService.getBar(bar);
		
		int CurPage = mpService.getCurPage(req);
		
		logger.info("---getTotalCount---");
		int totalCount = mpService.getTotalCount();
		
		logger.info("---Paging---");
		Paging paging = new Paging(totalCount, CurPage);
		
		logger.info("---appView---");
		List<Application> aList = mpService.appView(paging, member);
		
		logger.info("---addAttribute---");
		model.addAttribute("aList", aList);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value = "/mypage/applicationToBar", method=RequestMethod.POST)
	public void applicationToBarSearch(
			HttpServletRequest req
			, Model model
			, HttpSession session
			) {
		logger.info("---applicationToBarSearch---");
//		searchApplicationUser
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Bar bar = new Bar();
		bar.setUserId(member.getUserId());
		bar = mpService.getBar(bar);
		
		String startDate = req.getParameter("appStartDate");
		String endDate = req.getParameter("appEndDate");
		
		System.out.println(startDate + " ~ " + endDate);
		
		int CurPage = mpService.getCurPage(req);
		
		Paging paging;
		
//		검색어가 있다면
		if( startDate!=null && !"".equals(startDate) || endDate!=null && !"".equals(endDate)) {
			logger.info("---getAppTotalCount---");
			int totalCount = mpService.getAppTotalCount(startDate, endDate);
			logger.info("---totalCount String : "+totalCount);
			
			logger.info("---Paging---");
			paging = new Paging(totalCount, CurPage);
			
			logger.info("---appView---");
			List<Application> aList = mpService.appView(paging, member, startDate, endDate);
			
			logger.info("---addAttribute---");
			model.addAttribute("aList", aList);
			model.addAttribute("paging", paging);
		}
//		검색어가 없다면,
		else {
			logger.info("---getTotalCount---");
			int totalCount = mpService.getTotalCount();
			
			logger.info("---Paging---");
			paging = new Paging(totalCount, CurPage);
			
			logger.info("---appView---");
			List<Application> aList = mpService.appView(paging, member);
			
			logger.info("---addAttribute---");
			model.addAttribute("aList", aList);
			model.addAttribute("paging", paging);
		}
	}
	
	
	@RequestMapping(value = "/mypage/applicationToBarCancel", method=RequestMethod.POST)
	public String applicationToBarCancel(
			HttpServletRequest req
			) {
		logger.info("---applicationToBarCancel---");
		Application app = new Application();
		app.setAppNo(Integer.parseInt(req.getParameter("appNo") ));
		
		logger.info(app.toString());
		mpService.appDelete(app);
		
		return "redirect:/mypage/applicationToBar";
	}
	
	@RequestMapping(value = "/mypage/applicationToBand", method=RequestMethod.GET)
	public void applicationToBandView(
			HttpServletRequest req
			, Model model
			, HttpSession session
			) {
		logger.info("---applicationToBandView---");
//		searchApplicationUser
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Bar bar = new Bar();
		bar.setUserId(member.getUserId());
		bar = mpService.getBar(bar);
		
		int CurPage = mpService.getCurPage(req);
		
		logger.info("---getTotalCount---");
		int totalCount = mpService.getTotalCount();
		
		logger.info("---Paging---");
		Paging paging = new Paging(totalCount, CurPage);
		
		logger.info("---appView---");
		List<Application> aList = mpService.appView(paging, member);
		
		logger.info("---addAttribute---");
		model.addAttribute("aList", aList);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value = "/mypage/applicationToBand", method=RequestMethod.POST)
	public void applicationToBandSearch(
			HttpServletRequest req
			, Model model
			, HttpSession session
			) {
		logger.info("---applicationToBandSearch---");
//		searchApplicationUser
		
		Member member = (Member) session.getAttribute("loginInfo");
		member = mbService.loginInfo(member);
		logger.info(member.toString());
		
		Bar bar = new Bar();
		bar.setUserId(member.getUserId());
		bar = mpService.getBar(bar);
		
		String startDate = req.getParameter("appStartDate");
		String endDate = req.getParameter("appEndDate");
		
		System.out.println(startDate + " ~ " + endDate);
		
		int CurPage = mpService.getCurPage(req);
		
		Paging paging;
		
//		검색어가 있다면
		if( startDate!=null && !"".equals(startDate) || endDate!=null && !"".equals(endDate)) {
			logger.info("---getAppTotalCount---");
			int totalCount = mpService.getAppTotalCount(startDate, endDate);
			logger.info("---totalCount String : "+totalCount);
			
			logger.info("---Paging---");
			paging = new Paging(totalCount, CurPage);
			
			logger.info("---appView---");
			List<Application> aList = mpService.appView(paging, member, startDate, endDate);
			
			logger.info("---addAttribute---");
			model.addAttribute("aList", aList);
			model.addAttribute("paging", paging);
		}
//		검색어가 없다면,
		else {
			logger.info("---getTotalCount---");
			int totalCount = mpService.getTotalCount();
			
			logger.info("---Paging---");
			paging = new Paging(totalCount, CurPage);
			
			logger.info("---appView---");
			List<Application> aList = mpService.appView(paging, member);
			
			logger.info("---addAttribute---");
			model.addAttribute("aList", aList);
			model.addAttribute("paging", paging);
		}
	}
	
	@RequestMapping(value = "/mypage/applicationToBandAccept", method=RequestMethod.POST)
	public String applicationToBandAccept(
			HttpServletRequest req
			) {
		logger.info("---applicationToBandCancel---");
		Application app = new Application();
		app.setAppNo(Integer.parseInt(req.getParameter("appNo") ));
		app.setAccept(Integer.parseInt(req.getParameter("accept") ));
		
		logger.info(app.toString());
		mpService.appAcceptUpdate(app);
		
		return "redirect:/mypage/applicationToBand";
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
		resumes = mpService.getResumesByBandNo(resumes);
		
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
//	--------------------------------------------------------------------------------------------------------------------------------------
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

