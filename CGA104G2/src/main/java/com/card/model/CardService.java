package com.card.model;

import java.util.List;

import com.card.model.CardVO;
import com.memberbill.model.MemberBillJDBCDAO;

public class CardService {
	private CardDAO_interface dao;
	
	public CardService() {
		dao = new CardJNDIDAO();
	}
	
	public List<CardVO> getAllCard(String billDate) {
		return dao.getAllCard(billDate);
	}
	
	public void insert(CardVO cardVO) {
		dao.insert(cardVO);
	}
}
