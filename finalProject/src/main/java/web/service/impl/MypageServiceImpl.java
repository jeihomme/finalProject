package web.service.impl;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MypageDao;
import web.dto.Application;
import web.dto.Band;
import web.dto.BandGenre;
import web.dto.BandMember;
import web.dto.Bar;
import web.dto.Genre;
import web.dto.History;
import web.dto.Location;
import web.dto.Member;
import web.dto.Music;
import web.dto.ProfilePic;
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
	public int getUserTotalCount() {
		return mpDao.selectUserListCnt();
	}
	
	@Override
	public int getResumesTotalCount() {
		return mpDao.selectResumesListCnt();
	}
	
	@Override
	public int getUserTotalCount(String search, int category) {
		return mpDao.selectUserCntAll(search, category);
	}
	
	@Override
	public int getResumesTotalCount(String search, int category) {
		return mpDao.selectResumesCntAll(search, category);
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
		System.out.println(req.getParameter("searchKeyowrd"));
		String search = req.getParameter("searchKeyowrd");
		//null이나 ""이 아니면 int로 리턴
		if( search != null && !"".equals(search) ) {
			return req.getParameter("searchKeyowrd");
		}

		//null이나 "" 면 0으로 반환
		return null;
	}
	
	@Override
	public int getCategory(HttpServletRequest req) {
		// TODO Auto-generated method stub
		System.out.println(req.getParameter("searchCategory") );
		String category = req.getParameter("searchCategory");
		
		//null이나 ""이 아니면 int로 리턴
		if( category != null && !"".equals(category) ) {
			return Integer.parseInt( category );
		}

		//null이나 "" 면 0으로 반환
		return 0;
	}


//	--------------------------유저 관리
	@Override
	public List<Member> userView(Paging paging) {
		// TODO Auto-generated method stub
		return mpDao.selectUserList(paging);
	}
	
	@Override
	public List<Member> userSearch(Paging paging, int category) {
		// TODO Auto-generated method stub
		return mpDao.selectUserByUserId(paging, category);
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
	public List<Resumes> boardSearch(Paging paging, int category) {
		// TODO Auto-generated method stub
		return mpDao.selectBoardByResumesNo(paging, category);
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
	public Band getBandByBandNo(Band band) {
		// TODO Auto-generated method stub
		return mpDao.selectBandByBandNo(band);
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
	public void minMemberList(BandMember bandMember, int rnum) {
		// TODO Auto-generated method stub
		mpDao.deleteBandMemberList(bandMember, rnum);
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
		mpDao.insertResumesByBandNo(resumes);
	}

	@Override
	public List<History> getHistoryList(Resumes resumes) {
		// TODO Auto-generated method stub
		return mpDao.selectHistoryByBandNo(resumes);
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
		
//		if( musicTitle != null ) {
			mpDao.insertSound(music);
//		}
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
	public void minHistoryList(History history, int rnum) {
		// TODO Auto-generated method stub
		mpDao.deleteHistoryList(history, rnum);
	}

	@Override
	public void setResumesInfo(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
//		System.out.println(req.getParameter("resumesNo"));
//		System.out.println(req.getParameter("resumesTitle"));
//		System.out.println(req.getParameter("bandNo"));
//		System.out.println(req.getParameter("bandInfo"));
//		System.out.println(req.getParameter("musicNo"));
		
		Resumes resumes = new Resumes();
		
		resumes.setResumesNo(Integer.parseInt(req.getParameter("resumesNo")) );
		resumes.setResumesTitle(req.getParameter("resumesTitle"));
		resumes.setBandNo(Integer.parseInt(req.getParameter("bandNo")) );
		resumes.setBandInfo(req.getParameter("bandInfo"));
		if( !req.getParameter("musicNo").equals("") && req.getParameter("musicNo") != null ) {
			resumes.setMusicNo(Integer.parseInt(req.getParameter("musicNo")) );
		}
		
//		resumes.setPublicResumes(Integer.parseInt(req.getParameter("publicResumes")) );
		
		resumes.toString();
		mpDao.updateResume(resumes);
	}
  
	@Override
	public Bar getBar(Bar bar) {
		return mpDao.selectBarByUserId(bar);
	}

	@Override
	public Bar barInfoList(Bar bar) {
		return mpDao.barInfo(bar);
	}

	@Override
	public void modifyHistoryInfo(History history) {
		// TODO Auto-generated method stub
		mpDao.updateHisotry(history);
	}

	@Override
	public void updateBandGenre(BandGenre bandGenre) {
		// TODO Auto-generated method stub
		mpDao.updateBandGenre(bandGenre);
	}

	@Override
	public List<Bar> barView(BandGenre bandGenre) {
		// TODO Auto-generated method stub
		return mpDao.selectBarList(bandGenre);
	}

	@Override
	public Resumes getResumesByBandNoWithPublic(Resumes resumes) {
		// TODO Auto-generated method stub
		return mpDao.selectResumesByBandNoWithPublic(resumes);
	}

	@Override
	public List<Application> appView(Paging paging, Member member) {
		// TODO Auto-generated method stub
		return mpDao.selectApplicationList(paging, member);
	}

	@Override
	public List<Application> appViewAppliedBand(Paging paging, Bar bar, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mpDao.selectApplicationSearchListByBarNameAppliedBand(paging, bar, startDate, endDate);
	}
	
	@Override
	public List<Application> appViewAppliedBar(Paging paging, Bar bar, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mpDao.selectApplicationSearchListByBarNameAppliedBar(paging, bar, startDate, endDate);
	}

	@Override
	public void appDelete(Application app) {
		// TODO Auto-generated method stub
		mpDao.deleteAppByAppNo(app);
	}

	@Override
	public Location getLocation(Location location) {
		// TODO Auto-generated method stub
		return mpDao.selectLocationByLocationNo(location);
	}

	@Override
	public ProfilePic getProfilePic(ProfilePic pPic) {
		// TODO Auto-generated method stub
		return mpDao.selectProfilePicByProfilePicNo(pPic);
	}

	@Override
	public void updateBar(Bar bar) {
		// TODO Auto-generated method stub
		mpDao.updateBar(bar);
	}

	@Override
	public void appReadUpdate(Application app) {
		// TODO Auto-generated method stub
		mpDao.updateReadByAppNo(app);
	}

	@Override
	public void appAcceptUpdate(Application app) {
		// TODO Auto-generated method stub
		mpDao.updateAcceptByAppNo(app);
	}

	@Override
	public void createBandGenre(BandGenre bandGenre) {
		// TODO Auto-generated method stub
		mpDao.insertBandGenreByBandNo(bandGenre);
	}

	@Override
	public void deleteBandGenre(Resumes resumes) {
		// TODO Auto-generated method stub
		mpDao.deleteBandGenre(resumes);
	}

	@Override
	public void updatePublicResumes(Band band) {
		// TODO Auto-generated method stub
		mpDao.updatePublicResumes(band);
	}

	@Override
	public void uploadPicture(ServletContext context, ProfilePic pPic, MultipartFile file) {
		// TODO Auto-generated method stub
//		UUID, 고유 식별자
//		String uId = UUID.randomUUID().toString().split("-")[0];
		
//		파일이 저장될 경로
		String path = context.getRealPath("resources");
		
		System.out.println(path);
		
//		저장될 파일의 이름
		String picTitle = file.getOriginalFilename();
		
//		파일 객체
		File saveSound = new File(path, picTitle);
		
//		파일 저장 ( 업로드 )
		try {
			file.transferTo(saveSound);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		pPic.setOriginName(picTitle);
		pPic.setStoredName(picTitle);
		pPic.setPath(path);
		
		System.out.println(pPic);
//		if( pPic.get != null ) {
			mpDao.updateProfilePic(pPic);
//		}
	}

	@Override
	public void insertBarProfile(Bar bar) {
		// TODO Auto-generated method stub
		mpDao.insertBarProfileNo(bar);
	}

	@Override
	public void insertBandProfile(Band band) {
		// TODO Auto-generated method stub
		mpDao.insertBandProfileNo(band);
	}

	@Override
	public int getResumesTotalCount(Band band) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListCntByBandNo(band);
	}

	@Override
	public int getResumesTotalCount(Bar bar) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListCntByBarName(bar);
	}

	@Override
	public List<Application> appViewAppliedBand(Paging paging, Bar bar) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListByBarNameAppliedBand(paging, bar);
	}
	
	@Override
	public List<Application> appViewAppliedBar(Paging paging, Bar bar) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListByBarNameAppliedBar(paging, bar);
	}

	@Override
	public int getAppTotalCountAppliedBar(Band band) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListCntByBandNoAppliedBar(band);
	}
	
	@Override
	public int getAppTotalCountAppliedBand(Band band) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListCntByBandNoAppliedBand(band);
	}
	
	@Override
	public List<Application> appViewAppliedBar(Paging paging, Band band, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mpDao.selectApplicationSearchListByBandNoAppliedBar(paging, band, startDate, endDate);
	}

	@Override
	public List<Application> appViewAppliedBar(Paging paging, Band band) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListByBandNoAppliedBar(paging, band);
	}
	
	@Override
	public List<Application> appViewAppliedBand(Paging paging, Band band, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mpDao.selectApplicationSearchListByBandNoAppliedBand(paging, band, startDate, endDate);
	}

	@Override
	public List<Application> appViewAppliedBand(Paging paging, Band band) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListByBandNoAppliedBand(paging, band);
	}

	
	@Override
	public int getAppTotalCountAppliedBar(Bar bar) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListCntByBarNameAppliedBar(bar);
	}

	@Override
	public int getAppTotalCountAppliedBand(Bar bar) {
		// TODO Auto-generated method stub
		return mpDao.selectAppListCntByBarNameAppliedBand(bar);
	}

	@Override
	public int getAppTotalCountAppliedBar(Bar bar, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mpDao.selectAppDateSearchCntByBarNameAppliedBar(bar, startDate, endDate);
	}

	@Override
	public int getAppTotalCountAppliedBand(Bar bar, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mpDao.selectAppDateSearchCntByBarNameAppliedBand(bar, startDate, endDate);
	}

	@Override
	public int getAppTotalCountAppliedBar(Band band, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mpDao.selectAppDateSearchCntByBandNoAppliedBar(band, startDate, endDate);
	}
	@Override
	public int getAppTotalCountAppliedBand(Band band, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mpDao.selectAppDateSearchCntByBandNoAppliedBand(band, startDate, endDate);
	}
	
	
	

}
