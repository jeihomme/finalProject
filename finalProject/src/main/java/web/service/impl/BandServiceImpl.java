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
import web.utils.AddItems;

@Service
public class BandServiceImpl implements BandService {

	@Autowired BandDao bandDao;
	@Autowired MusicDao musicDao;
	@Autowired GenreDao genreDao;
	
	@Override
	public List bandList(AddItems addItems, String genre) {

		if(genre != null && !"0".equals(genre)) {
			
			return bandDao.getByCate(addItems, genre);
			
		} else {
			
			return bandDao.getList(addItems);
			
		}
	}

	@Override
	public List genreList() {
		
		return genreDao.getGenre();
	}
	
	@Override
	public List getProPic(AddItems addItems, String genre) {

		if(genre != null && !"0".equals(genre)) {

			return bandDao.getProPicByCate(addItems, genre);

		} else {

			return bandDao.getProPic(addItems);

		}
	}
	
	
	// List By Category
	@Override
	public List bandCate(AddItems addItems, String genre) {
		
		return bandDao.getByCate(addItems, genre);
	}
	
	@Override
	public List ProPicByCate(AddItems addItems, String genre) {

		return bandDao.getProPicByCate(addItems, genre);
	}
	
	@Override
	public Map getPrep(String curPage) {
		
		// map 생성
		Map map = new HashMap();
		
		// curPage 셋팅
		if(curPage != null && !"".equals(curPage)) {
			map.put("curPage", Integer.parseInt(curPage));
		} else {
			map.put("curPage", 0);
		}
		
		// total count 셋팅
		int counts = bandDao.getCount();
		map.put("totalCount", counts);
		
		return map;
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
