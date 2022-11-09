package com.transfer.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public interface TransferDAO_interface {
	
	public void insert(TransferVO transferVO);
	
	public List<TransferVO> getAll(String billDate);
	
	public List<String> getOneBillDate();
}