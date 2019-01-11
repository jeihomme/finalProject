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
	
	public void selectRecommandBarViewByUserId();
	
	public void selectCalendarViewByUserId();
	public void insertCalendar();
	public void updateCalendar();
	public void deleteCalendar();
	
	public int selectUserListCnt();
	public int selectUserCntAll(@Param("search")String search, @Param("category")int category);
	
	public int selectResumesListCnt(Band band);
	
	public int selectResumesListCnt();
	
	public int selectResumesCntAll(@Param("search")String search, @Param("category")int category);
	
	public List<Member> selectUserList(Paging paging);
	public List<Member> selectUserByUserId(@Param("paging")Paging paging, @Param("category")int category);
	public void deleteUser(Member member);
	
	public List<Resumes> selectBoardList(Paging paging);
	public List<Resumes> selectBoardByResumesNo(@Param("paging")Paging paging, @Param("category")int category);
	public void deleteBoard(Resumes resumes);
	
	public Band selectBandByUserId(Band band);
	public Band selectBandByBandNo(Band band);
	public List<BandMember>  selectBandMemberByBandName(BandMember bandMember);
	public void insertBandMemberList(BandMember bandMember);
	public void deleteBandMemberList(@Param("bandMember")BandMember bandMember, @Param("rnum")int rnum);
	
	public Resumes selectResumesByBandNoWithPublic(Resumes resumes);
	public int[] selectResumesByBandNo(Resumes resumes);
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
	public void insertResumesByBandNo(Resumes resumes);
	public List<History> selectHistoryByBandNo(Resumes resumes);
	
	public Music selectMusicByResumesNo(Resumes resumes);
	public void insertSound(Music music);
	public void deleteSoundByMusicNo(Music music);
	public void updateResumesByMusicNo(Music music);
	
	public void insertHistoryList(History history);
	public void deleteHistoryList(@Param("history")History history, @Param("rnum")int rnum);
	public void updateHisotry(History history);
	
	public void updateBandGenre(BandGenre bandGenre);
	public int selectBarListCnt();
	public List<Bar> selectBarList(@Param("bandGenre") BandGenre bandGenre);
	
	public List<Application> selectApplicationList(@Param("paging")Paging paging, @Param("member")Member member);
	public int selectAppDateSearchCntByBarName(@Param("bar")Bar bar, @Param("startDate")String startDate, @Param("endDate")String endDate);
	public List<Application> selectApplicationSearchListByBarName(@Param("paging")Paging paging, @Param("bar")Bar bar, @Param("startDate")String startDate, @Param("endDate")String endDate);
	public void deleteAppByAppNo(Application app);
	
	public Bar selectBarByUserId(Bar bar);
	public Location selectLocationByLocationNo(Location location);
	public ProfilePic selectProfilePicByProfilePicNo(ProfilePic pPic);
	public void updateBar(Bar bar);
	public void updateReadByAppNo(Application app);
	public void updateAcceptByAppNo(Application app);
	public int selectAppListCntByBarName(Bar bar);
	public void insertBandGenreByBandNo(BandGenre bandGenre);
	public void deleteBandGenre(Resumes resumes);
	public void updatePublicResumes(Band band);
	public void updateProfilePic(ProfilePic pPic);
	public void insertBarProfileNo(Bar bar);
	public void insertBandProfileNo(Band band);
	public int selectResumesTotalCount(Band band);
	public int selectAppListCntByBandNo(Band band);
	public int selectAppDateSearchCntByBandNo(@Param("band")Band band, @Param("startDate")String startDate, @Param("endDate")String endDate);
	
	public List<Application> selectApplicationSearchListByBandNoAppliedBar(@Param("paging")Paging paging, @Param("band")Band band, @Param("startDate")String startDate, @Param("endDate")String endDate);
	public List<Application> selectApplicationSearchListByBandNoAppliedBand(@Param("paging")Paging paging, @Param("band")Band band, @Param("startDate")String startDate, @Param("endDate")String endDate);
	public List<Application> selectAppListByBandNoAppliedBar(@Param("paging")Paging paging, @Param("band")Band band);
	public List<Application> selectAppListByBandNoAppliedBand(@Param("paging")Paging paging, @Param("band")Band band);
	
	public List<Application> selectAppListByBarNameAppliedBand(@Param("paging")Paging paging, @Param("bar")Bar bar);
	public List<Application> selectApplicationSearchListByBarNameAppliedBand(@Param("paging")Paging paging, @Param("bar")Bar bar, @Param("startDate")String startDate, @Param("endDate")String endDate);
	public List<Application> selectAppListByBarNameAppliedBar(@Param("paging")Paging paging, @Param("bar")Bar bar);
	public List<Application> selectApplicationSearchListByBarNameAppliedBar(@Param("paging")Paging paging, @Param("bar")Bar bar, @Param("startDate")String startDate, @Param("endDate")String endDate);
	public int selectAppListCntByBandNoAppliedBar(Band band);
	public int selectAppListCntByBandNoAppliedBand(Band band);
	public int selectAppListCntByBarNameAppliedBar(Bar bar);
	public int selectAppListCntByBarNameAppliedBar(Band band);
	
	
	
	
}
