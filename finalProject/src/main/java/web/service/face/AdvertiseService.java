package web.service.face;

import java.util.List;

import web.dto.Advertise;

public interface AdvertiseService {
	
	// 구인구직 전체 조회
	public List getList();

	// 구인구직 상세 보기
	public Advertise view(Advertise advertiseView);
	
	//구인구직 쓰기
	public void write();
	
	// 파일 샘플 얻기
	public Advertise viewMusic(Advertise advertise);
	
	// 구인 구직 수정
	public void modify();
	public int updateMusic();
	
	
	// 구인 구직 삭제
	public void delete(Advertise advertise);
	
	
	
}
