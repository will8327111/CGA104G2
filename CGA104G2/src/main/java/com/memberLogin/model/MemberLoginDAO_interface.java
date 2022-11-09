package com.memberLogin.model;

public interface MemberLoginDAO_interface {
	
	public MemberLoginVO findByAcAndPwd(String member_ac, String member_pw);
	
};
