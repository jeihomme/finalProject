package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Advertise;
import web.dto.FindMember;
import web.dto.Part;
import web.dto.ProfilePic;
import web.utils.Paging;

public interface AdvertiseService {
	
	// 구인구직 전체 조회
	public List getList(Paging paging);

	// 구인구직 상세 보기
	public Map view(String findNo );
	
	//구인구직 쓰기
	public Map write(Advertise advertise);
	
	// 파일 샘플 얻기
	public Advertise viewMusic(Advertise advertise);
	
	// 구인 구직 수정
	public void modify(Advertise advertise);
	public int updateMusic();
	
	//이미지 가져오기
	public ProfilePic viewProfile(int profileNo);
	
	// 구인 구직 삭제
	public void delete(String findNo);
	
	// 페이지 정보 만들기
	public Paging getPaging(int curPage, int listCount, int pageCount);

	public int selectAdvertiseCntAll();

	public List bandList();

	public ProfilePic getPropic();

	public FindMember viewAds(String findNo);

	public Part getPart(String positionNo);
	

}
