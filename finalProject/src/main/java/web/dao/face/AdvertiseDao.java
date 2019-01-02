package web.dao.face;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import web.dto.FindMember;
import web.utils.Paging;;

public interface AdvertiseDao {

	// 전체 조회
	public List selectPagingList(Paging paging);
	
	// 구인구직 글쓰기
	public void insertAdvertise();
	
	// 구인구직 수정 
	public void updateAdvertise();
	
	// 구인구직 삭제
	public void deleteAdvertise();
	
	// 구인구직 상세보기
	public FindMember selectAdvertise(int findNo);
	
	// 게시판 총 글수 출력
	public int selectAdvertiseCntAll();

	public List getList(FindMember findMember);
	
	
	
}
