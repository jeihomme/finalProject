package web.service.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Band;
import web.dto.BandGenre;
import web.dto.BandMember;
import web.dto.Bar;
import web.dto.Genre;
import web.dto.History;
import web.dto.Member;
import web.dto.Music;
import web.dto.Resumes;
import web.utils.Paging;
import web.utils.PagingRecomm;

public interface MypageService {
//	회원정보
	public Member infoView(Member member);
//	회원정보 수정
	public void infoModify(Member member);
	public void infoBandMemberModify(BandMember bandMember);
//	회원 비밀번호 수정
	public void modifyPw(Member member);
	
	public void introList();
	
	public void resumesView();
	public void createBasicInfo();
	public void createSoundFile();
	public void createHistory();
	public void createIntro();
	
	public void resumesModify();
	
	public void searchVolunteerUser();
	public void volunteerToBarViewList();
	public void deleteVolunteerToBarView();
	public void volunteerToBandViewList();
	public void deleteVolunteerToBandView();
	
	public void recommandBarViewList();
	
	public void calendarView();
	public void modifyCalendar();
	public void deleteCalendar();
	
//	public void userView();
	public int getCurPage(HttpServletRequest req);
	public String getSearch(HttpServletRequest req);
	public int getTotalCount(String search);
	public int getUserTotalCount();
	public List<Member> userView(Paging paging);
	public List<Member> userSearch(Paging paging);
	public void userDelete(Member member);
	
	public List<Resumes> boardView(Paging paging);
	public List<Resumes> boardSearch(Paging paging);
	public void boardDelete(Resumes resumes);
	
	public Band getBand(Band band);
	public List<BandMember>  getBandMember(BandMember bandMember);
	public void addMemberList(BandMember bandMember);
	public void minMemberList(BandMember bandMember);
	public Resumes getResumes(Resumes resumes);
	public List<Resumes> getResumesList(Resumes resumes);
	public List<Music> getMusicList(Music music);
	
	public void deleteResumes(Resumes resumes);
	
	public BandGenre getBandGenre(BandGenre bandGenre);
	public Genre getGenre(Genre genre);
	public void updatePublicResumes(Resumes resumes);
	public void createResumes(Resumes resumes);
	public List<History> getHistoryList(Resumes resumes);
	public Music getMusic(Resumes resumes);
	public void uploadSound(ServletContext context, Music music, MultipartFile file);
	public void deleteSound(Music music);
	public void updateSoundBandTable(Music music);
	
	public void addHistoryList(History history);
	public void minHistoryList(History history);
	
	public void setResumesInfo(HttpServletRequest req);
	public void modifyHistoryInfo(History history);
	public void updateBandGenre(BandGenre bandGenre);
	
	//bar 소개
	public Bar barInfoList(Bar bar);
	public Bar getBar(Bar bar);
	
	public int getBarTotalCount();
	public List<Bar> barView(PagingRecomm paging);
	
	
	
	
	
	
	
	
	
	
	
	
}
