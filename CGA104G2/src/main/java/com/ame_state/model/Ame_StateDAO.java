package com.ame_state.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Ame_StateDAO implements Ame_StateDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT =
			"INSERT INTO AME_STATE (AME_ID, RECORD_DATE, RECORD_STATIME) VALUES (?, ?, ?)";
	private static final String UPDATE =
			"UPDATE AME_STATE set RECORD_STATIME = ? where AME_STATE_ID = ?";
	private static final String GET_SOME_STMT = 
			"SELECT  AME_ID, RECORD_DATE, RECORD_STATIME FROM AME_STATE where AME_ID = ?";
	private static final String SELECT_ONE = 
			"SELECT  AME_STATE_ID FROM AME_STATE where AME_ID = ? and RECORD_DATE = ? ";


	public void insert(Ame_StateVO ame_StateVO) {
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(INSERT_STMT)) {

			ps.setInt(1, ame_StateVO.getAmeId());
			ps.setDate(2, ame_StateVO.getRecordDate());
			ps.setString(3, ame_StateVO.getRecordStatime());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(Ame_StateVO ame_StateVO) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(UPDATE);

			ps.setString(1, ame_StateVO.getRecordStatime());
			ps.setInt(2, ame_StateVO.getAmeStateId());

			ps.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
	
	
	public Ame_StateVO selectByIdDate(Ame_StateVO ame_StateVO) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(SELECT_ONE);

			ps.setInt(1, ame_StateVO.getAmeId());
			ps.setDate(2, ame_StateVO.getRecordDate());
			
			rs = ps.executeQuery();
			
			Ame_StateVO tmpVO = new Ame_StateVO();
			while (rs.next()) {
				tmpVO.setAmeStateId(rs.getInt("AME_STATE_ID"));
			}
			
			return tmpVO;

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
	
	
	
	
	public Map<String, String> showAme_Statime(Integer AME_ID) {
		
		Map<String, String> map = new HashMap<String, String>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(GET_SOME_STMT);

			ps.setInt(1, AME_ID);

			rs = ps.executeQuery();
			
			
			
			while (rs.next()) {
				String key = "";
				String value = "";
//				ame_StateVO.setAmeId(rs.getInt("AME_ID"));
//				ame_StateVO.setRecordDate(rs.getDate("RECORD_DATE"));
//				ame_StateVO.setRecordStatime(rs.getString("RECORD_STATIME"));
//				list.add(ame_StateVO);
				
				key = rs.getDate("RECORD_DATE").toString();
				value = rs.getString("RECORD_STATIME").toString();
				map.put(key, value);
			}
			
//			JSONArray jsonArray = new JSONArray();
//	    List<Dto> dtoList = new ArrayList<>();
//	    for (int i = 0; i< 5; i++){
//	        JSONObject obj= new JSONObject();
//	        Dto dto= new Dto();
//	        dto.setId("100"+i);
//	        dto.setTime("200"+i);
//	        obj.put("id",dto.getId());
//	        obj.put("time",dto.getTime());
//	        jsonArray.add(obj);
	    
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return map;
	}
	
//	public List<Ame_StateVO> getAll(){
//		
//		List<Ame_StateVO> list = new ArrayList<Ame_StateVO>();
//		Ame_StateVO ame_StateVO = null;
//		try ( Connection con = ds.getConnection();
//			     PreparedStatement ps = con.prepareStatement(GET_ALL_STMT);
//			     ResultSet rs = ps.executeQuery()    ) {
//			
//			while (rs.next()) {
//				ame_StateVO = new Ame_StateVO();
//				ame_StateVO.setAmeStateId(rs.getInt("AME_STATE_ID"));
//				ame_StateVO.setAmeId(rs.getInt("AME_ID"));
//				ame_StateVO.setRecordDate(rs.getDate("RECORD_DATE"));
//				ame_StateVO.setRecordStatime(rs.getString("RECORD_STATIME"));
//				
//				list.add(ame_StateVO);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	
}
