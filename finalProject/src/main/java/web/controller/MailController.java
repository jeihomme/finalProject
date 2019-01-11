package web.controller;

import java.io.IOException;
import java.io.Writer;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MailController {
	
	@Autowired MemberService memberService;
	@Autowired JavaMailSender mailSender;
	
	@RequestMapping(value="/member/mailTest")
	public String mailTest() {
		
		String setFrom = "jazzbar0831@gmail.com";
		String setTo = "aksdnjfe@gmail.com";
		String title = "[JazzBar] Final Mail Test";
		String content = "메일 전송이 성공적으로 이루어졌습니다. -June-";
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(setTo);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/main";
		
	}
	
	@RequestMapping(value="/member/joinmail")
	public String joinMailSend(Member member) {
		
		member = memberService.loginInfo(member);
		
		String setFrom = "jazzbar0831@gmail.com";
		String setTo = member.getEmail();
		String title = "가입을 축하드립니다!";
		String content = member.getUserName()+" 님, JazzBar에 가입해 주셔서 감사합니다.";
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(setTo);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/main";
		
	}
	
	@RequestMapping(value="/mail/findId")
	public void findIDMailSend(
							Member member,
							@RequestParam(required=false, value="telcom") String telcom,
							@RequestParam(required=false, value="contact") String contact,
							@RequestParam(required=false, value="email") String email,
							Writer out) {
		
		// 유저가 기입한 이메일, 통신사, 전화번호를 값 넘겨 주기
		member.setTelcom(telcom);
		member.setContact(contact);
		member.setEmail(email);
		
		// 해당 이메일과 통신사, 그리고 전화번호와 일치하는 정보가 있는지 확인
		if(memberService.checkUserId(member)) {
			
			// ajax에 결과값 반환
			try {
				out.write("{\"res\": true}" );				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 해당 member의 정보 가져오기
			member = memberService.getUserId(member);
			
			String setFrom = "jazzbar0831@gmail.com";
			String setTo = member.getEmail();
			String title = "[JazzBar] Find Your ID";
			String content = member.getUserName()+" 님의 ID는 ["+member.getUserId()+"]입니다."+"\nJazzBar를 이용해 주셔서 감사합니다.";
			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(setFrom);
				messageHelper.setTo(setTo);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				mailSender.send(message);
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value="/mail/findPw")
	public void findPWMailSend(
								Member member,
								@RequestParam(required=false, value="userId") String userId,
								@RequestParam(required=false, value="email") String email,
								Writer out) {
		
		
		// 유저가 기입한 이메일, 통신사, 전화번호를 값 넘겨 주기
		member.setTelcom(userId);
		member.setEmail(email);
		
		// 해당 이메일과 통신사, 그리고 전화번호와 일치하는 정보가 있는지 확인
		if(memberService.checkPassword(member)) {
			
			// ajax에 결과값 반환
			try {
				out.write("{\"res\": true}" );				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 해당 member의 정보 가져오기
			member = memberService.getPassword(member);
			
			String setFrom = "jazzbar0831@gmail.com";
			String setTo = member.getEmail();
			String title = "[JazzBar] Find Your Password";
			String content = member.getUserName()+" 님의 비밀번호는 ["+member.getPassword()+"]입니다."+"\nJazzBar를 이용해 주셔서 감사합니다.";
			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(setFrom);
				messageHelper.setTo(setTo);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				mailSender.send(message);
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}
}
