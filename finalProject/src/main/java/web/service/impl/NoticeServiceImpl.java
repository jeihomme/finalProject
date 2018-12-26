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
		return noticeDao.selectNotice(noticeNo);
	}

	@Override
	public void delete(Notice notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Notice notice) {
		noticeDao.updateNotice(notice);
		
	}

	@Override
	public List getList(Paging paging) {
		
		return noticeDao.selectPagingList(paging);
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount,
				String searchVal  , String search) {
		int totalCount = this.selectCountAll(searchVal , search );
		
		Paging paging = new Paging(totalCount, curPage , listCount , pageCount);
		
		return paging;
	}

	private int selectCountAll(String searchVal ,String search) {
	
		return noticeDao.selectNoticeCntAll(searchVal ,search);
	}
	public int getTotalCount(String searchVal , String search) {
		return noticeDao.selectNoticeCntAll(searchVal , search);
	}
}
