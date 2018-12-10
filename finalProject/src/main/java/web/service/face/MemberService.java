package web.service;

import web.dto.Member;

public interface MemberService {
	public Member getUserinfo(Member inputMemberInfo);
	public void setUserinfo(Member inputMemberInfo);
}
