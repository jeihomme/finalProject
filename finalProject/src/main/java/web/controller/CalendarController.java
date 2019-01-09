package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web.service.face.CalendarService;

@Controller
public class CalendarController {

	@Autowired CalendarService calendar;
	
	@RequestMapping(value="/calendar")
	public String calendar(
			Model model,
			int bandNo) {
		
		System.out.println("bandNo = " + bandNo);
		
		Map map = new HashMap();
		
		map = calendar.getCalendar();

		
		System.out.println("aaa " + map.get("firstDayOfMonth"));
		System.out.println("bbb " + map.get("firstDayOfNextMonth"));
		System.out.println("");
		
		List list = calendar.getSchedule(map);
		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/calendar");
		
//		return mav;
		
		
		model.addAttribute("map", map);
		model.addAttribute("sched", list);
		return "/calendar/calendar";
		
	}
	
	@RequestMapping(value="/calendar/info", method=RequestMethod.GET)
	public ModelAndView eachDate(
			String tDate
			) {
		
		// tDate 불러올 수 없음
		System.out.println("today = " + tDate);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		mav.addObject("tDate", tDate);
		
		
		return mav;
		
	}
	
}
