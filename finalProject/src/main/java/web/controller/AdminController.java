package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.AdminService;

@Controller
public class AdminController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(AdminController.class);
	
	@Autowired AdminService adminService;

	@RequestMapping(value="/amdin/update", method=RequestMethod.GET)
	public void update() {
		
	}
	
	
}
