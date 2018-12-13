package web.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MemberController {

	@Autowired MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() {
		
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public void joinProc(Member member) {
		// 가입
		memberService.join(member);
	
	}
	
	@RequestMapping(value="/member/barjoin", method=RequestMethod.GET)
	public void barJoin() {
		
	}
	
	@RequestMapping(value="/member/barjoin", method=RequestMethod.POST)
	public String barJoinProc(Bar bar) {
		// bar 가입
		memberService.barJoin(bar);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/member/bandjoin", method=RequestMethod.GET)
	public void bandJoin() {
		
	}
	
	@RequestMapping(value="/member/bandjoin", method=RequestMethod.POST)
	public String bandJoinProc(Band band) {
		// band 가입
		memberService.bandJoin(band);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/member/idcheck", method=RequestMethod.GET)
	public void idCheck(Member member) {
		// 아이디 중복 확인
		memberService.checkId(member);
		
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() {
		
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProc(
			Member member,
			HttpSession session) {
		
		String redirectUrl = null;
		
		if(memberService.login(member)) {
			// 로그인 성공
			session.setAttribute("login", true);
			
			// 로그인된 아이디의 정보 가져오기
			member = memberService.loginInfo(member);
			
			// loginInfo로 member의 정보 보내기
			session.setAttribute("loginInfo", member);

			
			redirectUrl = "/main";
			
		} else {
			// 로그인 실패
			redirectUrl = "/main";
		}
		
		return "redirect:"+redirectUrl;
		
	}
	
	@RequestMapping(value="/member/checkuserid", method=RequestMethod.GET)
	public String checkUserId(Member member) {
		
		String redirectUrl = null;
		
		// 이메일과 일치하는 아이디가 있을 경우 (유저가 입력한 정보가 회원 정보와 일치)
		if(memberService.checkUserId(member)) {
			
			redirectUrl = "/member/findidmailsend";
		}
	
		return "redirect:"+redirectUrl;
	}
	
	@RequestMapping(value="/member/checkuserpw", method=RequestMethod.GET)
	public String checkUserPw(Member member) {
		
		String redirectUrl = null;
		
		// 이메일과 일치하는 아이디가 있을 경우 (유저가 입력한 정보가 회원 정보와 일치)
		if(memberService.checkPassword(member)) {
			
			redirectUrl = "/member/findpwmailsend";
		}
	
		return "redirect:"+redirectUrl;
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.setAttribute("login", false);
		
		session.invalidate();
		
		return "redirect:/main";
	}


	
}
