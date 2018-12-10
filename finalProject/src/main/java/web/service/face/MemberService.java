package web.service.face;

import web.dto.Member;

public interface MemberService {
	public Member getUserinfo(Member inputMemberInfo);
	public void setUserinfo(Member inputMemberInfo);
}
