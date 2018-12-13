package web.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		String title = "[FINAL] Mail Test";
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
		String content = member.getUserName()+" 님, 가입해 주셔서 감사합니다.";
		
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
	
	@RequestMapping(value="/member/findidmail")
	public String findIDMailSend(Member member) {
		
		member = memberService.loginInfo(member);
		
		String setFrom = "jazzbar0831@gmail.com";
		String setTo = member.getEmail();
		String title = "ID 찾기";
		String content = "귀하의 ID는 "+member.getUserId()+"입니다."+"\n저희 사이트를 이용해 주셔서 감사합니다.";
		
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
	
	@RequestMapping(value="/member/findpwmailsend")
	public String findPWMailSend(Member member) {
		
		member = memberService.loginInfo(member);
		
		String setFrom = "jazzbar0831@gmail.com";
		String setTo = member.getEmail();
		String title = "PW 찾기";
		String content = "귀하의 Password는 "+member.getPassword()+"입니다."+"\n저희 사이트를 이용해 주셔서 감사합니다.";
		
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
}
