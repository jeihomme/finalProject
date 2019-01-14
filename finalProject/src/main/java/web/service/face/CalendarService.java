package web.service.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CalendarService {

	
	public Map getCalendar();
	
	public List getHours();
	
	public List getBar();
	
	public Map getSchedule(Map map, String bandNo);
		
	public List getInfoBand(String bandNo, String tDate);
	public Map getInfoBar(String barNo, String tDate);
	
	
	public void insertBar(String thisDate, String stTime, String edTime, String barNo, String bandNo);
	
	public void inviteBand(String calendarNo, String barNo, String bandNo);
	
}
