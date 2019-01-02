package web.dao.face;

import java.util.List;

import web.dto.Location;

public interface LocationDao {
	
	// 지역 리스트 가져오기
	public List<Location> getLocation();

}
