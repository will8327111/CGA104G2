//package com.privateReport.common;
//
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
//import com.activity.common.HibernateUtil;
//
//public interface PrivateReportCommon {
//
//	default Transaction beginTransaction() {
//		return getSession().beginTransaction();
//	}
//
//	default void commit() {
//		getSession().getTransaction().commit();
//	}
//
//	default void rollback() {
//		getSession().getTransaction().rollback();
//	}
//
//	default Session getSession() {
//		return HibernateUtil.getSessionFactory().getCurrentSession();
//		// 回傳一個session物件，類似JDBC連線
//	}
//}
