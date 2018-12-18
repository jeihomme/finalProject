package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BandDao;
import web.dao.face.GenreDao;
import web.dao.face.MusicDao;
import web.dto.Band;
import web.service.face.BandService;

@Service
public class BandServiceImpl implements BandService {

	@Autowired BandDao bandDao;
	@Autowired MusicDao musicDao;
	@Autowired GenreDao genreDao;
	
	@Override
	public List bandList() {

		List list = bandDao.getList();
		
		return list;
	}

	@Override
	public List bandCate(String cate) {

		List list = bandDao.getByCate(cate);
		
		return list;
	}

	@Override
	public List genreList() {
		
		List list = genreDao.getGenre();
		
		return list;
	}
	
	@Override
	public List getProPic() {

		List list = bandDao.getProPic();
		
		return list;
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
