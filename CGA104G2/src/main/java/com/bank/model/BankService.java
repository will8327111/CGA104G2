package com.bank.model;

import java.util.List;

public class BankService {

	private BankDAO_interface dao;
	
	public BankService() {
		dao=new BankJNDIDAO();
	}
	public List<BankVO> getAll(){
		return dao.getAll();
	}
}
