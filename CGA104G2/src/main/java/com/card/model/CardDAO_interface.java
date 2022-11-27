package com.card.model;

import java.util.List;

public interface CardDAO_interface {

	public List<CardVO> getAllCard(String billDate);

	public void insert(CardVO cardVO);

	public CardVO updateCard(Integer memberBillId);

}
