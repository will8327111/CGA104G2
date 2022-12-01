package com.privateReport1.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

import com.activityphoto.model.ActivityPhotoVO;
import com.backstageAccount.model.BackstageAccountVO;

public class PrivateReportService1 {
	private PrivateReportDAO1_interface dao;

	public PrivateReportService1() {
		dao = new PrivateReportJDBCDAO1();
	}

	public PrivateReportVO1 frontEndInsert(Integer memberId, String privateReportContent, List<byte[]> privateReportPic,
			Integer privateReportStatus) {

		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();

		privateReportVO1.setMemberId(memberId);
		privateReportVO1.setPrivateReportContent(privateReportContent);
		privateReportVO1.setPrivateReportStatus(privateReportStatus);
		
		if (!(privateReportPic.size() == 0)) {
			for (byte[] photo : privateReportPic) {
				privateReportVO1.setPrivateReportPic(photo);
				dao.frontEndInsert(privateReportVO1);
			}
		} else {
			dao.frontEndInsert(privateReportVO1);
		}
		;
		return privateReportVO1;
	};


	public PrivateReportVO1 update(String replyOfReport, List<byte[]> replyPic, Integer privateReportStatus,
			Integer privateReportId) {
		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();

		privateReportVO1.setReplyOfReport(replyOfReport);
		privateReportVO1.setPrivateReportStatus(privateReportStatus);
		privateReportVO1.setPrivateReportId(privateReportId);

		if (!(replyPic.size() == 0)) {
			for (byte[] photo : replyPic) {
				privateReportVO1.setReplyPic(photo);
				dao.update(privateReportVO1);
			}
		} else {
			dao.update(privateReportVO1);
		}
		;
		return privateReportVO1;
	};

	public void delete(Integer privateReportId) {
		dao.delete(privateReportId);
	};

	public PrivateReportVO1 findByReportIdAndAc(Integer privateReportId, String memberAc) {
		return dao.findByReportIdAndAc(privateReportId, memberAc);
	};

	public PrivateReportVO1 findByReportId(Integer privateReportId) {
		return dao.findByReportId(privateReportId);
	};
	
	public PrivateReportVO1 findMemberName(String memberName) {
		return dao.findMemberName(memberName);
	};

	public PrivateReportVO1 findByReportStatus(Integer privateReportStatus) {
		return dao.findByReportStatus(privateReportStatus);
	};

	public PrivateReportVO1 findInfoByAc(String memberAc) {
		return dao.findInfoByAc(memberAc);
	};

	public List<PrivateReportVO1> findByMemberName(String memberName) {
		return dao.findByMemberName(memberName);
	};

	public List<PrivateReportVO1> findByMemberAc(String memberAc) {
		return dao.findByMemberAc(memberAc);
	};

	public List<PrivateReportVO1> getAllReport() {
		return dao.getAllReport();
	};

	public List<PrivateReportVO1> getAllSelected(Integer privateReportStatus) {
		return dao.getAllSelected(privateReportStatus);
	};

	public List<PrivateReportVO1> memberGetAllSelected(Integer privateReportStatus, String memberAc) {
		return dao.memberGetAllSelected(privateReportStatus, memberAc);
	};

}
