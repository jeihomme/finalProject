package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.BandMember;
import web.dto.History;
import web.dto.Resumes;
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
	
	// 밴드 멤버 추가
	public BandMember addBMember(BandMember bMem);
	
	// 밴드 history 추가
	public List addHistory(History history);
	
	// 밴드 소개 수정
	public String bandEdit(String bandNo, String historyNo, String year,
			String historyInfo, String bandMemberNo, String bandMemName, String mPosition, Resumes resumes);
	
}
