package com.memberLogin.model;

public class MemberLoginService {

	private MemberLoginDAO_interface dao;
	
	public MemberLoginService() {
		dao = new MemberLoginJDBCDAO();
	};
	
	public MemberLoginVO findByAcAndPwd(String member_ac, String member_pw) {
	return dao.findByAcAndPwd(member_ac, member_pw);
	};
}


