package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDao adminDao;

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		
	}
}
