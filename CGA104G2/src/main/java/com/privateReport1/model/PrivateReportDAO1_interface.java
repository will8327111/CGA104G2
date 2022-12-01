package com.privateReport1.model;

import java.util.List;

public interface PrivateReportDAO1_interface{
	 
	 public void frontEndInsert(PrivateReportVO1 privateReportVO);
	 
     public void update(PrivateReportVO1 privateReportVO);
     
     public void delete(Integer privateReportId);

     public PrivateReportVO1 findByReportIdAndAc(Integer privateReportId, String memberAc);
     
     public PrivateReportVO1 findByReportId(Integer privateReportId);
     
     public PrivateReportVO1 findMemberName(String memberName);
     
     public PrivateReportVO1 findByReportStatus(Integer privateReportStatus);
     
     public PrivateReportVO1 findInfoByAc(String memberAc);
     
     public List<PrivateReportVO1> findByMemberName(String memberName);
     
     public List<PrivateReportVO1> findByMemberAc(String memberAc);
     
     public List<PrivateReportVO1> getAllReport();
     
     public List<PrivateReportVO1> getAllSelected(Integer privateReportStatus);
     
     public List<PrivateReportVO1> memberGetAllSelected(Integer privateReportStatus, String memberAc);

     
}
