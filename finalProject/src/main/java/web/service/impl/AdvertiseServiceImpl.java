package web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import web.dao.face.AdvertiseDao;
import web.dao.face.BandGenreDao;
import web.dao.face.MusicDao;
import web.dto.Advertise;
import web.dto.FindMember;
import web.service.face.AdvertiseService;
import web.utils.Paging;

@Service
public class AdvertiseServiceImpl implements AdvertiseService {

	@Autowired private AdvertiseDao advertiseDao;
	@Autowired MusicDao musicDao;
	@Autowired BandGenreDao bandGenreDao;
	
	/*@Override
	public List getList(Paging paging) {
		return advertiseDao.selectPagingList(paging);
	}*/
	
	/*@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		
		int totalCount = this.selectCountAll();
		
		Paging paging = new Paging(totalCount , curPage , listCount , pageCount);
		
		return paging;
	}
	
	public int selectCountAll() {
		// TODO Auto-generated method stub
		return advertiseDao.selectAdvertiseCntAll();
	}*/
	@Override
	public Advertise view(Advertise advertiseView) {
		// TODO Auto-generated method stub
		return null;
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
	@Override
	public List getList(FindMember findMember) {


		return advertiseDao.getList(findMember);
	}

	
	
}
