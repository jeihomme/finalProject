package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.dto.Resumes;
import web.utils.AddItems;

public interface BandDao {

	// 전체 리스트
	public List getList(AddItems addItems);
	
	// 프로파일 사진
	public List getProPic(AddItems addItems);
	
	// 카테고리로 조회
	public List getByCate(@Param("addItems") AddItems addItems, @Param("genre") String genre);
	public List getProPicByCate(@Param("addItems") AddItems addItems, @Param("genre") String genre);
	
	// 더보기 버튼
	public int getCount();
	
	// 밴드 소개
	public Resumes getInfo(int bandNo);
	public List getMember(int bandNo);
//	public 프로필사진 get프로필(int bandNo);
//	public Music getMusic(String bandName);
	
	// 밴드 일정표
	public List getSchedule(String bandName);
	
	
	
}
