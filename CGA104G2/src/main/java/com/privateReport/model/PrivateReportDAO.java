//package com.privateReport.model;
//
//import java.util.List;
//import java.util.Map;
//
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//import com.google.gson.JsonObject;
//import com.mail.model.MailVO;
//
//
//public class PrivateReportDAO implements PrivateReportDAO_interface {
//
//	@Override
//	public void update(PrivateReportVO privateReportVO) {
//
//		try {
//			beginTransaction();
//			getSession().update(privateReportVO);
//			commit();
//		} catch (Exception e) {
//			rollback();
//			e.printStackTrace();
//		}
//	}
//	
//	@Override
//	public void delete(Integer privateReportId) {
//		try {
//			beginTransaction();
//			PrivateReportVO privateReportVO = new PrivateReportVO();
//			privateReportVO.setPrivateReportId(privateReportId);
//			getSession().remove(privateReportVO);
//			commit();
//		} catch (Exception e) {
//			rollback();
//			e.printStackTrace();
//		}
//	}
//	
//	@Override
//	public JSONArray findByPrimaryKey(Integer privateReportId) {
//		List<PrivateReportVO> list = null;
//		JSONArray array = new JSONArray();
//		try {
//			beginTransaction();
//			final String hql = "FROM PrivateReportVO where privateReportId = :privateReportId";
//			list = getSession().createQuery(hql, PrivateReportVO.class).setParameter("privateReportId", privateReportId).list();
//			for(PrivateReportVO vo: list) {
//				JSONObject obj = new JSONObject();
//				obj.put("privateReportId", vo.getPrivateReportId());
//				obj.put("memberId", vo.getMemberId());
//				obj.put("privateReportTime", vo.getPrivateReportTime());
//				obj.put("privateReportContent", vo.getPrivateReportContent());
//				obj.put("privateReportPic", vo.getPrivateReportPic());
//				obj.put("privateReportStatus", vo.getPrivateReportStatus());
//				obj.put("replyOfReport", vo.getReplyOfReport());
//				obj.put("replyPic", vo.getReplyPic());
//				obj.put("replyOfReportTime", vo.getReplyOfReportTime());
//				array.put(obj);
//			}
//		} catch (Exception e) {
//			rollback();
//			e.printStackTrace();
//		}
//			return array;
//	}
//
//	
//	public JSONArray getAllReport() {
//		beginTransaction();
//		JSONArray array = new JSONArray(); 
//		final String hql = "FROM PrivateReportVO ORDER BY privateReportId DESC";
//		List<PrivateReportVO> list = getSession().createQuery(hql, PrivateReportVO.class).list();
//		
//		for(PrivateReportVO vo : list) {
//			
//			JSONObject obj = new JSONObject();
//			obj.put("privateReportId", vo.getPrivateReportId());
//			obj.put("memberId", vo.getMemberId());
//			obj.put("privateReportTime", vo.getPrivateReportTime());
//			obj.put("privateReportContent", vo.getPrivateReportContent());
//			obj.put("privateReportPic", vo.getPrivateReportPic());
//			obj.put("privateReportStatus", vo.getPrivateReportStatus());
//			obj.put("replyOfReport", vo.getReplyOfReport());
//			obj.put("replyPic", vo.getReplyPic());
//			obj.put("replyOfReportTime", vo.getReplyOfReportTime());
//			array.put(obj);
//		}
//		commit();
//		return array;
//	}
//	
//	
//	public static void main(String[] args) {
//		
//		
//	}
//	
//}
