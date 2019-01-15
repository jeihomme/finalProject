package web.service.face;

import java.util.List;

import web.dto.Band;
import web.dto.BandMember;
import web.dto.Bar;
import web.dto.Notice;
import web.dto.ProfilePic;

public interface MainService {

	// 공지사항  list 조회
	public List<Notice> getNoticeList();
	
	// bar list 조회
	public List<Bar> getBarList();
	
	// bar 프로필 사진 정보 조회
	public ProfilePic getBarPicInfo(int profileNo);
	
	// band list 조회
	public List<Band> getBandList();
	
	// band Member 조회
	public List<BandMember> getBandMemberInfo(int bandNo);
	
	// band 프로필 사진 정보 조회
	public ProfilePic getBandPicInfo(int profileNo);
			
}
