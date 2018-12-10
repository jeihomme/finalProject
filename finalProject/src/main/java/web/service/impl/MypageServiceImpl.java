package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dao.face.MypageDao;
import web.dto.Member;
import web.service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired MypageDao mpDao;
	
	@Override
	public Member infoView(Member member) {
		// TODO Auto-generated method stub
		
		return mpDao.selectInfoByUserId(member);
	}

	@Override
	public void infoModify(Member member) {
		// TODO Auto-generated method stub
		mpDao.updateInfo(member);
	}

	@Override
	public void modifyPw(Member member) {
		// TODO Auto-generated method stub
		mpDao.updatePw(member);
	}

	@Override
	public void introList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void resumeView() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createBasicInfo() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createSoundFile() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createHistory() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createIntro() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void resumeModify() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void uploadSound() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSound() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void searchVolunteerUser() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void volunteerToBarViewList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteVolunteerToBarView() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void volunteerToBandViewList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteVolunteerToBandView() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void recommandBarViewList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void calendarView() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyCalendar() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCalendar() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userView() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userSearch() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userDelete() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardView() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardSearch() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardDelete() {
		// TODO Auto-generated method stub
		
	}
	
}
