package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		List<Location> location = barService.locationList();
		
		logger.info("list size : " + list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("location", location);
		
		logger.info(list.toString());
		
	}
	
	// 바 소개보기
	@RequestMapping(value="/bar/viewbar", method=RequestMethod.GET)
	public void viewBar(Bar bar, Model model) {
		
		logger.info(">> viewBar");
		
		logger.info("-----------------------------");
		model.addAttribute("view", barService.barView(bar));
		
		bar = barService.barView(bar);
		
		logger.info(bar.toString()); 
		logger.info(model.toString()); 
	}

	
	// 소개 수정 폼
	@RequestMapping(value="/bar/updatebarinfo", method=RequestMethod.GET)
	public void updateBarInfo(Bar bar, Model model) {
		
		logger.info(">>updateBar");
		
		model.addAttribute("info", barService.barView(bar));
		
	}
	
	// 수정 진행
	@RequestMapping(value="/bar/updatebarinfo", method=RequestMethod.POST)
	public String updateInfoProc(Bar bar, Model model) {
		
		/*
		 * bar.setBarInfo(bar.getBarInfo()); bar.setManager(bar.getManager());
		 * bar.setContact(bar.getContact());
		 */
		
		logger.info(">>>>> bar : " + bar.toString());
		int b = bar.getBarNo();
		logger.info("updateProc //" + b);
		
		try {
			barService.barUpdate(bar);			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		return "redirect:/bar/viewbar?barNo=" + bar.getBarNo();
		
	}

	// 지역번호(이름)으로 검색

	@RequestMapping(value="/bar/barlocation", method=RequestMethod.POST)
	public ModelAndView barlocation(
			@RequestParam(value = "paramMap[]")List<String> paramMap
			) {
		
		logger.info(">>>>>>> 지역번호 검색!!");
		
		logger.info("받아온 지역 배열 : " + paramMap.toString());
		
//		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Bar> resultList = barService.barLocation(paramMap);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		mav.addObject(resultList);
		mav.addObject("result", "true");
		
		return mav;
		
	}
	
}
