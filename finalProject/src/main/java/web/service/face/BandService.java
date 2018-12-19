package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Band;

public interface BandService {

	// 전체 리스트
	public List bandList();
	
	// 장르 리스트
	public List genreList();
	
	// 프로파일 사진
	public List getProPic();
	
	// 카테고리로 조회
	public List bandCate(String cate);
	
	// 밴드 소개 보기
	public Map bandView(int bandNo);
	
	// 밴드 소개 수정
	public void bandEdit(Band band);
	
	// 밴드 일정표
	public List bandSchedule(String bandName);
}
