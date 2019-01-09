package web.dao.face;

import java.util.List;

import web.dto.FindMember;
import web.dto.ProfilePic;
import web.utils.Paging;;

public interface AdvertiseDao {

	// 전체 조회
	public List selectPagingList(Paging paigng);
	
	// 구인구직 글쓰기
	public void insertAdvertise();
	
	// 구인구직 수정 
	public void updateAdvertise();
	
	// 구인구직 삭제
	public void deleteAdvertise();
	
	// 구인구직 상세보기
	// advertise 가져오기
	public FindMember selectAdvertise(int findNo);
	
	// profileNo 가져오기
	public int getPicNo(String bandNo);
	
	// profile 사진 가져오기
	public ProfilePic getProPic(int profileNo);
	
	// 밴드 멤버 가져오기
	public List getBMember(String bandNo);
	
	// 장르 가져오기
	public List getGenre(String bandNo);
	// 전체 장르 가져오기
	public List allGenre();
	
	//=-------=-=-=-=-=--=-=-=-=-=-
	// 게시판 총 글수 출력
	public int selectAdvertiseCntAll();

	public ProfilePic selectProfilePic(int profileNo);

	/*public List getList(FindMember findMember);*/
	
	
	
}
