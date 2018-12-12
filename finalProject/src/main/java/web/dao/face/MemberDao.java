package web.dao.face;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;

public interface MemberDao {
	
	// 회원가입
	public void insertUser(Member member);
	
	// bar 가입
	public void insertBar(Bar bar);
	
	// band 가입
	public void insertBand(Band band);
	
	// 가입 - 아이디 중복 확인
	public int checkJoinId(Member member);
	
	// 로그인 성공 유무 확인
	public int selectCntLogin(Member member);
	
	// 로그인한 멤버 정보 확인
	public Member checkLoginInfo(Member member);
	
	// 이메일이 일치하는 유저 아이디가 있을 경우 확인
	public int selectUserId(Member member);
	
	// 이메일과 아이디가 일치하는 유저 아이디가 있을 경우 확인
	public int selectUserPw(Member member);
	
	// 멤버 유형 확인
	public int selectRoleId(Member member);
}
