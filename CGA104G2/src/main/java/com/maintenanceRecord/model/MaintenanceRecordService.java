package com.maintenanceRecord.model;

import java.util.List;

public class MaintenanceRecordService {
	private MaintenanceRecordDAO_interface dao;

	public MaintenanceRecordService() {
		dao = new MaintenanceRecordJDBCDAO();
	}

	public MaintenanceRecordVO frontEndInsert(Integer memberId, String maintenanceContent, List<byte[]> maintenancePic,
			Integer maintenanceStatus) {

		MaintenanceRecordVO maintenanceRecordVO = new MaintenanceRecordVO();

		maintenanceRecordVO.setMemberId(memberId);
		maintenanceRecordVO.setMaintenanceContent(maintenanceContent);
		maintenanceRecordVO.setMaintenanceStatus(maintenanceStatus);

		if (!(maintenancePic.size() == 0)) {
			for (byte[] photo : maintenancePic) {
				maintenanceRecordVO.setMaintenancePic(photo);
				dao.frontEndInsert(maintenanceRecordVO);
			}
		} else {
			dao.frontEndInsert(maintenanceRecordVO);
		}
		;
		return maintenanceRecordVO;
	};

	public MaintenanceRecordVO update(String replyOfMaintenance, List<byte[]> replyPic, Integer maintenanceStatus,
			Integer maintenanceId) {
		MaintenanceRecordVO maintenanceRecordVO = new MaintenanceRecordVO();

		maintenanceRecordVO.setReplyOfMaintenance(replyOfMaintenance);
		maintenanceRecordVO.setMaintenanceStatus(maintenanceStatus);
		maintenanceRecordVO.setMaintenanceId(maintenanceId);

		if (!(replyPic.size() == 0)) {
			for (byte[] photo : replyPic) {
				maintenanceRecordVO.setReplyPic(photo);
				dao.update(maintenanceRecordVO);
			}
		} else {
			dao.update(maintenanceRecordVO);
		}
		;
		return maintenanceRecordVO;
	};

	public void delete(Integer maintenanceId) {
		dao.delete(maintenanceId);
	};

	public MaintenanceRecordVO findByMtIdAndAc(Integer maintenanceId, String memberAc) {
		return dao.findByMtIdAndAc(maintenanceId, memberAc);
	};

	public MaintenanceRecordVO findByMtId(Integer maintenanceId) {
		return dao.findByMtId(maintenanceId);
	};

	public MaintenanceRecordVO findMemberName(String memberName) {
		return dao.findMemberName(memberName);
	};

	public MaintenanceRecordVO findByMtStatus(Integer maintenanceStatus) {
		return dao.findByMtStatus(maintenanceStatus);
	};

	public MaintenanceRecordVO findInfoByAc(String memberAc) {
		return dao.findInfoByAc(memberAc);
	};

	public List<MaintenanceRecordVO> findByMemberName(String memberName) {
		return dao.findByMemberName(memberName);
	};

	public List<MaintenanceRecordVO> findByMemberAc(String memberAc) {
		return dao.findByMemberAc(memberAc);
	};

	public List<MaintenanceRecordVO> getAllMt() {
		return dao.getAllMt();
	};

	public List<MaintenanceRecordVO> getAllSelected(Integer maintenanceStatus) {
		return dao.getAllSelected(maintenanceStatus);
	};

	public List<MaintenanceRecordVO> memberGetAllSelected(Integer maintenanceStatus, String memberAc) {
		return dao.memberGetAllSelected(maintenanceStatus, memberAc);
	};
}
