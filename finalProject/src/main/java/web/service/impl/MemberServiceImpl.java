package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MemberDao;
import web.dto.Band;
import web.dto.BandGenre;
import web.dto.Bar;
import web.dto.Member;
import web.dto.ProfilePic;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDao memberDao;

	private boolean lowerCheck;
	private int size;
	
	@Override
	public String getKey(int size, boolean lowerCheck) {
		this.size = size;
		this.lowerCheck = lowerCheck;
		
		return joinKey();
	}
	
	private String joinKey() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		
		int num = 0;
		
		do {
			num = ran.nextInt(75)+48;
			
			if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
				sb.append((char)num);
				
			} else {
				continue;
			}
			
		} while(sb.length() < size);
		
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		
		return sb.toString();
	}
	

	@Override
	public void join(Member member) {
		memberDao.insertUser(member);
	}
	
	@Override
	public void barJoin(Bar bar) {
		memberDao.insertBar(bar);
	}
	
	@Override
	public void bandJoin(Band band) {
		memberDao.insertBand(band);
	}
	
	@Override
	public void bandGenreInsert(BandGenre bandGenre) {
		memberDao.insertBandGenre(bandGenre);
	}
	
	@Override
	public boolean checkId(Member member) {
		// 아이디 중복 확인 (중복, 가입 안 됨)
		if(memberDao.checkJoinId(member)==1) {
			return false;
		
		// 공백일 때
		} else if(member.getUserId()==null || member.getUserId().equals(null) ||
					member.getUserId().equals("") || member.getUserId()=="") {
			return false;
		
		// 아이디 중복 아님 (가입 O)
		} else {
			return true;			
		}
		
	}	
	
	@Override
	public boolean checkUserName(Member member) {
		// 닉네임 중복 확인 (중복, 가입 안 됨)
		if(memberDao.checkJoinUserName(member)==1) {
			return false;
		
		// 공백일 때
		} else if(member.getUserName()==null || member.getUserName().equals(null) ||
					member.getUserName().equals("") || member.getUserName()=="") {
			return false;
		
		// 닉네임 중복 아님 (가입 O)
		} else {
			return true;			
		}
		
	}
	
	@Override
	public boolean checkContact(Member member) {
		// 전화번호 중복 확인 (중복, 가입 안 됨)
		if(memberDao.checkJoinContact(member)==1) {
			return false;
		
		// 공백일 때
		} else if(member.getContact()==null || member.getContact().equals(null) ||
					member.getContact().equals("") || member.getContact()=="") {
			return false;
		
		// 닉네임 중복 아님 (가입 O)
		} else {
			return true;			
		}
		
	}

	@Override
	public boolean login(Member member) {
		// 로그인 성공 (id와 pw이 일치하는 행 존재)
		if(memberDao.selectCntLogin(member)==1) {
			return true;
		}
		
		// 로그인 실패할 경우
		return false;
	}

	@Override
	public Member loginInfo(Member member) {
		return memberDao.checkLoginInfo(member);
	}

	@Override
	public boolean checkUserId(Member member) {
		// 이메일과 통신사, 전화번호가 일치하는 아이디가 있을 경우 
		if(memberDao.selectUserId(member)==1) {
			return true;
		}
		
		// 없을 경우
		return false;
	}
	
	@Override
	public Member getUserId(Member member) {
		// 아이디 찾기 때 아이디 반환
		return memberDao.getUserId(member);
	}

	@Override
	public boolean checkPassword(Member member) {
		// 이메일과 아이디가 일치하는 아이디가 있을 경우 
		if(memberDao.selectUserPw(member)==1) {
			return true;
		}
		
		// 없을 경우
		return false;
	}
	
	@Override
	public Member getPassword(Member member) {
		return memberDao.getPassword(member);
	}
	
	@Override
	public int checkRoleId(Member member) {
		// roleId 체크
		int roleId = memberDao.selectRoleId(member);
		
		return roleId;
	}

	@Override
	public String profilePicSave(ServletContext context, MultipartFile file, ProfilePic profilePic) {

			// UUID 고유 식별자
			String uid = UUID.randomUUID().toString().split("-")[0];
			
			// 파일이 저장될 경로
			String stored = context.getRealPath("resources");
			
			System.out.println("저장 경로: "+stored);
			
			// 저장될 파일의 이름
			String name = uid+"_"+file.getOriginalFilename();
			
			// 파일 객체
			File dest = new File(stored, name);
			
			profilePic.setOriginName(name);
			profilePic.setStoredName(name);
			profilePic.setPath(stored);
			
			memberDao.insertProfilePic(profilePic);
			
			// 파일 저장 (업로드)
			try {
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return name;
		
		
	}

	@Override
	public int checkProfileNo(String profileName) {
		// 프로필 사진 번호 찾아오기
		int num = memberDao.selectProfileNo(profileName);
		
		return num;
	}
	
	@Override
	public void deleteMember(Member member) {		
		// member 삭제
		memberDao.deleteMember(member);
	}
	
	@Override
	public void deleteBar(Member member, Bar bar) {
		// bar와 관련된 테이블 삭제 (deleteBarApp은 barName 기준)
		memberDao.deleteBarApp(bar);
		memberDao.deleteBarCal(bar);
		
		// bar 삭제
		memberDao.deleteBar(member);
	}
	
	@Override
	public void deleteBand(Member member, Band band) {
		// band와 관련된 테이블 삭제 (bandNo 기준)
		memberDao.deleteBandMember(band);
		memberDao.deleteCollab(band);
		memberDao.deleteAdvertise(band);
		memberDao.deleteFindMember(band);
		memberDao.deleteMusic(band);
		memberDao.deleteResume(band);
		memberDao.deleteBandCal(band);
		
		// band 삭제
		memberDao.deleteBand(member);
	}

	@Override
	public Bar checkBarInfo(Member member) {
		return memberDao.checkBarInformation(member);
	}
	
	@Override
	public Band checkBandInfo(Member member) {
		return memberDao.checkBandInformation(member);
	}
	
	@Override
	public void deleteBarProfile(int barPicNo) {
		memberDao.deleteBarPic(barPicNo);
	}
	
	@Override
	public void deleteBandProfile(int bandPicNo) {
		memberDao.deleteBandPic(bandPicNo);
	}
	
}
