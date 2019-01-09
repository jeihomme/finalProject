package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Band;
import web.dto.ProfilePic;
import web.utils.AddItems;

public interface BandService {

	// 전체 리스트
	public List bandList(AddItems addItems, String genre);
	
	// 장르 리스트
	public List genreList();
	
	// 프로파일 사진
	public List getProPic(AddItems addItems, String genre);
	
	// 카테고리로 조회
	public List bandCate(AddItems addItems, String genre);
	public List ProPicByCate(AddItems addItems, String genre);
	
	// 페이징 처리
	public Map getPrep(String curPage);
	
	// 밴드 소개 보기
	public Map bandView(int bandNo);
	
	// history 삭제
	public void delHistory(String codes);
	
	// 밴드 멤버 삭제
	public void delBMember(String codes);
	
	// 밴드 소개 수정
	public void bandEdit(Band band);
	
	// 밴드 일정표
	public List bandSchedule(String bandName);
}
