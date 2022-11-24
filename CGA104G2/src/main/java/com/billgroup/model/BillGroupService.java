package com.billgroup.model;

import com.card.model.CardDAO_interface;
import com.card.model.CardJNDIDAO;
import com.card.model.CardVO;

public class BillGroupService {
private BillGroupDAO_interface dao;
	
	public BillGroupService() {
		dao = new BillGroupJNDIDAO();
	}
	
	public String getBillGroup(Integer memberId) {
		return dao.getBillGroup(memberId);
	}
}
