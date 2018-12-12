package web.service.face;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;

public interface MemberService {

	// 가입
	public void join(Member member);
	
	// bar 가입
	public void barJoin(Bar bar);
	
	// band 가입
	public void bandJoin(Band band);
	
	// 아이디 중복 확인
	public boolean checkId(Member member);
	
	// 로그인 성공 확인
	public boolean login(Member member);
	
	// 로그인 정보 확인 (member 정보 확인)
	public Member loginInfo(Member member);
	
	// 이메일 일치 확인 (아이디 찾기)
	public boolean checkUserId(Member member);
	
	// 이메일, 아이디 일치 확인 (비밀번호 찾기)
	public boolean checkPassword(Member member);
	
	// 회원 분류 번호(roleId)가 몇 번인지 확인 (bar / band 구분)
	public int checkRoleId(Member member);
}
