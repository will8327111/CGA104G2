package com.privateReport1.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

import com.backstageAccount.model.BackstageAccountVO;

public class PrivateReportService1 {
	private PrivateReportDAO1_interface dao;

	public PrivateReportService1() {
		dao = new PrivateReportJDBCDAO1();
	}

	public PrivateReportVO1 frontEndInsert(Integer memberId, String privateReportContent, 
			byte[] privateReportPic, Integer privateReportStatus) {

		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();

		privateReportVO1.setMemberId(memberId);
		privateReportVO1.setPrivateReportContent(privateReportContent);
		privateReportVO1.setPrivateReportPic(privateReportPic);
		privateReportVO1.setPrivateReportStatus(privateReportStatus);
		dao.frontEndInsert(privateReportVO1);

		return privateReportVO1;
	};

//	public PrivateReportVO1 backEndReply(String replyOfReport, byte[] replyPic) {
//
//		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();
//
//		privateReportVO1.setReplyOfReport(replyOfReport);
//		privateReportVO1.setReplyPic(replyPic);
//		dao.backEndReply(privateReportVO1);
//
//		return privateReportVO1;
//	};
	
	public PrivateReportVO1 update(String replyOfReport, byte[] replyPic, Integer privateReportStatus) {
		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();
		
		privateReportVO1.setPrivateReportStatus(privateReportStatus);
		privateReportVO1.setReplyOfReport(replyOfReport);
		privateReportVO1.setReplyPic(replyPic);
		dao.update(privateReportVO1);
		
		return privateReportVO1;
	};

	public void delete(Integer privateReportId) {
		dao.delete(privateReportId);
	};
	
	public PrivateReportVO1 findByReportId(Integer privateReportId){
		return dao.findByReportId(privateReportId);
	};

	public List<PrivateReportVO1> findByMemberId(Integer memberId) {
		return dao.findByMemberId(memberId);
	};

	public List<PrivateReportVO1> getAllReport() {
		return dao.getAllReport();
	};

}
