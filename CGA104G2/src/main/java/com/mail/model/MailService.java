package com.mail.model;

import java.sql.Date;
import java.util.List;
import com.mail.model.MailDAO_interface;

public class MailService {
	private MailDAO_interface dao;
	
	public MailService() {
		dao = new MailDAO();
	}
	public MailVO addMail(Integer memberId, String mailType, Date mailDelTime) {

		MailVO mailVO = new MailVO();

		mailVO.setMemberId(memberId);
		mailVO.setMailType(mailType);
		mailVO.setMailDelTime(mailDelTime);
		dao.insert(mailVO);

		return mailVO;
	}
	public MailVO updateEmp(Integer mailId,Integer memberId, String mailType ,Date mailDelTime, Date mailPickupTime , Integer mailState) {

		MailVO mailVO = new MailVO();

		mailVO.setMailId(mailId);
		mailVO.setMemberId(memberId);
		mailVO.setMailType(mailType);
		mailVO.setMailDelTime(mailDelTime);
		mailVO.setMailPickupTime(mailPickupTime);
		mailVO.setMailState(mailState);
		
		dao.update(mailVO);

		return mailVO;
	}
	public void deleteMail(Integer mailId) {
		dao.delete(mailId);
	}

	public List<MailVO> getOneMail(Integer mailId) {
		return dao.findByPrimaryKey(mailId);
	}

	public List<MailVO> getAll() {
		return dao.getAll();
	}
	
//	public byte[] getPhoto(Integer member_Id) {
//		return dao.getPhoto(member_Id);
//	}
	public MailVO getOneId(String memberName) {
		return dao.findByMemberName(memberName);
	}

}
