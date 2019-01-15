package web.dao.face;

import java.util.List;

import web.dto.Band;
import web.dto.BandMember;
import web.dto.Bar;
import web.dto.Notice;
import web.dto.ProfilePic;

public interface MainDao {
	
	// Notice List 가져오기
	public List<Notice> selectNoticeList();
	
	// bar 추천 list 가져오기
	public List<Bar> selectBarList();
	
	// bar 프로필 사진 가져오기
	public ProfilePic selectBarPicInfo(int profileNo);
	
	// band 추천 list 가져오기
	public List<Band> selectBandList();
	
	// band Member 가져오기
	public List<BandMember> selectBandMember(int bandNo);

	// band 프로필 사진 가져오기
	public ProfilePic selectBandPicInfo(int profileNo);

}
