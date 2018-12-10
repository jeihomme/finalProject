package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BandDao;
import web.dao.face.MusicDao;
import web.dto.Band;
import web.service.face.BandService;

@Service
public class BandServiceImpl implements BandService {

	@Autowired BandDao bandDao;
	@Autowired MusicDao musicDao;
	
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
