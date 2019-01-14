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
		
		// 달력 구성 필요 데이터
		Map map = new HashMap();
		map = calendar.getCalendar();
		
		// 달력 스케쥴
		Map sched = new HashMap();
		sched = calendar.getSchedule(map, bandNo);
		
		// 바 리스트
		List list3 = calendar.getBar();
		
		model.addAttribute("bars", list3);
		model.addAttribute("calendar", map);
		model.addAttribute("sched", sched);
		
		return "/calendar/calendar";
		
	}
	
	@RequestMapping(value="/calendar/info", method=RequestMethod.GET)
	public ModelAndView eachDate(
//			String bandNo,
			String barNo,
			String tDate
			) {

		System.out.println("today = " + tDate);
		System.out.println(barNo);
//		System.out.println(bandNo);

//		List list = calendar.getInfoBand(bandNo, tDate);
		List list2 = calendar.getHours();
		Map map = calendar.getInfoBar(barNo, tDate);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
//		mav.addObject("datedInfo", list);
		mav.addObject("pTime", list2);
		mav.addObject("barDInfo", map);
		
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
	
	@RequestMapping(value="/calendar/inviteBand", method=RequestMethod.POST)
	public void inviteBand(
			String calendarNo,
			String barNo,
			String bandNo,
			Writer out
			) {
		
		calendar.inviteBand(calendarNo, barNo, bandNo);
		
		try {
			out.write("{\"res\": true}" );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
