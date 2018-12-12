package web.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import web.dto.Bar;
import web.dto.Calendar;
import web.dto.Location;
import web.service.face.BarService;

@Service
public class BarServiceImpl implements BarService{

	@Override
	public List<Bar> barList() {
		// TODO Auto-generated method stub
		return null;
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
	public Bar barView(String barInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Calendar> barCalendar(String barName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void RequestShow(String barName, String bandName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void barUpdate(Bar Info, Location locationName) {
		// TODO Auto-generated method stub
		
	}

}
