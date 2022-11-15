package com.card.model;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CardJNDIDAO implements CardDAO_interface {
	private DataSource ds = null;
	
	public CardJNDIDAO() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
//		private static final String 
}
