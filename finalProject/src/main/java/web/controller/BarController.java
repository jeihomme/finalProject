package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.BarService;

@Controller
public class BarController {
	
	@Autowired BarService barService;
	
	private static final Logger logger
		= LoggerFactory.getLogger(BarController.class);
	
	
	@RequestMapping(value="/bar/barlist", method=RequestMethod.GET)
	public void barList() {
		
		logger.info(">> barList");
		
	}
	
	@RequestMapping(value="/bar/viewbar", method=RequestMethod.GET)
	public void viewBar() {
		
		logger.info(">> viewBar");
		
	}

	
}
