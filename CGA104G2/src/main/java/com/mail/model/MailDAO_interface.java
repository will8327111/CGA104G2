package com.mail.model;

import java.util.List;

import com.mail.common.MailCommon;

public interface MailDAO_interface extends MailCommon {
	 public void insert(MailVO mailVO);
     public void update(MailVO mailVO);
     public void delete(Integer mailVO);
     public List<MailVO> findByPrimaryKey(Integer mailVO);
     public List<MailVO> getAll();
//     public byte[] getPhoto(Integer member_Id);
     public MailVO findByMemberName(String memberName);
}
