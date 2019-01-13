package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Bar;
import web.dto.Member;
import web.dto.Notice;
import web.service.face.MainService;
import web.service.face.MemberService;

@Controller
public class MainController {
	
	@Autowired MemberService mService;
	@Autowired MainService mainService;
	
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
			, Bar bar5
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
		
		session.setAttribute("bar1", bar1);
		session.setAttribute("bar2", bar2);
		session.setAttribute("bar3", bar3);
		session.setAttribute("bar4", bar4);
		
		bar1.getProfileNo();
		bar2.getProfileNo();
		bar3.getProfileNo();
		bar4.getProfileNo();

	}

}
