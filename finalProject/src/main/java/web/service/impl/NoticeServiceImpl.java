package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.NoticeDao;
import web.dto.Notice;
import web.service.face.NoticeService;
import web.utils.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired NoticeDao noticeDao;


	@Override
	public void write(Notice notice) {
	noticeDao.insertNotice(notice);
		
	}

	@Override
	public Notice view(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeDao.selectNotice(noticeNo);
	}

	@Override
	public void delete(Notice notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List getList(Paging paging) {
		
		return noticeDao.selectPagingList(paging);
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		int totalCount = this.selectCountAll();
		
		Paging paging = new Paging(totalCount, curPage , listCount , pageCount);
		
		return paging;
	}

	private int selectCountAll() {
	
		return noticeDao.selectNoticeCntAll();
	}
	
}
