package web.dao.face;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;
import web.dto.ProfilePic;
import web.dto.Resumes;

public interface MemberDao {
	
	// 회원가입
	public void insertUser(Member member);
	
	// bar 가입
	public void insertBar(Bar bar);
	
	// band 가입
	public void insertBand(Band band);
	
	// 가입 - 아이디 중복 확인
	public int checkJoinId(Member member);
	
	// 가입 - 닉네임 중복 확인
	public int checkJoinUserName(Member member);
	
	// 로그인 성공 유무 확인
	public int selectCntLogin(Member member);
	
	// 로그인한 멤버 정보 확인
	public Member checkLoginInfo(Member member);
	
	// 이메일, 통신사, 전화번호가 일치하는 유저 아이디가 있을 경우 확인
	public int selectUserId(Member member);
	
	// 아이디 찾기 할 때 아이디 반환
	public Member getUserId(Member member);
	
	// 이메일과 아이디가 일치하는 유저 아이디가 있을 경우 확인
	public int selectUserPw(Member member);
	
	// 비밀번호 찾기 할 때 비밀번호 반환
	public Member getPassword(Member member);
	
	// 멤버 유형 확인
	public int selectRoleId(Member member);
	
	// 프로필 사진 업로드
	public void insertProfilePic(ProfilePic profilePic);
	
	// 프로필 사진 번호 가지고 오기
	public int selectProfileNo(String profileName);
	
	// 일반 회원 탈퇴
	public void deleteMember(Member member);
	
	// bar 탈퇴
	public void deleteBar(Member member);
	
	// band 탈퇴
	public void deleteBand(Member member);
	
	// bar 프로필 사진 정보 가져오기
	public Bar checkBarInformation(Member member);
	
	// band 프로필 사진 정보 가져오기
	public Band checkBandInformation(Member member);
	
	// bar 프로필 사진 삭제
	public void deleteBarPic(int barPicNo);
	
	// band 프로필 사진 삭제
	public void deleteBandPic(int bandPicNo);
	
	// bar application 삭제 (barName)
	public void deleteBarApp(Bar bar);
	
	// bar calendar 삭제 (barName)
	public void deleteBarCal(Bar bar);
	
	// band member 삭제
	public void deleteBandMember(Band band);
	
	// band collab 삭제
	public void deleteCollab(Band band);
	
	// band advertise 삭제
	public void deleteAdvertise(Band band);
	
	// find member 삭제
	public void deleteFindMember(Band band);
	
	// music 삭제
	public void deleteMusic(Band band);
	
	// band resume 삭제
	public void deleteResume(Band band);
	
	// band calendar 삭제
	public void deleteBandCal(Band band);

	
}
