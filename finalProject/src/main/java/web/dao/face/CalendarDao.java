package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CalendarDao {

	// 모든 스케쥴 가져오기
	public List schedule(@Param("map") Map map, @Param("bandNo") String bandNo);
	
	// 모든 시간 가져오기
	public List getTime();
	
	// 바 리스트 가져오기
	public List getBars();
	
	// 밴드가 바 추가
	public void insertBar(@Param("thisDate") String thisDate, 
			@Param("stTime") String stTime, 
			@Param("edTime") String edTime, 
			@Param("barNo") String barNo, 
			@Param("bandNo") String bandNo);
	
	// 해당 날짜 정보 가져오기
	public List getInfoBand(@Param("bandNo") String bandNo, @Param("tDate") String tDate);
	public List getInfoBar(@Param("barNo") String barNo, @Param("tDate") String tDate);
	public List getEmptySched(@Param("barNo") String barNo, @Param("tDate") String tDate);
	
	// 초청
	public void inviteBand(@Param("calendarNo") String calendarNo, @Param("barNo") String barNo, 
			@Param("bandNo") String bandNo);
	
	public int cntApp();
	
}
