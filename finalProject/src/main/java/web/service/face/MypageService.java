package web.service.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

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
import web.utils.Paging;

public interface MypageService {
//	회원정보
	public Member infoView(Member member);
//	회원정보 수정
	public void infoModify(Member member);
	public void infoBandMemberModify(BandMember bandMember);
//	회원 비밀번호 수정
	public void modifyPw(Member member);
	
	public void calendarView();
	public void modifyCalendar();
	public void deleteCalendar();
	
//	public void userView();
	public int getCurPage(HttpServletRequest req);
	public String getSearch(HttpServletRequest req);
	public int getCategory(HttpServletRequest req);
	
	public int getUserTotalCount(String search, int category);
	public int getUserTotalCount();
	
	public int getResumesTotalCount(String search, int category);
	public int getResumesTotalCount(Band band);
	public int getResumesTotalCount(Bar bar);
	public int getResumesTotalCount();
	
	
	public List<Member> userView(Paging paging);
	public List<Member> userSearch(Paging paging, int category);
	public void userDelete(Member member);
	
	public List<Resumes> boardView(Paging paging);
	public List<Resumes> boardSearch(Paging paging, int category);
	public void boardDelete(Resumes resumes);
	
	public Band getBand(Band band);
	public Band getBandByBandNo(Band band);
	public List<BandMember>  getBandMember(BandMember bandMember);
	public void addMemberList(BandMember bandMember);
	public void minMemberList(BandMember bandMember, int rnum);
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
	public void minHistoryList(History history, int rnum);
	
	public void setResumesInfo(HttpServletRequest req);
	public void modifyHistoryInfo(History history);
	public void updateBandGenre(BandGenre bandGenre);
	
	//bar 소개
	public Bar barInfoList(Bar bar);
	public Bar getBar(Bar bar);
	
	public List<Bar> barView(BandGenre bandGenre);
	public Resumes getResumesByBandNoWithPublic(Resumes resumes);
	public List<Application> appView(Paging paging, Member member);
	public int getAppTotalCount(Bar bar, String startDate, String endDate);
	public List<Application> appView(Paging paging, Bar bar, String startDate, String endDate);
	public void appDelete(Application app);
	public Location getLocation(Location location);
	public ProfilePic getProfilePic(ProfilePic pPic);
	public void updateBar(Bar bar);
	public void appReadUpdate(Application app);
	public void appAcceptUpdate(Application app);
	public int getAppTotalCount(Bar bar);
	public void createBandGenre(BandGenre bandGenre);
	public void deleteBandGenre(Resumes resumes);
	public void updatePublicResumes(Band band);
	public void uploadPicture(ServletContext context, ProfilePic pPic, MultipartFile file);
	public void insertBarProfile(Bar bar);
	public void insertBandProfile(Band band);
	public List<Application> appView(Paging paging, Band band);
	public List<Application> appView(Paging paging, Bar bar);
	public int getAppTotalCount(Band band, String startDate, String endDate);
	public List<Application> appView(Paging paging, Band band, String startDate, String endDate);
	
	
	
	
	
	
	
	
	
	
	
	
	
}
