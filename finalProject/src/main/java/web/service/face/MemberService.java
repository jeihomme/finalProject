package web.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Band;
import web.dto.BandGenre;
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
	
	// band 가입 - Genre 테이블 insert
	public void bandGenreInsert(BandGenre bandGenre);
	
	// band 가입 - band Member 테이블 insert
	public void insertBandMember(List<String> bandMembers, List<String> bandPositions, int bandNo);
	
	// 아이디 중복 확인
	public boolean checkId(Member member);
	
	// 닉네임 중복 확인
	public boolean checkUserName(Member member);
	
	// 전화번호 중복 확인
	public boolean checkContact(Member member);
	
	// Bar Name 중복 확인
	public boolean checkBarName(Bar bar);
	
	// Bar Manager 중복 확인
	public boolean checkBarManager(Bar bar);
	
	// Bar Address 중복 확인
	public boolean checkBarAddress(Bar bar);
	
	// Band Name 중복 확인
	public boolean checkBandName(Band band);
	
	// 로그인 성공 확인
	public boolean login(Member member);
	
	// 로그인 정보 확인 (member 정보 확인)
	public Member loginInfo(Member member);
	
	// 이메일, 통신사, 전화번호 일치 확인 (아이디 찾기)
	public boolean checkUserId(Member member);
	
	// 아이디 찾기 때 아이디 반환하기
	public Member getUserId(Member member);
	
	// 이메일, 아이디 일치 확인 (비밀번호 찾기)
	public boolean checkPassword(Member member);
	
	// 비밀번호 찾기 때 비밀번호 반환하기
	public Member getPassword(Member member);
	
	// 회원 분류 번호(roleId)가 몇 번인지 확인 (bar / band 구분)
	public int checkRoleId(Member member);
	
	// 프로필 사진 저장
	public String profilePicSave(ServletContext context, MultipartFile file, ProfilePic profilePic);
	
	// 프로필 사진 번호 찾기
	public int checkProfileNo(String profileName);
	
	// 일반 회원 탈퇴
	public void deleteMember(Member member);
	
	// bar 탈퇴
	public void deleteBar(Member member, Bar bar);
	
	// band 탈퇴
	public void deleteBand(Member member, Band band);
	
	// bar 정보 확인
	public Bar checkBarInfo(Member member);
	
	// band 정보 확인
	public Band checkBandInfo(Member member);
	
	// bar 프로필 사진 삭제
	public void deleteBarProfile(int barPicNo);
	
	// band 프로필 사진 삭제
	public void deleteBandProfile(int bandPicNo);

}

