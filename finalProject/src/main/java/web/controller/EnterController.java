package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.MypageService;

@Controller
public class EnterController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(EnterController.class);
	
	@RequestMapping(value = "/enter", method=RequestMethod.GET)
	public void enter() {
		logger.info("---enter---");
	}
}
