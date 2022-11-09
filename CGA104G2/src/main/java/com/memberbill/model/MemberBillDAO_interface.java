package com.memberbill.model;

import java.util.*;
//介面
public interface MemberBillDAO_interface {
	public void insert(MemberBillVO MemberPhoto);

	public void update(MemberBillVO MemberBillVO);

	public List<MemberBillVO> getAll();
	
	public void updatePhoto(MemberBillVO vo);
	
	public byte[] getPhoto(Integer memberId);

	public List<MemberBillVO> getUnpaid(Integer memberId);

	public void updatePay(Integer memberPay);

	public List<MemberBillVO> getBillDate(Integer memberId);

	//public MemberBillVO getMemberBill(String billDate, String memberPay, byte[] memberPhoto);

	public MemberBillVO updateMemberPay(Integer memberbillid);


}
