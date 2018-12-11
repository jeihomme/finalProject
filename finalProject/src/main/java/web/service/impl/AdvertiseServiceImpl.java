package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdvertiseDao;
import web.dao.face.BandGenreDao;
import web.dao.face.MusicDao;
import web.dto.Advertise;
import web.service.face.AdvertiseService;

@Service
public class AdvertiseServiceImpl implements AdvertiseService {

	@Autowired AdvertiseDao advertiseDao;
	@Autowired MusicDao musicDao;
	@Autowired BandGenreDao bandGenreDao;
	
	
	@Override
	public List getList() {
		// TODO Auto-generated method stub
		return null;
	}
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
}
