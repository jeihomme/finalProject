package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BarDao;
import web.dto.Band;
import web.dto.Bar;
import web.dto.Calendar;
import web.dto.Location;
import web.dto.ProfilePic;
import web.service.face.BarService;

@Service
public class BarServiceImpl implements BarService{
	
	@Autowired BarDao barDao;

	@Override
	public List<Bar> barList(Bar bar, ProfilePic profilePic) {
		
		return barDao.getBarList(bar, profilePic);
	}

	@Override
	public List<Bar> barLocation(int locationNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bar> barListMore() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void barUpdate(Bar Info, Location locationName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Bar barView(Bar bar) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Calendar> barCalendar(Bar bar) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void RequestShow(Bar bar, Band band) {
		// TODO Auto-generated method stub
		
	}

}
