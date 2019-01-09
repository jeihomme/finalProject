package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Advertise;
import web.dto.ProfilePic;
import web.utils.Paging;

public interface AdvertiseService {
	
	// 구인구직 전체 조회
	public List getList(Paging paigng);

	// 구인구직 상세 보기
	public Map view(int findNo );
	
	//구인구직 쓰기
	public void write();
	
	// 파일 샘플 얻기
	public Advertise viewMusic(Advertise advertise);
	
	// 구인 구직 수정
	public void modify();
	public int updateMusic();
	
	//이미지 가져오기
	public ProfilePic viewProfile(int profileNo);
	
	// 구인 구직 삭제
	public void delete(Advertise advertise);
	
	// 페이지 정보 만들기
	public Paging getPaging(int curPage, int listCount, int pageCount);

	public int selectAdvertiseCntAll();
	
}
