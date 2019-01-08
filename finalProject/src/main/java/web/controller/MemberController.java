package web.controller;


import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;
import web.dto.ProfilePic;
import web.service.face.MemberService;

@Controller
public class MemberController {

	@Inject
	private JavaMailSender mailSender;
	
	@Autowired MemberService memberService;
	@Autowired ServletContext context;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() {
		
	}
	
	@RequestMapping(value="/member/profilePic", method=RequestMethod.POST)
	public void joinPic(@RequestParam(value="JoinPic") MultipartFile joinPic,
							HttpSession session,
							ProfilePic profilePic) {
		String PicName = memberService.profilePicSave(context, joinPic, profilePic);
		
		session.setAttribute("profileName", PicName);
	}

	
	@Transactional
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public void joinProc(Member member,
							Bar bar,
							Band band,
							@RequestParam(required=false, value="locationName") String locationName, 
							HttpSession session,
							Writer out) {
		
		int profileNo = 0;
		String profileName = null;
		
		// bar 가입일 때
		if(member.getRoleId()==1) {		
			if(locationName.equals("서울")) {
				bar.setLocationNo(1);
			} else if(locationName.equals("경기")) {
				bar.setLocationNo(2);
			} else if(locationName.equals("인천")) {
				bar.setLocationNo(3);
			} else if(locationName.equals("대전")) {
				bar.setLocationNo(4);
			} else if(locationName.equals("세종")) {
				bar.setLocationNo(5);
			} else if(locationName.equals("강원")) {
				bar.setLocationNo(6);
			} else if(locationName.equals("충북")) {
				bar.setLocationNo(7);
			} else if(locationName.equals("충남")) {
				bar.setLocationNo(8);
			} else if(locationName.equals("부산")) {
				bar.setLocationNo(9);
			} else if(locationName.equals("대구")) {
				bar.setLocationNo(10);
			} else if(locationName.equals("울산")) {
				bar.setLocationNo(11);
			} else if(locationName.equals("경북")) {
				bar.setLocationNo(12);
			} else if(locationName.equals("경남")) {
				bar.setLocationNo(13);
			} else if(locationName.equals("전북")) {
				bar.setLocationNo(14);
			} else if(locationName.equals("전남")) {
				bar.setLocationNo(15);
			} else if(locationName.equals("제주")) {
				bar.setLocationNo(16);
			}
			
			// 프로필 사진 no 찾아서 member에 넘겨주기
			profileName = (String) session.getAttribute("profileName");
			profileNo = memberService.checkProfileNo(profileName);
			bar.setProfileNo(profileNo);
			
			memberService.join(member);
			memberService.barJoin(bar);
			
			// bar와 member 가입 정보가 제대로 넘겨졌는지 확인
			if(memberService.login(member)) {
				
				try {
					out.write("{\"res\": true}" );				
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			} 
			
		} else if(member.getRoleId()==2) {
			
			// 프로필 사진 no 찾아서 member에 넘겨주기
			profileName = (String) session.getAttribute("profileName");
			profileNo = memberService.checkProfileNo(profileName);
			band.setProfileNo(profileNo);
			
			memberService.join(member);
			memberService.bandJoin(band);
			
			// bar와 member 가입 정보가 제대로 넘겨졌는지 확인
			if(memberService.login(member)) {
				
				try {
					out.write("{\"res\": true}" );				
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		
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
	
	@RequestMapping(value="/member/check", method=RequestMethod.POST)
	public void joinCheckIdPw(Member member,
			@RequestParam(required=false, value="passwordChk") String passChk,
			Writer out) {
		
		// id가 유효한지 확인
		if(memberService.checkId(member)) {
			
			try {
				out.write("{\"res\": true}" );				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		// userName이 유효한지 확인	
		} else if(memberService.checkPassword(member)) {
			try {
				out.write("{\"res\": true}" );				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else if(member.getPassword().equals(passChk)) {
			try {
				out.write("{\"res\": true}" );				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	

}
