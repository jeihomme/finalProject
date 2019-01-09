package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.dto.Band;
import web.dto.Music;
import web.dto.ProfilePic;
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
	
	////////////
	// 밴드 소개 //
	////////////
	
	// 기본 정보
	public Band getBand(int bandNo);
	// 프로필 사진
	public ProfilePic getPic(int proNo);
	
	public Resumes getInfo(int bandNo);
	
	public List getHistory(int resumesNo);
	public List getMember(int bandNo);
	
	public Music getMusic(int musicNo);
	
	// 밴드 소개 수정
	// history 삭제
	public void delHistory(String codes);
	
	// 멤버 삭제
	public void delBMember(String codes);
	
	
	// 밴드 일정표
	public List getSchedule(String bandName);
	
}
