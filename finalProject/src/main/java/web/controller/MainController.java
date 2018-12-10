package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.service.face.MemberService;
import web.service.face.MypageService;

@Controller
public class MainController {
	
	@Autowired MemberService mService;
	
	private static final Logger logger
	= LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public void main(
			HttpSession session
			) {
		logger.info("---main---");
//		session.getAttribute("loginInfo");
	}
	
	@RequestMapping(value = "/member/join", method=RequestMethod.GET)
	public void memberJoin() {
		logger.info("---memberJoin---");
		
//		return "member/join";
	}
	
	@RequestMapping(value = "/member/join", method=RequestMethod.POST)
	public String memberJoinProc(
			Member member
			) {
		logger.info("---memberJoinProc---");
		System.out.println("joinProc user : " + member);
		mService.setUserinfo(member);
		
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/member/login", method=RequestMethod.GET)
	public void memberLogin() {
		logger.info("---memberLogin---");
		
	}
	
	@RequestMapping(value = "/member/login", method=RequestMethod.POST)
	public String memberLoginProc(
			Member inputMemberInfo
			, HttpSession session
			) {
		logger.info("---memberLoginProc---");
		
		Member member = mService.getUserinfo(inputMemberInfo);
		
		System.out.println("member : " + member);
		
		session.setAttribute("login", true);
		session.setAttribute("loginInfo", member);
		
		System.out.println("member : " + session.getAttribute("loginInfo"));
		
		return "main";

	}
	
	@RequestMapping(value = "/member/logout", method=RequestMethod.GET)
	public String memberLogout(
			HttpSession session
			) {
		logger.info("---memberLogout---");
		
		session.setAttribute("login", false);
		
		System.out.println( session.getAttribute("login"));
		
		session.invalidate();
		return "redirect:/main";
	}
}
