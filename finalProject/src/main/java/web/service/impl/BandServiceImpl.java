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
import web.dto.Music;
import web.dto.Resumes;
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
		
		// 밴드 기본정보
		// bandNo, bandName, ProfileNo
		Band band = bandDao.getBand(bandNo);
		map.put("band", band);
		
		// 밴드 사진 존재유무 확인 후 map에 추가
		if(band.getProfileNo() != 0) {
			map.put("proPic", bandDao.getPic(band.getProfileNo()));
			
		} else {
			// 프로필사진이 없을 경우
			System.out.println("프로필 사진 없음");
		}
		
		// 밴드 대표이력서 정보 
		// resumesNo, bandInfo, musicNo
		Resumes resumes = bandDao.getInfo(bandNo);
		map.put("resumes", resumes);
		
		// 밴드 대표이력서의 음악파일 존재 유무 확인 후 map에 추가
		if(resumes.getMusicNo() != 0) {
			Music music = bandDao.getMusic(resumes.getMusicNo());
			map.put("music", music);

		} else {
			// 음악파일이 없을 경우
			System.out.println("음악파일 없음");
		}
		
		// 밴드 History 정보
		List history = bandDao.getHistory(resumes.getResumesNo());
		if(history.isEmpty()) {
			System.out.println("History 없음");
		} else {
			map.put("history", history);
		}
		
		// 밴드 멤버 정보
		List member = bandDao.getMember(bandNo);
		if(member.isEmpty()) {
			System.out.println("밴드 맴버가 없음");
		} else {
			map.put("member", member);
		}
		
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
