package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.CalendarD;

public interface CalendarService {

	public Map getCalendar();
	
	public List getSchedule(Map map);
	
	public CalendarD getInfo(int tYear, int tMonth, int tDay);
	
}
