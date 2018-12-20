package web.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MypageDao;
import web.dto.Band;
import web.dto.BandGenre;
import web.dto.BandMember;
import web.dto.Bar;
import web.dto.Genre;
import web.dto.History;
import web.dto.Member;
import web.dto.Music;
import web.dto.Resumes;
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
	public void resumesView() {
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
	public void resumesModify() {
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
	public List<Resumes> boardView(Paging paging) {
		// TODO Auto-generated method stub
		return mpDao.selectBoardList(paging);
	}

	@Override
	public List<Resumes> boardSearch(Paging paging) {
		// TODO Auto-generated method stub
		return mpDao.selectBoardByResumeNo(paging);
	}

	@Override
	public void boardDelete(Resumes resumes) {
		// TODO Auto-generated method stub
		mpDao.deleteBoard(resumes);
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

	@Override
	public Resumes getResumes(Resumes resumes) {
		// TODO Auto-generated method stub
		return mpDao.selectResumesByResumesNo(resumes);
	}

	@Override
	public List<Resumes> getResumesList(Resumes resumes) {
		// TODO Auto-generated method stub
		return mpDao.selectResumesListByBandName(resumes);
	}

	@Override
	public List<Music> getMusicList(Music music) {
		// TODO Auto-generated method stub
		return mpDao.selectMusicListByBandName(music);
	}

	@Override
	public void deleteResumes(Resumes resumes) {
		// TODO Auto-generated method stub
		mpDao.deleteResumesByResumesNo(resumes);
	}

	@Override
	public BandGenre getBandGenre(BandGenre bandGenre) {
		// TODO Auto-generated method stub
		return mpDao.selectBandGenreByBandNo(bandGenre);
	}

	@Override
	public Genre getGenre(Genre genre) {
		// TODO Auto-generated method stub
		return mpDao.selectGenreByGenreNo(genre);
	}

	@Override
	public void updatePublicResumes(Resumes resumes) {
		// TODO Auto-generated method stub
		mpDao.updatePublicResumesByResumesNo(resumes);
	}

	@Override
	public void createResumes(Resumes resumes) {
		// TODO Auto-generated method stub
		mpDao.insertResumesByBandName(resumes);
	}

	@Override
	public List<History> getHistoryList(Resumes resumes) {
		// TODO Auto-generated method stub
		return mpDao.selectHistoryByBandName(resumes);
	}

	@Override
	public Music getMusic(Resumes resumes) {
		// TODO Auto-generated method stub
		return mpDao.selectMusicByResumesNo(resumes);
	}

	@Override
	public void uploadSound(ServletContext context, Music music, MultipartFile file) {
		// TODO Auto-generated method stub
//		UUID, 고유 식별자
//		String uId = UUID.randomUUID().toString().split("-")[0];
		
//		파일이 저장될 경로
		String path = context.getRealPath("resources");
		
		System.out.println(path);
		
//		저장될 파일의 이름
		String musicTitle = file.getOriginalFilename();
		
//		파일 객체
		File saveSound = new File(path, musicTitle);
		
//		파일 저장 ( 업로드 )
		try {
			file.transferTo(saveSound);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		music.setMusicTitle(musicTitle);
		music.setPath(path);
		
		mpDao.insertSound(music);
	}

	@Override
	public void deleteSound(Music music) {
		// TODO Auto-generated method stub
		mpDao.deleteSoundByMusicNo(music);
	}

	@Override
	public void updateSoundBandTable(Music music) {
		// TODO Auto-generated method stub
		mpDao.updateResumesByMusicNo(music);
	}

	@Override
	public void addHistoryList(History history) {
		// TODO Auto-generated method stub
		mpDao.insertHistoryList(history);
	}

	@Override
	public void minHistoryList(History history) {
		// TODO Auto-generated method stub
		mpDao.deleteHistoryList(history);
	}

	@Override
	public Bar getBar(Bar bar) {
		return mpDao.barInfo(bar);
	}

	@Override
	public Bar barInfoList(Bar bar) {
		return mpDao.barInfo(bar);
	}



	
	
}
