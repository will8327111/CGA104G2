package com.activity.common;

import org.hibernate.Session;
import org.hibernate.Transaction;

public interface ActivityServiceCommon {
	
	
	default Transaction beginTranscation() {
		return getSession().beginTransaction();	
	}


	default void commit () {
		getSession().getTransaction().commit();
	}
	
	default void rollback() {
	
		getSession().getTransaction().rollback();
		
	}

	default Session getSession() {
		
		return HibernateUtil.getSessionFactory().getCurrentSession();		
	}

}
