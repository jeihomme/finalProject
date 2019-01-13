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
import web.dto.BandMember;
import web.dto.History;
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
	public void delHistory(String codes) {

		if(codes != "") {
			String[] array = codes.split(",");
			
			for(int i=0; i<array.length; i++) {
				bandDao.delHistory(array[i]);
			}
		}
		
	}
	
	@Override
	public void delBMember(String codes) {

		if(codes != "") {
			String[] array = codes.split(",");
			
			for(int i=0; i<array.length; i++) {
				bandDao.delBMember(array[i]);
			}
		}
		
	}
	
	@Override
	public BandMember addBMember(BandMember bMem) {

		bandDao.addBMember(bMem);
		
		return bandDao.getBMember(bMem);
		
	}
	
	@Override
	public List addHistory(History history) {

		bandDao.addHistory(history);
		
		return bandDao.getHistory(history);
		
	}

	@Override
	public String bandEdit(String bandNo, String historyNo, String year,
			String historyInfo, String bandMemberNo, String bandMemName, String mPosition, Resumes resumes) {
		
		if(bandNo != "" && historyNo != "" && year != "" &&
				historyInfo != "" && bandMemberNo != "" && bandMemName != "" && mPosition != "") {
			
			BandMember bandMember = new BandMember();
			History history = new History();
			
			bandMember.setBandNo(Integer.parseInt(bandNo));
			
			String[] array2 = historyNo.split(",");
			String[] array4 = year.split(",");
			String[] array5 = historyInfo.split(",");
			
			String[] array6 = bandMemberNo.split(",");
			String[] array7 = bandMemName.split(",");
			String[] array8 = mPosition.split(",");
			
			// history 업데이트
			for(int i=0; i<array2.length; i++) {
				
				history.setHistoryNo(Integer.parseInt(array2[i]));
				history.setYear(array4[i]);
				history.setHistoryInfo(array5[i]);
				
				bandDao.editHistory(history);
			}
			
			// bandMember 업데이트
			for(int i=0; i<array6.length; i++) {
				
				bandMember.setBandMemberNo(Integer.parseInt(array6[i]));
				bandMember.setBandMemName(array7[i]);
				bandMember.setmPosition(array8[i]);
				
				bandDao.editBandMember(bandMember);
			}
			
			bandDao.editBandInfo(resumes);
		}
		
		bandDao.editBandInfo(resumes);
		String bandInfo = bandDao.getBandInfo(resumes);
		
		return bandInfo;
		
	}
	




}
