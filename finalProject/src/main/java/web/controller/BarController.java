package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Bar;
import web.dto.Location;
import web.dto.ProfilePic;
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
		ProfilePic profilePic = new ProfilePic();
		
		logger.info(">> barList");
		
		List<Bar> list = barService.barList(bar, profilePic);
		
		logger.info("list size : " + list.size());
		
		model.addAttribute("list", list);
		
		logger.info(list.toString());
		
		
	}
	
	// 바 소개보기
	@RequestMapping(value="/bar/viewbar", method=RequestMethod.GET)
	public void viewBar(Bar bar, Model model) {
		
		ProfilePic profilePic = new ProfilePic();
		Location location = new Location();
		logger.info(">> viewBar");
		
		logger.info(bar.toString());
		
		model.addAttribute("view", barService.barView(bar, profilePic, location));

		
		logger.info(model.toString());
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
