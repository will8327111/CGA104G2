package com.memberbill.model;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpSession;

import com.billgroup.model.BillGroupVO;
import com.card.model.CardVO;
import com.google.protobuf.Service;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	public void updatePay(String memberPay) {
		dao.updatePay(memberPay);

	}

	public  List<MemberBillVO> getBillDate(Integer memberId) {//11.23
		return dao.getBillDate(memberId);
	}
	
	
	public MemberBillVO updateMemberPay(Integer memberBillId) {//11.14
		return dao.updateMemberPay(memberBillId);
	
	}
	
	public List<MemberBillVO> getAllCost(Integer memberId){//11.16
		return dao.getAllCost(memberId);
		
	}

	public String buyToken(Integer sum, String url, Integer memId,Integer memberBillId) {
	 	MemberBillService memSvc = new MemberBillService();
	 	BillGroupVO billGroupVO =new BillGroupVO();
    	List<MemberBillVO> memberBillVO = memSvc.getAllCost(memId);
    	String itemName = String.valueOf("本期繳費總金額:");

    	String merchantTradeNo=String.valueOf(memId);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String payDate = sdf.format(new Date(System.currentTimeMillis()));
        String indexUrl=url+"/front-end/memberbill/card.jsp";
        String getDataUrl=url+"/member/pay";
        String getDataUrl1=url+"/front-end/memberbill/card.jsp";
        String customField1=(""+memId+","+sum+","+memberBillId);
        
//        int r = 0;
//        r= (int)(Math.random()*10);
        AllInOne allInOne = new AllInOne("");
        AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();
        aioCheckOutALL.setMerchantTradeNo(memId+"elife"+"neddxartrr");
        aioCheckOutALL.setMerchantTradeDate(payDate);
        aioCheckOutALL.setTotalAmount(sum.toString());
        aioCheckOutALL.setTradeDesc("test");
        aioCheckOutALL.setReturnURL(indexUrl);
        aioCheckOutALL.setOrderResultURL(getDataUrl);
        aioCheckOutALL.setClientBackURL(getDataUrl);
        aioCheckOutALL.setNeedExtraPaidInfo("N");
        aioCheckOutALL.setItemName(itemName);      
        aioCheckOutALL.setCustomField1(customField1);
       
             
        return allInOne.aioCheckOut(aioCheckOutALL,null);
	}

	public void insert(Integer memId, Integer sum) {
	
		
	}
	public List<MemberBillVO> getAllMemberGroupData(){
		return dao.getAllMemberGroupData();
		
	}
	public void insertMemberBill(MemberBillVO memberBillVO){
		dao.insertMemberBill(memberBillVO);
		
	}

	public void sendMail(String to, String subject, String messageText) {
		dao.sendMail(to,subject,messageText);
		
	}
	
	public MemberBillVO getOneCost(Integer memberId){//11.16
		return dao.getAllCost(memberId).get(0);
		
	}
	
}
