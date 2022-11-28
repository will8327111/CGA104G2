package com.mail.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

public class MailService {
	private MailDAO_interface dao;
	
	public MailService() {
		dao = new MailDAO();
	}
	public MailVO addMail(MailVO mailVO) {
//		MailVO mailVO = dao.findByMemberName(memberName);

		dao.insert(mailVO);
		return mailVO;
	}
	public MailVO updateMail(MailVO mailVO) {
		dao.update(mailVO);
		return mailVO;
	}
	public void deleteMail(Integer mailId) {
		dao.delete(mailId);
	}

	public List<MailVO> getOneMail(Integer mailId) {
		return dao.findByPrimaryKey(mailId);
	}

	public JSONArray getAll() {
		return dao.getAll();
	}
	public JSONArray getFrontAll(Integer memberId) {
		return dao.getFrontAll(memberId);
	}
	public JSONArray findMailType() {
		return dao.findMailType();
	}
	public JSONArray search(String mailType, Integer mailId) {
		return dao.search(mailType, mailId);
	}
//	public JSONArray singleSearch(String mailType) {
//		return dao.singleSearch(mailType);
//	}
	public JSONArray frontSearch(String mailType, Integer mailId ,Integer memberId) {
		return dao.frontSearch(mailType, mailId,memberId);
	}
	
//	public byte[] getPhoto(Integer member_Id) {
//		return dao.getPhoto(member_Id);
//	}
//	public MailVO getOneId(String memberName) {
//		return dao.findByMemberName(memberName);
//	}

}
