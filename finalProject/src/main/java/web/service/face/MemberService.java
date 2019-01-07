package web.service.face;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;
import web.dto.ProfilePic;

public interface MemberService {

	// 가입 확인 메일에 적용시킬 문자 출력
	public String getKey(int size, boolean lowerCheck);
	
	// 가입
	public void join(Member member);
	
	// bar 가입
	public void barJoin(Bar bar);
	
	// band 가입
	public void bandJoin(Band band);
	
	// 아이디 중복 확인
	public boolean checkId(Member member);
	
	// 닉네임 중복 확인
	public boolean checkUserName(Member member);
	
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
	
	// 프로필 사진 저장
	public void profilePicSave(ServletContext context, MultipartFile file, ProfilePic profilePic, String uploadPath);
}
