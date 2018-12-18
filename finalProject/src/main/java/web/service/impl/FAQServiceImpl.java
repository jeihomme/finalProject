package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.FAQDao;
import web.dto.FAQ;
import web.service.face.FAQService;
import web.utils.Paging;

@Service
public class FAQServiceImpl  implements FAQService{

	@Autowired FAQDao faqDao;

	@Override
	public List getList(Paging paging) {
		// TODO Auto-generated method stub
		return faqDao.selectPagingList(paging);
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		
		int totalCount = this.selectCountAll();
		
		Paging paging = new Paging(totalCount , curPage , listCount , pageCount);
		
		return paging;
	}

	private int selectCountAll() {
		// TODO Auto-generated method stub
		return faqDao.selectFAQCntAll();
	}

	@Override
	public void write(FAQ faq) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FAQ view(int faqNo) {
		// TODO Auto-generated method stub
		return faqDao.selectFAQ(faqNo);
	}

	@Override
	public void delete(FAQ faq) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify() {
		// TODO Auto-generated method stub
		
	}

	

}
