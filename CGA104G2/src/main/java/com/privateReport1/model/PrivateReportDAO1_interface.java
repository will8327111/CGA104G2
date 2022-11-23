package com.privateReport1.model;

import java.util.List;

public interface PrivateReportDAO1_interface{
	 
	 public void frontEndInsert(PrivateReportVO1 privateReportVO);
	 
//	 public void backEndReply(PrivateReportVO1 privateReportVO);
	
     public void update(PrivateReportVO1 privateReportVO);
     
     public void delete(Integer privateReportId);
     
     public PrivateReportVO1 findByReportId(Integer privateReportId);
     
     public List<PrivateReportVO1> findByMemberId(Integer memberId);
     
     public List<PrivateReportVO1> getAllReport();
     
     
}
