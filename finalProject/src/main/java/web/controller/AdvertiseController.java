package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Advertise;
import web.service.face.AdvertiseService;
import web.utils.Paging;

@Controller
public class AdvertiseController {
	
	private Logger logger = LoggerFactory.getLogger(AdvertiseController.class);

	@Autowired AdvertiseService advertiseService;
	
	@RequestMapping(value="/advertise/list", method=RequestMethod.GET)
	public void list(
				Model model,
				@RequestParam(required=false , defaultValue="0") int curPage,
				@RequestParam(required=false , defaultValue="10") int listCount,
				@RequestParam(required=false , defaultValue="10") int pageCount	
			
			) {
		
		Paging paging = advertiseService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		
		List<Advertise> list = advertiseService.getList(paging);
		model.addAttribute("list" ,list);
		
		logger.info("구인구직 리스트");
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
	
	public void view() {
		logger.info("글 상세보기");
	}
}
