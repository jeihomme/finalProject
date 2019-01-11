package web.controller;

import java.io.IOException;
import java.io.Writer;
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
import org.springframework.web.servlet.ModelAndView;

import web.service.face.CalendarService;

@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired CalendarService calendar;
	
	@RequestMapping(value="/calendar")
	public String calendar(
			Model model,
//			String barNo,
			String bandNo
			) {
		
		System.out.println("bandNo = " + bandNo);
		
		Map map = new HashMap();
		
//		map.put("map", calendar.getCalendar());
		map = calendar.getCalendar();
		
		
		Map map2 = calendar.getSchedule(map, bandNo);
		List list3 = calendar.getInfoBar();
		
		model.addAttribute("bars", list3);
		model.addAttribute("map", map);
//		model.addAttribute("sched", map2); // jsp에서 ${sched }로 불러올 수 없음
		return "/calendar/calendar";
		
	}
	
	@RequestMapping(value="/calendar/info", method=RequestMethod.GET)
	public ModelAndView eachDate(
			String bandNo,
			String tDate
			) {

		System.out.println("today = " + tDate);

		List list = calendar.getInfoBand(bandNo, tDate);
		List list2 = calendar.getHours();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		mav.addObject("datedInfo", list);
		mav.addObject("pTime", list2);
		
		return mav;
		
	}
	
	@RequestMapping(value="/calendar/addBar", method=RequestMethod.POST)
	public void addBar(
			String thisDate,
			String stTime,
			String edTime,
			String barNo,
			String bandNo,
			Writer out,
			Model model
			) {
		
		logger.info(thisDate + " / " + stTime + " / " + edTime + " / " + barNo + " / " + bandNo);
		
		calendar.insertBar(thisDate, stTime, edTime, barNo, bandNo);
		
		try {
			out.write("{\"res\": true}" );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
