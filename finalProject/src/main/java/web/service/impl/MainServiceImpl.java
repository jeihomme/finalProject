package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MainDao;
import web.dto.Bar;
import web.dto.Notice;
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

	
}
