package web.controller;


import java.io.IOException;
import java.io.Writer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MemberController {

	@Inject
	private JavaMailSender mailSender;
	
	@Autowired MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() {
		
	}
	
	@Transactional
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public void joinProc(Member member) {
		// 가입
		memberService.join(member);
		
//		// 인증키 생성
//		String key = memberService.getKey(50, false);
		
//		// 인증키 DB 저장 - 아직 만드는 중
//		memberService.createJoinKey(member.getEmail(), key);
//		
//		// 이메일 전송 형식
//		MailSender sendMail = new MailSender(mailSender);
//		sendMail.setSubject("[JazzBar] 서비스 이메일 인증");
//		sendMail.setText(new StringBuffer().append("<h1>메일 인증</h1>").append("<a href=)");
		
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
	public void loginProc(
			Member member,
			HttpSession session,
			Writer out) {
		
		if(memberService.login(member)) {
			
			try {
				out.write("{\"res\": true}" );

				// 로그인 성공
				session.setAttribute("login", true);
				
				logger.info(member.toString());
				
				// 로그인된 아이디의 정보 가져오기
				member = memberService.loginInfo(member);
				
				// loginInfo로 member의 정보 보내기
				session.setAttribute("loginInfo", member);
			
			} catch (IOException e) {
				e.printStackTrace();
			}
			

		} 
		
		
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
