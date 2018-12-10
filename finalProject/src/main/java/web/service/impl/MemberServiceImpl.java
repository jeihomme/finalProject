package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired MemberDao mDao;
	
	@Override
	public Member getUserinfo(Member inputMemberInfo) {
		
		System.out.println("inputMemberInfo : " + inputMemberInfo);
		
		System.out.println("lDao.selectById(inputMemberInfo) : " + mDao.selectById(inputMemberInfo));
		
//		User dataUser = lDao.selectById(inputUser);
//		
//		System.out.println("dataUser : " + dataUser);
		return mDao.selectById(inputMemberInfo);
	}

	@Override
	public void setUserinfo(Member inputMemberInfo) {
		// TODO Auto-generated method stub
		System.out.println("inputMemberInfo : "+inputMemberInfo);
		mDao.insertUserinfo(inputMemberInfo);
	}
}
