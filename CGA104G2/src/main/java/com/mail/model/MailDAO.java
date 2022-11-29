package com.mail.model;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;


public class MailDAO implements MailDAO_interface {
//	String driver = "com.mysql.cj.jdbc.Driver";
//	String url = "jdbc:mysql://localhost:3306/Community_Management?serverTimezone=Asia/Taipei";
//	String userid = "root";
//	String passwd = "password";
	
	@Override
	public JSONArray getAll() {
		beginTransaction();
		JSONArray array = new JSONArray(); 
		final String hql = "FROM MailVO ORDER BY mailId DESC";
		List<MailVO> list = getSession().createQuery(hql, MailVO.class).list();
		
		for(MailVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("mailId", vo.getMailId());
			obj.put("memberId", vo.getMemberId());
			obj.put("mailType", vo.getMailType());
			obj.put("mailDelTime", vo.getMailDelTime());
			obj.put("mailPickupTime", vo.getMailPickupTime());
			obj.put("mailState", vo.getMailState());
			//改動態
			if(vo.getMailState() == 0) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "未領取");
			}else if(vo.getMailState() == 1) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "已領取");
			}else if(vo.getMailState() == 2) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "退貨中");
			}else{
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "退貨完成");
			}
			
			array.put(obj);
		}
		
		commit();
		return array;
	}
	@Override
	public JSONArray getFrontAll(Integer memberId) {
		JSONArray array = new JSONArray(); 
		try {
			beginTransaction();
			final String hql = "FROM MailVO where MEMBER_ID = "+ memberId +" ORDER BY mailId DESC";
			List<MailVO> list = getSession().createQuery(hql, MailVO.class).list();
			
			for(MailVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("mailId", vo.getMailId());
				obj.put("memberId", vo.getMemberId());
				obj.put("mailType", vo.getMailType());
				obj.put("mailDelTime", vo.getMailDelTime());
				obj.put("mailPickupTime", vo.getMailPickupTime());
				obj.put("mailState", vo.getMailState());
				//改動態
				if(vo.getMailState() == 0) {
					obj.put("mailState", vo.getMailState());
					obj.put("mailStateName", "未領取");
				}else if(vo.getMailState() == 1) {
					obj.put("mailState", vo.getMailState());
					obj.put("mailStateName", "已領取");
				}else if(vo.getMailState() == 2) {
					obj.put("mailState", vo.getMailState());
					obj.put("mailStateName", "退貨中");
				}else{
					obj.put("mailState", vo.getMailState());
					obj.put("mailStateName", "退貨完成");
				}
				array.put(obj);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		commit();
		return array;
	}

	@Override
	public void insert(MailVO mailVO) {
		try {
			beginTransaction();
			getSession().save(mailVO);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void update(MailVO mailVO) {
		beginTransaction();
		try {
			getSession().update(mailVO);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Integer mailId) {
		try {
			beginTransaction();
			MailVO mailVO = new MailVO();
			mailVO.setMailId(mailId);
			getSession().remove(mailVO);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
	}
	
	@Override
	public JSONArray findMailType() {
		beginTransaction();
		final String hql = "SELECT mailType FROM MailVO GROUP BY mailType ";
		List<String> list =	getSession().createQuery(hql).list();		
		JSONArray array = new JSONArray();
		
		for(String mailType : list) {
			JSONObject obj = new JSONObject();
			obj.put("mailType",mailType);
			array.put(obj);
		}
			commit();
			return array;
	}
	@Override
	public JSONArray frontSearch(String mailType,Integer mailId,Integer memberId) {
		beginTransaction();
		final StringBuilder sql = new StringBuilder().append("SELECT * FROM Mail where ");
		
		if(!(mailId == 0)) {
			sql.append(" "+"MAIL_ID"+" "+"="+" "+mailId+" "+"and");
		}
		
		if(mailType.trim().length()!=0 &&!(mailType == null)) {
			sql.append(" "+"MAIL_TYPE"+" "+"="+" "+'"'+mailType+'"'+" "+"and");
		}
		sql.append(" "+"MEMBER_ID"+" "+"="+" "+memberId+" "+"ORDER BY"+" "+"MAIL_ID"+" "+"DESC");
		
		JSONArray array = new JSONArray();
		List<MailVO> list = getSession().createNativeQuery(sql.toString(),MailVO.class).list();
		for(MailVO vo : list) {
			JSONObject obj =new JSONObject();
			obj.put("mailId",vo.getMailId());
			obj.put("memberId",vo.getMemberId());
			obj.put("mailType",vo.getMailType());
			obj.put("mailDelTime",vo.getMailDelTime());
			obj.put("mailPickupTime",vo.getMailPickupTime());
			
			//改動態
			if(vo.getMailState() == 0) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "未領取");
			}else if(vo.getMailState() == 1) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "已領取");
			}else if(vo.getMailState() == 2) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "退貨中");
			}else{
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "退貨完成");
			}
			
			array.put(obj);
		}			
		commit();
		return array;
	}
	@Override
	public JSONArray search(String mailType,Integer mailId) {
		beginTransaction();
		final StringBuilder sql = new StringBuilder().append("SELECT * FROM Mail where ");
		
		if(!(mailId == 0)) {
			sql.append(" "+"MAIL_ID"+" "+"="+" "+mailId+" "+"and");
		}
		
		if(mailType.trim().length()!=0 &&!(mailType == null)) {
			sql.append(" "+"MAIL_TYPE"+" "+"="+" "+'"'+mailType+'"'+" "+"ORDER BY"+" "+"MAIL_ID"+" "+"DESC");
		}
		
		
		JSONArray array = new JSONArray();
		List<MailVO> list = getSession().createNativeQuery(sql.toString(),MailVO.class).list();
		for(MailVO vo : list) {
			JSONObject obj =new JSONObject();
			obj.put("mailId",vo.getMailId());
			obj.put("memberId",vo.getMemberId());
			obj.put("mailType",vo.getMailType());
			obj.put("mailDelTime",vo.getMailDelTime());
			obj.put("mailPickupTime",vo.getMailPickupTime());
			
			//改動態
			if(vo.getMailState() == 0) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "未領取");
			}else if(vo.getMailState() == 1) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "已領取");
			}else if(vo.getMailState() == 2) {
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "退貨中");
			}else{
				obj.put("mailState", vo.getMailState());
				obj.put("mailStateName", "退貨完成");
			}
			
			array.put(obj);
		}			
		commit();
		return array;
		
	}
//	@Override
//	public JSONArray singleSearch(String mailType) {
//		beginTransaction();
//		final StringBuilder sql = new StringBuilder().append("SELECT * FROM Mail where ");
//		
//		if(mailType.trim().length()!=0 &&!(mailType==null)) {
//			sql.append(" "+"MAIL_TYPE"+" "+"="+" "+'"'+mailType+'"'+" "+"and");;
//			
//		}
//		
//		if(!(mailId==0)) {
//			sql.append(" "+"MAIL_ID"+" "+"="+" "+mailId);
//		}
//		
////		sql.append(" "+"MAIL_STATUS = 0");
//		JSONArray array = new JSONArray();
//		List<MailVO> list = getSession().createNativeQuery(sql.toString(),MailVO.class).list();
//		for(MailVO vo : list) {
//			JSONObject obj =new JSONObject();
//			obj.put("mailId",vo.getMailId());
//			obj.put("memberId",vo.getMemberId());
//			obj.put("mailType",vo.getMailType());
//			obj.put("mailDelTime",vo.getMailDelTime());
//			obj.put("mailPickupTime",vo.getMailPickupTime());
//			obj.put("mailState",vo.getMailState());
//			array.put(obj);
//		}			
//		commit();
//		return array;
//		
//	}
	@Override
	public List<MailVO> findByPrimaryKey(Integer mailId) {
//		try {
//			beginTransaction();
//			final String hql = "FROM MailVO where mailId = :id";
//			List<MailVO> list = getSession().createQuery(hql, MailVO.class).setParameter("id", mailId).list();
//			return list;
//		} catch (Exception e) {
//			rollback();
//			e.printStackTrace();
			return null;
//		}
		
	}

	@Override
	public MailVO findByMemberName(String memberName) {
//		MailVO mailVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			final String sql ="select MEMBER_ID from MEMBER where MEMBER_NAME = ?"; 
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, memberName);
//			rs = pstmt.executeQuery();
//			
//			mailVO = new MailVO();
//			mailVO.setMemberId(rs.getInt("member_Id"));
//			
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
		return null;
			
		
//		try {
//			beginTransaction();
//			final String hql ="FROM MailVO WHERE memberName = :memberName"; 
//			MailVO vo = getSession().createQuery(hql, MailVO.class).setParameter("memberName", memberName).uniqueResult();
//			commit();
//			return vo;
//		} catch (Exception e) {
//			rollback();
//			e.printStackTrace();
//			return null;
//		}
	}

}
