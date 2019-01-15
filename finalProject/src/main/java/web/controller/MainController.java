package web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;
import web.dto.Notice;
import web.dto.ProfilePic;
import web.service.face.BandService;
import web.service.face.MainService;
import web.service.face.MemberService;

@Controller
public class MainController {
	
	@Autowired MemberService mService;
	@Autowired MainService mainService;
	@Autowired BandService bandService;
	
	private static final Logger logger
	= LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public void main(
			Member member
			, Notice notice
			, Bar bar1
			, Bar bar2
			, Bar bar3
			, Bar bar4
			, Band band1
			, Band band2
			, Band band3
			, Band band4
			, HttpSession session
			, Model model
			) {
		
		logger.info("---main---");
		
		System.out.println(session.getAttribute("loginInfo"));
		
		// 공지사항 List 불러오기
		List<Notice> noticeList = mainService.getNoticeList();
		session.setAttribute("noticeList", noticeList);
		
		// bar 추천 List 불러오기
		List<Bar> bar = mainService.getBarList();

		bar1 = bar.get(0);
		bar2 = bar.get(1);
		bar3 = bar.get(2);
		bar4 = bar.get(3);
		
		// bar 정보 session에 저장
		session.setAttribute("bar1", bar1);
		session.setAttribute("bar2", bar2);
		session.setAttribute("bar3", bar3);
		session.setAttribute("bar4", bar4);
		
		// bar Photo 정보 찾아오기
		ProfilePic barPic1 = mainService.getBarPicInfo(bar1.getProfileNo());
		ProfilePic barPic2 = mainService.getBarPicInfo(bar2.getProfileNo());
		ProfilePic barPic3 = mainService.getBarPicInfo(bar3.getProfileNo());
		ProfilePic barPic4 = mainService.getBarPicInfo(bar4.getProfileNo());
		
		session.setAttribute("barPic1", barPic1);
		session.setAttribute("barPic2", barPic2);
		session.setAttribute("barPic3", barPic3);
		session.setAttribute("barPic4", barPic4);

		// band 추천 List 불러오기
		List<Band> band = mainService.getBandList();
		
		band1 = band.get(0);
		band2 = band.get(1);
		band3 = band.get(2);
		band4 = band.get(3);
		
		// band 정보 session에 저장
		session.setAttribute("band1", band1);
		session.setAttribute("band2", band2);
		session.setAttribute("band3", band3);
		session.setAttribute("band4", band4);
		
//		Map general1 = bandService.bandView(band1.getBandNo());
//		Map general2 = bandService.bandView(band2.getBandNo());
//		Map general3 = bandService.bandView(band3.getBandNo());
//		Map general4 = bandService.bandView(band4.getBandNo());
//		
//		model.addAttribute("general1", general1);
//		model.addAttribute("general2", general2);
//		model.addAttribute("general3", general3);
//		model.addAttribute("general4", general4);

		// bar Photo 정보 찾아오기
		ProfilePic bandPic1 = mainService.getBandPicInfo(band1.getProfileNo());
		ProfilePic bandPic2 = mainService.getBandPicInfo(band2.getProfileNo());
		ProfilePic bandPic3 = mainService.getBandPicInfo(band3.getProfileNo());
		ProfilePic bandPic4 = mainService.getBandPicInfo(band4.getProfileNo());
		
		session.setAttribute("bandPic1", bandPic1);
		session.setAttribute("bandPic2", bandPic2);
		session.setAttribute("bandPic3", bandPic3);
		session.setAttribute("bandPic4", bandPic4);
		
	}

}
