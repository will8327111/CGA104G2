package com.memberbill.model;

import java.util.List;

//實做類別
public class MemberBillService {

	private MemberBillDAO_interface dao;

	public MemberBillService() {
		dao = new MemberBillJDBCDAO();
	}

	public List<MemberBillVO> getAll() {
		return dao.getAll();
	}

	public void update(Integer memberBillId, String memberPay) {
		MemberBillVO memberBillVO = new MemberBillVO();// 裝
		memberBillVO.setMemberBillId(memberBillId);
		memberBillVO.setMemberPay(memberPay);
		dao.update(memberBillVO);// 修改
	}

	public byte[] getOnePhoto(Integer memberBillId) {
		return dao.getPhoto(memberBillId);
	}

	public void uploadPhoto(MemberBillVO vo) {
		dao.updatePhoto(vo);
	}

	public List<MemberBillVO> getUnpaid(Integer memberId) {
		return dao.getUnpaid(memberId);
	}

	public void updatePay(Integer memberPay) {
		dao.updatePay(memberPay);

	}

	public List<MemberBillVO> getBillDate(Integer memberId) {
		return dao.getBillDate(memberId);
	}
	
//	public MemberBillVO getMemberBill(String billDate,String memberPay,byte[] memberPhoto) {
//		return dao.getMemberBill(billDate,memberPay,memberPhoto);
//		
//	}
	
	public MemberBillVO updateMemberPay(Integer memberBillId) {
		return dao.updateMemberPay(memberBillId);
	
	}
	
}
