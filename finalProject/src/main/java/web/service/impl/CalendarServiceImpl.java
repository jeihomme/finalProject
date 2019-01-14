package web.service.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.CalendarDao;
import web.dto.CalendarD;
import web.dto.PTime;
import web.service.face.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired CalendarDao calendarDao;
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarServiceImpl.class);
	
	private SimpleDateFormat format;
	
	@Override
	public Map getCalendar() {
		
		format = new SimpleDateFormat("dd-MM-yyyy");

		Map map = new HashMap();
		Calendar cal = Calendar.getInstance();
		
		// today 정보
//		logger.info("today : " + cal.getTime());
		map.put("today", cal.getTime());
		
		int curYear = cal.get(cal.YEAR);
//		logger.info("curYear : " + curYear); // 2018 현재 년도
		map.put("curYear", curYear);
		
		int curMonth = cal.get(cal.MONTH) + 1;
//		logger.info("curMonth : " + curMonth); // 12 현재 월
		map.put("curMonth", curMonth);
		
		int curDay = cal.get(cal.DATE);
//		logger.info("curDay : " + curDay); // 13 현재 일
		map.put("curDay", curDay);
		
		// ----------------------------------------------
		
		// 해당월의 1일로 캘린더 설정
		cal.set(cal.DATE, 1);
		map.put("firstDayOfMonth", format.format(cal.getTime()).toString()); // return 타입 Date
//		logger.info("firstDayOfMonth : " + map.get("firstDayOfMonth"));
		
		int firstDayOfWeek = cal.get(cal.DAY_OF_WEEK);
		map.put("firstDayOfWeek", firstDayOfWeek);
//		logger.info("firstDayOfWeek : " + firstDayOfWeek);

		int lastDayOfMonth = cal.getActualMaximum(cal.DAY_OF_MONTH);
		map.put("lastDayOfMonth", lastDayOfMonth);
//		logger.info("lastDayOfMonth : " + lastDayOfMonth);
		
		// ----------------------------------------------
		
		// 해당월의 마지막일로 캘린더 설정
		cal.set(cal.DATE, cal.getActualMaximum(cal.DAY_OF_MONTH));
		int lastDayOfLastWeek = cal.get(cal.DAY_OF_WEEK);
		map.put("lastDayOfLastWeek", lastDayOfLastWeek);
//		logger.info("LastDayOfLastWeek : " + lastDayOfLastWeek);
		
		// ----------------------------------------------
		
		// 다음달의 1일로 설정
		cal.set(cal.MONTH, cal.get(cal.MONTH) + 1);
		cal.set(cal.DATE, 1);
		map.put("firstDayOfNextMonth", format.format(cal.getTime()).toString());
//		logger.info("firstDayOfNextMonth : " + map.get("firstDayOfNextMonth"));
		
		
		// 해당 달 총 일 수
		YearMonth months = YearMonth.of(curYear, curMonth); // year년-month달
//		logger.info("months : " + months);
		
		int days = months.lengthOfMonth(); // 현재 월의 총 일 수 
//		logger.info("days : " + days); // 31
		
		return map;
		
	}

	@Override
	public Map getSchedule(Map map, String bandNo) {

		CalendarD cd = new CalendarD(); 
		
		List sched = calendarDao.schedule(map, bandNo);
		
		List pTime = this.getHours();

		for(int i=0; i < sched.size(); i++) {
			
			cd = (CalendarD) sched.get(i);
			
			String startTime = cd.getStartTime();
			String endTime = cd.getEndTime();
			for(int j=0; j < pTime.size(); j++) {
				
				PTime pt = (PTime) pTime.get(j);
				
				if(startTime.equals(pt.getTimeId())) {
					
					cd.setStartTime(pt.gethourM());
					
				}
				
				if(endTime.equals(pt.getTimeId())) {
					
					cd.setEndTime(pt.gethourM());
				}
				
			}
		}
		
		map.put("sched", sched);
		map.put("pTime", pTime);
		
		return map;
	}

	@Override
	public List getHours() {

		List pTime = calendarDao.getTime();
		
		return pTime;
	}	
	
	@Override
	public List getInfoBand(String bandNo, String tDate) {

		//선택된 날짜
		String[] array = tDate.split("\\.");
		
		String date = array[0] + "-" + array[1] + "-" + array[2];
		
		List list = calendarDao.getInfoBand(bandNo, date);
		
		return list;
	}

	@Override
	public List getBar() {

		List list = calendarDao.getBars();
		
		return list;
	}

	@Override
	public void insertBar(String thisDate, String stTime, String edTime, String barNo, String bandNo) {
		
		String[] array = thisDate.split("\\.");
		
		String date = array[0] + "-" + array[1] + "-" + array[2];
		
		calendarDao.insertBar(thisDate, stTime, edTime, barNo, bandNo);
		

	}

	@Override
	public Map getInfoBar(String barNo, String tDate) {
		
		//선택된 날짜
		String[] array = tDate.split("\\.");

		String date = array[0] + "-" + array[1] + "-" + array[2];

		List list = calendarDao.getInfoBar(barNo, date);
		List list2 = calendarDao.getEmptySched(barNo, date);

		Map map = new HashMap();
		map.put("barInfo", list);
		map.put("emptySched", list2);
				
		return map;
	}

	@Override
	public void inviteBand(String calendarNo, String barNo, String bandNo) {

		int exist = calendarDao.cntApp();
		
		if(exist == 1) {
			
			logger.info("이미 있음");
			
		} else if(exist == 0) {
			
			calendarDao.inviteBand(calendarNo, barNo, bandNo);
		}
		
	}
	
}
