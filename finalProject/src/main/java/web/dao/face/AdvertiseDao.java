package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Advertise;
import web.dto.FindMember;
import web.dto.Genre;
import web.dto.Member;
import web.dto.Part;
import web.dto.ProfilePic;
import web.utils.Paging;;

public interface AdvertiseDao {

	// 전체 조회
	public List selectPagingList(Paging paging);
	
	// 구인구직 글쓰기
	public Map insertAdvertise(Advertise advertise);
	
	// 구인구직 수정 
	public void updateAdvertise(Advertise advertise);
	
	// 구인구직 삭제
	public void deleteAdvertise(String findNo);
	
	// 구인구직 상세보기
	// advertise 가져오기
	public FindMember selectAdvertise(String findNo);
	
	// profileNo 가져오기
	public int getPicNo(String bandNo);
	
	// profile 사진 가져오기
	public ProfilePic getProPic(int profileNo);
	
	// 밴드 멤버 가져오기
	public List getBMember(String bandNo);
	
	// 포지션 가져오기
	public String getPositionNo(String bandNo);
	public Part getPtitle(String positionNo);
	
	// 장르 가져오기
	public String getGenreNo(String bnadNo);
	public Genre getGenreName(String genreNo);
	// 전체 장르 가져오기
	public List allGenre();
	
	// 맴버 번호 가져오기
	public String getMemberUserId(String bandNo);
	
	// 맴버 전화번호가져오기
	public Member getMemberContact(String userId);
	
	//=-------=-=-=-=-=--=-=-=-=-=-
	// 게시판 총 글수 출력
	public int selectAdvertiseCntAll();

	public ProfilePic selectProfilePic(int profileNo);

	public List getBand();

	public ProfilePic getProfile();

	
	
	/*public List getList(FindMember findMember);*/
	
	
	
}
