package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.FAQDao;
import web.dto.FAQ;
import web.service.face.FAQService;

@Service
public class FAQServiceImpl  implements FAQService{

	@Autowired FAQDao faqDao;

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
	public FAQ view(FAQ faqView) {
		// TODO Auto-generated method stub
		return null;
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
