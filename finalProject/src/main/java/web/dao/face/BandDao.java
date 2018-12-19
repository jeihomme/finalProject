package web.dao.face;

import java.util.List;

import web.dto.Resumes;

public interface BandDao {

	// 전체 리스트
	public List getList();
	
	// 프로파일 사진
	public List getProPic();
	
	// 카테고리로 조회
	public List getByCate(String cate);
	
	// 밴드 소개
	public Resumes getInfo(int bandNo);
	public List getMember(int bandNo);
//	public 프로필사진 get프로필(int bandNo);
//	public Music getMusic(String bandName);
	
	// 밴드 일정표
	public List getSchedule(String bandName);
	
	
	
}
