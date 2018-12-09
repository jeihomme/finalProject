package web.dao.face;

import web.dto.Member;

public interface MemberDao {
	public Member selectById(Member inputMemberInfo);
	public void insertUserinfo(Member inputMemberInfo);
}
