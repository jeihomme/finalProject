package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

public interface MypageDao {
//	회원정보
	public Member selectInfoByUserId(Member member);
//	회원정보 업데이트
	public void updateInfo(Member member);
	public void updateBandMember(BandMember bandMember);
//	회원정보 비밀번호 업데이트
	public void updatePw(Member member);
	
	public void selectIntroListByUserId();
	
	public void selectResumeByUserId();
	public void insertBasicInfo();
	public void insertSoundFile();
	public void insertHistory();
	public void insertIntro();
	public void updateBasicInfo();
	public void updateSoundFile();
	public void updateHistory();
	public void updateIntro();
	
	public void insertResume();
	public void updateResume(Resumes resumes);
	
	public void selectVolunteerListByUserId();
	public void selectVolunteerToBarListByVolunteerId();
	public void deleteVolunteerToBar();
	public void selectVolunteerToBandListByVolunteerId();
	public void deleteVolunteerToBand();
	
	public void selectRecommandBarViewByUserId();
	
	public void selectCalendarViewByUserId();
	public void insertCalendar();
	public void updateCalendar();
	public void deleteCalendar();
	
	public int selectUserListCnt();
	public int selectCntAll(String search);
	public List<Member> selectUserList(Paging paging);
	public List<Member> selectUserByUserId(Paging paging);
	public void deleteUser(Member member);
	
	public List<Resumes> selectBoardList(Paging paging);
	public List<Resumes> selectBoardByResumesNo(Paging paging);
	public void deleteBoard(Resumes resumes);
	
	public Band selectBandByUserId(Band band);
	public List<BandMember>  selectBandMemberByBandName(BandMember bandMember);
	public void insertBandMemberList(BandMember bandMember);
	public void deleteBandMemberList(BandMember bandMember);
	
	public Resumes selectResumesByBandNo(Resumes resumes);
	public List<Resumes> selectResumesListByBandName(Resumes resumes);
	public List<Music> selectMusicListByBandName(Music music);
	

	//bar 소개
	public Bar barInfo(Bar bar);

	public void deleteResumesByResumesNo(Resumes resumes);
	public void deleteMusicByMusicNo(Music music);
	
	public Resumes selectResumesByResumesNo(Resumes resumes);
	
	public BandGenre selectBandGenreByBandNo(BandGenre bandGenre);
	public Genre selectGenreByGenreNo(Genre genre);
	public void updatePublicResumesByResumesNo(Resumes resumes);
	public void insertResumesByBandName(Resumes resumes);
	public List<History> selectHistoryByBandName(Resumes resumes);
	
	public Music selectMusicByResumesNo(Resumes resumes);
	public void insertSound(Music music);
	public void deleteSoundByMusicNo(Music music);
	public void updateResumesByMusicNo(Music music);
	
	public void insertHistoryList(History history);
	public void deleteHistoryList(History history);
	public void updateHisotry(History history);
	
	public void updateBandGenre(BandGenre bandGenre);
	public int selectBarListCnt();
	public List<Bar> selectBarList(@Param("bandGenre") BandGenre bandGenre);
	
	public List<Application> selectApplicationList(@Param("paging")Paging paging, @Param("member")Member member);
	public int selectAppDateSearch(@Param("startDate")String startDate, @Param("endDate")String endDate);
	public List<Application> selectApplicationSearchList(@Param("paging")Paging paging, @Param("member")Member member, @Param("startDate")String startDate, @Param("endDate")String endDate);
	public void deleteAppByAppNo(Application app);
	
	public Bar selectBarByUserId(Bar bar);
	public Location selectLocationByLocationNo(Location location);
	public ProfilePic selectProfilePicByProfilePicNo(ProfilePic pPic);
	public void updateBar(Bar bar);
	public void updateReadByAppNo(Application app);
	public void updateAcceptByAppNo(Application app);
}
