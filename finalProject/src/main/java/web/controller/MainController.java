package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MainController {
	
	@Autowired MemberService mService;
	
	private static final Logger logger
	= LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public void main(
			Member member
			, HttpSession session
			, Model model
			) {
		logger.info("---main---");
		
		System.out.println(session.getAttribute("loginInfo"));
	}

}
