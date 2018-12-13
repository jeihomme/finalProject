package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Bar;
import web.service.face.BarService;

@Controller
public class BarController {
	
	@Autowired BarService barService;
	
	private static final Logger logger
		= LoggerFactory.getLogger(BarController.class);
	
	
	// 바 리스트
	@RequestMapping(value="/bar/barlist", method=RequestMethod.GET)
	public void barList(Model model) {
		
		Bar bar = new Bar();
		
		logger.info(">> barList");
		
		List<Bar> list = barService.barList(bar);
		
		model.addAttribute("list", list);
		
		logger.info(list.toString());
		
		
	}
	
	// 바 소개보기
	@RequestMapping(value="/bar/viewbar", method=RequestMethod.GET)
	public void viewBar(
			Bar barInfo,
			Model model) {
		
		logger.info(">> viewBar");
//		barInfo = barService.barView(barInfo);
//		
//		logger.info(barInfo.toString());
//		model.addAttribute("barInfo", barInfo);
	}
	
	// 소개 수정 폼
	@RequestMapping(value="/bar/updatebarinfo", method=RequestMethod.GET)
	public void updateBarInfo() {
		
	}
	
	// 수정 진행
	@RequestMapping(value="/bar/updatebarinfo", method=RequestMethod.POST)
	public String updateInfoProc() {
		
		return null;
		
	}

	
}