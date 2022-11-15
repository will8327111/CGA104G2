package com.transfer.model;

import java.sql.Timestamp;
import java.util.List;

import com.memberbill.model.MemberBillVO;

public class TransferService {
	private TransferDAO_interface dao;

	public TransferService() {
		dao = new TransferJNDIDAO();
	}

	public TransferVO insert(String billGroup, String bankId, Integer bankNumber, Integer memberId) {

		TransferVO transferVO = new TransferVO();
		transferVO.setBillGroup(billGroup);
		transferVO.setBankId(bankId);
		transferVO.setBankNumber(bankNumber);
		transferVO.setMemberId(memberId);
		dao.insert(transferVO);

		return transferVO;

	}

	public List<TransferVO> getAll(String billDate) {// 定義方法
		return dao.getAll(billDate);

	}

	public List<String> getOneBillDate() {// 定義方法
		return dao.getOneBillDate();
	}
}
