package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.AdvertiseService;

@Controller
public class AdvertiseController {
	
	private Logger logger = LoggerFactory.getLogger(AdvertiseController.class);

	@Autowired AdvertiseService advertiseSerivce;
	
	@RequestMapping(value="/advertise/list", method=RequestMethod.GET)
	public void list() {
		
		logger.info("구인구직 리스트");
		
	}
	
	public void write() {
		logger.info("글쓰기 폼");
		
	}
	
	public String writeProc() {
		logger.info("글쓰기 처리");
		
		return null;
	}
	
	public void update() {
		logger.info("글수정 폼");
	}
	
	public String updateProc() {
		logger.info("글수정 처리");
		
		return null;
	}
	
	public void delete() {
		
	}
}
