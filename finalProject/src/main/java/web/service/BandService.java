package web.service;

import java.util.List;

import web.dto.Band;

public interface BandService {

	// 전체 리스트
	public List bandList();
	
	// 카테고리로 조회
	public List bandCate(String cate);
	
	// 밴드 소개 보기
	public Band bandView(String bandName);
	
	// 밴드 소개 수정
	public void bandEdit(Band band);
	
	// 밴드 일정표
	public List bandSchedule(String bandName);
}
