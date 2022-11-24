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

	public void updatePay(String memberPay);

	public  List<MemberBillVO> getBillDate(Integer memberId);//11.23

	//public MemberBillVO getMemberBill(String billDate, String memberPay, byte[] memberPhoto);

	public MemberBillVO updateMemberPay(Integer memberBillId);//11.14
	
	public List<MemberBillVO> getAllCost(Integer memberId);//11.16

	public String getbuyToken(Integer sum, String url, Integer memId);

	public List<MemberBillVO> getAllMemberGroupData();
	
	public void insertMemberBill(MemberBillVO memberBillVO);

	public void sendMail(String to, String subject, String messageText);
	
	public String selectBillDateByMemberBillId(Integer billId);
}
