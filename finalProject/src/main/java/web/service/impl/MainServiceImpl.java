package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MainDao;
import web.dto.Band;
import web.dto.BandMember;
import web.dto.Bar;
import web.dto.Notice;
import web.dto.ProfilePic;
import web.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;

	@Override
	public List<Notice> getNoticeList() {
		return mainDao.selectNoticeList();
	}

	@Override
	public List<Bar> getBarList() {
		return mainDao.selectBarList();
	}
	
	@Override
	public ProfilePic getBarPicInfo(int profileNo) {
		return mainDao.selectBarPicInfo(profileNo);
	}
	
	@Override
	public List<Band> getBandList() {
		return mainDao.selectBandList();
	}
	
	@Override
	public List<BandMember> getBandMemberInfo(int bandNo) {
		return mainDao.selectBandMember(bandNo);
	}
	
	@Override
	public ProfilePic getBandPicInfo(int profileNo) {
		return mainDao.selectBandPicInfo(profileNo);
	}
	
}
