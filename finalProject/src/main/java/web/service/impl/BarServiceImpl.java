package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BarDao;
import web.dao.face.LocationDao;
import web.dto.Band;
import web.dto.Bar;
import web.dto.CalendarD;
import web.dto.Location;
import web.dto.Member;
import web.dto.ProfilePic;
import web.service.face.BarService;

@Service
public class BarServiceImpl implements BarService{
	
	@Autowired BarDao barDao;
	@Autowired LocationDao locationDao;

	@Override
	public List<Bar> barList(Bar bar, ProfilePic profilePic) {
		
		return barDao.getBarList(bar, profilePic);
	}

	@Override
	public List<Bar> barLocation(List<String> location) {
		
		return barDao.getByLocation(location);
	}

	@Override
	public List<Bar> barListMore(Bar bar, ProfilePic profilePic) {
		// TODO Auto-generated method stub
		return barDao.getBarListMore(bar);
	}

	@Override
	public void barUpdate(Bar bar) {
		
		barDao.updateBarInfo(bar);
		
	}

	@Override
	public Bar barView(Bar bar) {
		// TODO Auto-generated method stub
		return barDao.viewBar(bar);
	}

	@Override
	public List<CalendarD> barCalendar(Bar bar) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void RequestShow(Bar bar, Band band) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Location> locationList() {

		return locationDao.getLocation();
	}

	@Override
	public List<Bar> getProfilePic() {
		
		List<Bar> list = barDao.getProfilePic();
		
		return list;
	}

	@Override
	public Map listPaging(String curPage) {
		
//		// map 생성
//		Map map = new HashMap();
//		
//		// curPage 셋팅
//		if(curPage != null && !"".equals(curPage)) {
//			map.put("curPage", Integer.parseInt(curPage));
//		} else {
//			map.put("curPage", 0);
//		}
//		
//		// total count
//		List<Bar> count = barDao.getBarListMore(bar, profilePic);
//		
//		map.put("totalCount", count);
		
		return null;
	}

	@Override
	public void memberContactUpdate(Member member) {
		
		barDao.updateMemberContact(member);
	}

	@Override
	public Member contact(Member member) {
		// TODO Auto-generated method stub
		return barDao.contact(member);
	}

}
