//package com.privateReport.model;
//
//import java.io.Serializable;
//import java.sql.Date;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//@Setter
//@Getter
//@NoArgsConstructor
//@AllArgsConstructor
//@Entity
//@Table(name = "PRIVATE_REPORT",catalog = "Community_Management")
//public class PrivateReportVO implements Serializable{
//	private static final long serialVersionUID = 1L;
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "PRIVATE_REPORT_ID",insertable = false)
//	private Integer privateReportId;
//	@Column(name = "MEMBER_ID")
//	private Integer memberId;
//	@Column(name = "PRIVATE_REPORT_TIME")
//	private Date privateReportTime;
//	@Column(name = "PRIVATE_REPORT_CONTENT")
//	private String privateReportContent;
//	@Column(name = "PRIVATE_REPORT_PIC")
//	private byte[] privateReportPic;  
//	@Column(name = "PRIVATE_REPORT_STATUS")
//	private Integer privateReportStatus;
//	@Column(name = "REPLY_OF_REPORT")
//	private String ReplyOfReport;
//	@Column(name = "REPLY_PIC")
//	private byte[] ReplyPic; 
//	@Column(name = "REPLY_OF_REPORT_TIME",insertable = false)
//	private Date ReplyOfReportTime;
//	
//	
//}
