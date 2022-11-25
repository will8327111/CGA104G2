package com.transfer.model;

import java.util.List;

import com.memberbill.model.MemberBillDAO_interface;
import com.memberbill.model.MemberBillJDBCDAO;

public class TransferService {
	private TransferDAO_interface transferDao;
	private MemberBillDAO_interface memberBillDao;

	public TransferService() {
		transferDao = new TransferJNDIDAO();
		memberBillDao = new MemberBillJDBCDAO();
	}

	public TransferVO insert(Integer memberBillId, String bankId, Integer bankNumber, Integer memberId,
			byte[] memberPhoto ,Integer memberPayMethod) {
		String billDate = memberBillDao.selectBillDateByMemberBillId(memberBillId);
		TransferVO transferVO = new TransferVO();
		transferVO.setMemberBillId(memberBillId);
		transferVO.setBillDate(billDate);
		transferVO.setBankId(bankId);
		transferVO.setBankNumber(bankNumber);
		transferVO.setMemberId(memberId);
		transferVO.setMemberPhoto(memberPhoto);
		transferVO.setMemberPayMethod(memberPayMethod);
		transferDao.insert(transferVO);
		return transferVO;
	}

	public List<TransferVO> getAll(String billDate) {// 定義方法
		return transferDao.getAll(billDate);

	}

	public List<String> getOneBillDate() {// 定義方法
		return transferDao.getOneBillDate();
	}
	
	public List<TransferVO> getMemberPay(String memberPay,String billDate){
		return transferDao.getMemberPay(memberPay,billDate);
	}
}
