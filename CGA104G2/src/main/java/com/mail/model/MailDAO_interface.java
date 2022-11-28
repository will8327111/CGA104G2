package com.mail.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

import com.mail.common.MailCommon;
import com.memberLogin.model.MemberLoginVO;

public interface MailDAO_interface extends MailCommon {
	 public void insert(MailVO mailVO);
     public void update(MailVO mailVO);
     public void delete(Integer mailVO);
     public List<MailVO> findByPrimaryKey(Integer mailVO);
     public JSONArray getAll();
     public MailVO findByMemberName(String memberName);
     public JSONArray findMailType();
     public JSONArray search(String mailType, Integer mailId);
//     public JSONArray singleSearch(String mailType);
	public JSONArray getFrontAll(Integer memberId);
	public JSONArray frontSearch(String mailType, Integer mailId, Integer memberId);
	
}

