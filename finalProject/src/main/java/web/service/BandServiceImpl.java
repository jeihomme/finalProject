package web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import web.dao.face.BandDao;
import web.dto.Band;

public class BandServiceImpl implements BandService {

	@Autowired BandDao bandDao;
	
	@Override
	public List bandList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List bandCate(String cate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Band bandView(String bandName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void bandEdit(Band band) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List bandSchedule(String bandName) {
		// TODO Auto-generated method stub
		return null;
	}

}
