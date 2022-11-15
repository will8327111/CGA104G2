package com.memberbill.model;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpSession;

import com.card.model.CardVO;
import com.google.protobuf.Service;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

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

	public MemberBillVO getBillDate(String billGroup) {//11.14
		return dao.getBillDate(billGroup);
	}
	
	
	public MemberBillVO updateMemberPay(String billGroup) {//11.14
		return dao.updateMemberPay(billGroup);
	
	}
	
	public List<MemberBillVO> getAllCost(String billGroup){
		return dao.getAllCost(billGroup);
		
	}
	
	
//	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		HttpSession session = req.getSession();
//		MemberBillVO memberBillVO = (MemberBillVO) session.getAttribute("memberBillVO");
//		String action = req.getParameter("action");
//		MemberBillService memSvc = new MemberBillService();
//		List<MemberBillVO> getAllCost=memSvc.getAllCost();
//	
//    if ("pay".equals(action)) {
//    	MemberBillService memberBillService = new MemberBillService();
//    	List<MemberBillVO> getAllCost = getAllCost
//    			.stream(){
//    		return costName+"#"+billAmount;
//    	});
//    	String itemName = String.ValurOf(getAllCost.get());
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//        String payDate = sdf.format(new Date(System.currentTimeMillis()));
//        AllInOne allInOne = new AllInOne("");
//        AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();
//        
//        int billGroup = (int) (Math.random() * 2999+ 1000);
//        String merchantTradeNo=String.valueOf(billGroup);
//        
//        aioCheckOutALL.setMerchantTradeNo(merchantTradeNo);
//        aioCheckOutALL.setMerchantTradeDate(payDate);
//        aioCheckOutALL.setTotalAmount(String.valueOf(memberBillVO.getBillAmount()));
//        aioCheckOutALL.setTradeDesc("付款測試");
//        aioCheckOutALL.setReturnURL(req.getRequestURL()+"/front-end/memberbill/card.jsp");
//        aioCheckOutALL.setClientBackURL(req.getRequestURL()+"/front-end/memberbill/card.jsp");
//        aioCheckOutALL.setNeedExtraPaidInfo("N");
//        aioCheckOutALL.setItemName(itemName);
//        aioCheckOutALL.CustomField1();
//        
//        allInOne.aioCheckOut(aioCheckOutALL,null);
//        req.setAttribute("checkoutPage",getAllCost);
//        RequestDispatcher goCheckout = req.getRequestDispatcher(req.getRequestURL()+"/front-end/memberbill/card.jsp");
//        goCheckout.forward(req, res);
//    }
//
//	public List<MemberBillVO> getSumCost(String billGroup, String memberPay) {
//		// TODO Auto-generated method stub
//		return null;
////	}
}
