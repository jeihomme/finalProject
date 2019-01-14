package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdvertiseDao;
import web.dao.face.BandDao;
import web.dao.face.BandGenreDao;
import web.dao.face.MusicDao;
import web.dto.Advertise;
import web.dto.FindMember;
import web.dto.Genre;
import web.dto.Member;
import web.dto.Part;
import web.dto.ProfilePic;
import web.service.face.AdvertiseService;
import web.utils.Paging;

@Service
public class AdvertiseServiceImpl implements AdvertiseService {

	@Autowired private AdvertiseDao advertiseDao;
	@Autowired MusicDao musicDao;
	@Autowired BandGenreDao bandGenreDao;
	@Autowired BandDao bandDao;
	
	@Override
	public List getList(Paging paging) {
		
		FindMember findM = new FindMember();
		
		
		return advertiseDao.selectPagingList(paging);
	}
	
	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		
		int totalCount = this.selectCountAll();
		
		Paging paging = new Paging(totalCount , curPage , listCount , pageCount);
		
		return paging;
	}
	
	public int selectCountAll() {
		// TODO Auto-generated method stub
		return advertiseDao.selectAdvertiseCntAll();
	}
	@Override
	public Map view(String findNo ) {
		
		Map map = new HashMap();
		
		// advertise
		FindMember findM = advertiseDao.selectAdvertise(findNo);
		map.put("findM", findM);
		
		// profile 사진 가져오기
		int profileNo = advertiseDao.getPicNo(findM.getBandNo());
		ProfilePic proPic = advertiseDao.getProPic(profileNo);
		map.put("proPic", proPic);
		
		// 맴버에서 아이디 가져오기
		String userId = advertiseDao.getMemberUserId(findM.getBandNo());
		Member member = advertiseDao.getMemberContact(userId);
		map.put("member" , member);
		
		// 포지션 번호 가져오기
		String positionNo = advertiseDao.getPositionNo(findM.getPositionNo());
		Part part = advertiseDao.getPtitle(positionNo);
		map.put("part", part);
		
		// 밴드 멤버 가져오기
		List list = advertiseDao.getBMember(findM.getBandNo());
		map.put("bandMember", list);
		
		// 밴드 장르 가져오기
//		List list2 = advertiseDao.getGenre(findM.getBandNo());
//		List list3 = advertiseDao.allGenre();
		String genreNo = advertiseDao.getGenreNo(findM.getGenre());
		Genre genre = advertiseDao.getGenreName(genreNo);
		map.put("genre", genre);
		
//		
//		for(int i=1; i<list2.size(); i++) {
//			for(int j=1; j<list3.size(); j++) {
//				// 여기 작성해야함. 장르 번호에 따라 장르 이름 넣어주기
//				
//				
//				
//			}
//		}
		
		//		map.put("bandGenre", list2);
		
		return map;
	}
	@Override
	public Map write(Advertise advertise) {
		
		List bandNo = advertiseDao.getBand();
		Map map = new HashMap();
	
		map.put("bandNo", bandNo);
		
		return advertiseDao.insertAdvertise(advertise);
		
	}
	@Override
	public Advertise viewMusic(Advertise advertise) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void modify(Advertise advertise) {
		advertiseDao.updateAdvertise(advertise);
		
	}
	@Override
	public int updateMusic() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void delete(String findNo) {
		advertiseDao.deleteAdvertise(findNo);
		
	}

	@Override
	public int selectAdvertiseCntAll() {
		return advertiseDao.selectAdvertiseCntAll();
	}

	@Override
	public ProfilePic viewProfile(int profileNo) {
		
		return advertiseDao.selectProfilePic(profileNo);
	}

	@Override
	public List bandList() {
		// TODO Auto-generated method stub
		return advertiseDao.getBand();
	}

	@Override
	public ProfilePic getPropic() {
		

		// TODO Auto-generated method stub
		return advertiseDao.getProfile();
	}

	@Override
	public FindMember viewAds(String findNo) {
		return advertiseDao.selectAdvertise(findNo);
		
	}

	@Override
	public Part getPart(String positionNo) {
	 return	advertiseDao.getPtitle(positionNo);
		
	}

	
	
}
