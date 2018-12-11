package web.dao.face;

import java.util.List;

import web.dto.Advertise;

public interface AdvertiseDao {

	// 전체 조회
	public List selectAll();
	
	// 구인구직 글쓰기
	public void insertAdvertise();
	
	// 구인구직 수정 
	public void updateAdvertise();
	
	// 구인구직 삭제
	public void deleteAdvertise();
	
	// 구인구직 상세보기
	public Advertise selectAdvertise(int answerNo);
	
	// 게시판 총 글수 출력
	public int selectAdvertiseCntAll();
	
}
