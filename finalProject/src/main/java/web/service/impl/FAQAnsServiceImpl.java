package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.FAQAnsDao;
import web.dto.FAQAns;
import web.service.face.FAQAnsService;

@Service
public class FAQAnsServiceImpl implements FAQAnsService {
	
	@Autowired FAQAnsDao faqAnsDao;

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
	public FAQAns view(FAQAns faqAnsView) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(FAQAns faqAns) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify() {
		// TODO Auto-generated method stub
		
	}
}
