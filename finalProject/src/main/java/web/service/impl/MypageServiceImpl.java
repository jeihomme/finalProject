package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MypageDao;
import web.dto.Band;
import web.dto.BandMember;
import web.dto.Member;
import web.dto.Resume;
import web.service.face.MypageService;
import web.utils.Paging;

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
	public void infoBandMemberModify(BandMember bandMember) {
		// TODO Auto-generated method stub
		mpDao.updateBandMember(bandMember);
	}
	
	@Override
	public void modifyPw(Member member) {
		// TODO Auto-generated method stub
		mpDao.updatePw(member);
	}
//	----------------------------------------------------------
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
	public int getTotalCount() {
		return mpDao.selectUserListCnt();
	}
	
	@Override
	public int getTotalCount(String search) {
		return mpDao.selectCntAll(search);
	}

	@Override
	public int getCurPage(HttpServletRequest req) {
	
		//요청파라미터 받기
		String curPage = req.getParameter("curPage");
		
		//null이나 ""이 아니면 int로 리턴
		if( curPage != null && !"".equals(curPage) ) {
			return Integer.parseInt( curPage );
		}

		//null이나 "" 면 0으로 반환
		return 0;
	}
	
	@Override
	public String getSearch(HttpServletRequest req) {
		//요청파라미터 받기
		String search = req.getParameter("searchKeyowrd");
		
		return search;
	}
//	--------------------------유저 관리
	@Override
	public List<Member> userView(Paging paging) {
		// TODO Auto-generated method stub
		return mpDao.selectUserList(paging);
	}
	
	@Override
	public List<Member> userSearch(Paging paging) {
		// TODO Auto-generated method stub
		return mpDao.selectUserByUserId(paging);
	}
	
	@Override
	public void userDelete(Member member) {
		// TODO Auto-generated method stub
		mpDao.deleteUser(member);
	}
//	------------------------------- 게시글 관리
	@Override
	public List<Resume> boardView(Paging paging) {
		// TODO Auto-generated method stub
		return mpDao.selectBoardList(paging);
	}

	@Override
	public List<Resume> boardSearch(Paging paging) {
		// TODO Auto-generated method stub
		return mpDao.selectBoardByResumeNo(paging);
	}

	@Override
	public void boardDelete(Resume resume) {
		// TODO Auto-generated method stub
		mpDao.deleteBoard(resume);
	}


	@Override
	public void barInfo() {
		// TODO Auto-generated method stub
		
	}

//	-----------------------------------
	@Override
	public Band getBand(Band band) {
		// TODO Auto-generated method stub
		return mpDao.selectBandByUserId(band);
	}
	
	@Override
	public List<BandMember>  getBandMember(BandMember bandMember) {
		// TODO Auto-generated method stub
		return mpDao.selectBandMemberByBandName(bandMember);
	}

	@Override
	public void addMemberList(BandMember bandMember) {
		// TODO Auto-generated method stub
		mpDao.insertBandMemberList(bandMember);
	}

	@Override
	public void minMemberList(BandMember bandMember) {
		// TODO Auto-generated method stub
		mpDao.deleteBandMemberList(bandMember);
	}


	
}
