package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.NoticeDao;
import web.dto.Notice;
import web.service.face.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired NoticeDao noticeDao;

	@Override
	public List getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void write() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Notice view(Notice noticeView) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Notice notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify() {
		// TODO Auto-generated method stub
		
	}
	
}
