package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdvertiseDao;
import web.dao.face.BandGenreDao;
import web.dao.face.MusicDao;
import web.dto.Advertise;
import web.dto.BandMember;
import web.dto.FindMember;
import web.dto.ProfilePic;
import web.service.face.AdvertiseService;
import web.utils.Paging;

@Service
public class AdvertiseServiceImpl implements AdvertiseService {

	@Autowired private AdvertiseDao advertiseDao;
	@Autowired MusicDao musicDao;
	@Autowired BandGenreDao bandGenreDao;
	
	@Override
	public List getList(Paging paigng) {
		return advertiseDao.selectPagingList(paigng);
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
	public Map view(int findNo ) {
		
		Map map = new HashMap();
		
		// advertise
		FindMember findM = advertiseDao.selectAdvertise(findNo);
		map.put("findM", findM);
		
		// profile 사진 가져오기
		int profileNo = advertiseDao.getPicNo(findM.getBandNo());
		ProfilePic proPic = advertiseDao.getProPic(profileNo);
		map.put("proPic", proPic);
		
		// 밴드 멤버 가져오기
		List list = advertiseDao.getBMember(findM.getBandNo());
		map.put("bandMember", list);
		
		// 밴드 장르 가져오기
		List list2 = advertiseDao.getGenre(findM.getBandNo());
		List list3 = advertiseDao.allGenre();
		
		for(int i=1; i<list2.size(); i++) {
			for(int j=1; j<list3.size(); j++) {
				// 여기 작성해야함. 장르 번호에 따라 장르 이름 넣어주기
			}
		}
		
		//		map.put("bandGenre", list2);
		
		return map;
	}
	@Override
	public void write() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Advertise viewMusic(Advertise advertise) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void modify() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int updateMusic() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void delete(Advertise advertise) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectAdvertiseCntAll() {
		return advertiseDao.selectAdvertiseCntAll();
	}
/*	@Override
	public List getList(FindMember findMember) {


		return advertiseDao.getList(findMember);
	}*/

	@Override
	public ProfilePic viewProfile(int profileNo) {
		
		return advertiseDao.selectProfilePic(profileNo);
	}

	
	
}
