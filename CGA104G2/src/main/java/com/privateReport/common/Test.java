//package com.privateReport.common;
//
//import org.hibernate.Session;
//
//import com.privateReport.model.PrivateReportVO;
//
//public class Test {
//	public static void main(String[] args) {
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		PrivateReportVO privateReportVO = session.get(PrivateReportVO.class, 1);
//		System.out.println(privateReportVO.getPrivateReportContent());
//		HibernateUtil.shutdown();
//		}
//}
