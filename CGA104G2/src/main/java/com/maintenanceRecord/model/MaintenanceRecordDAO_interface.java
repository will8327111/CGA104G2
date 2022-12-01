package com.maintenanceRecord.model;

import java.util.List;

import com.privateReport1.model.PrivateReportVO1;

public interface MaintenanceRecordDAO_interface {

	public void frontEndInsert(MaintenanceRecordVO maintenanceRecordVO);

	public void update(MaintenanceRecordVO maintenanceRecordVO);

	public void delete(Integer maintenanceId);

	public MaintenanceRecordVO findByMtIdAndAc(Integer maintenanceId, String memberAc);

	public MaintenanceRecordVO findByMtId(Integer maintenanceId);

	public MaintenanceRecordVO findMemberName(String memberName);

	public MaintenanceRecordVO findByMtStatus(Integer maintenanceStatus);

	public MaintenanceRecordVO findInfoByAc(String memberAc);

	public List<MaintenanceRecordVO> findByMemberName(String memberName);

	public List<MaintenanceRecordVO> findByMemberAc(String memberAc);

	public List<MaintenanceRecordVO> getAllMt();

	public List<MaintenanceRecordVO> getAllSelected(Integer maintenanceStatus);

	public List<MaintenanceRecordVO> memberGetAllSelected(Integer maintenanceStatus, String memberAc);
}
