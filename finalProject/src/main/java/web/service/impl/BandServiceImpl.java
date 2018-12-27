package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		return bandDao.getList();
	}

	@Override
	public List bandCate(String cate) {
		
		return bandDao.getByCate(cate);
	}

	@Override
	public List genreList() {
		
		return genreDao.getGenre();
	}
	
	@Override
	public List getProPic() {
		List list = bandDao.getProPic();
		
		return list;
	}
	
	@Override
	public List ProPicByCate(String cate) {

		List list = bandDao.getProPicByCate(cate);
		
		return list;
	}
	
	@Override
	public Map bandView(int bandNo) {

		Map map = new HashMap();
		
		map.put("info", bandDao.getInfo(bandNo));
		map.put("member", bandDao.getMember(bandNo));
		
		return map;
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
