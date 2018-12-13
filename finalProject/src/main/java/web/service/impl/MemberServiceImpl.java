package web.service.impl;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Band;
import web.dto.Bar;
import web.dto.Member;
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
	public boolean checkId(Member member) {
		// 아이디 중복 확인 (중복 안 함, 가입 가능)
		if(memberDao.checkJoinId(member)==1) {
			return true;
		}
		
		// 아이디 중복 (가입 X)
		return false;
		
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
		// 이메일이 일치하는 아이디가 있을 경우 
		if(memberDao.selectUserId(member)==1) {
			return true;
		}
		
		// 없을 경우
		return false;
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
	public int checkRoleId(Member member) {
		// roleId 체크
		int roleId = memberDao.selectRoleId(member);
		
		return roleId;
	}



}
