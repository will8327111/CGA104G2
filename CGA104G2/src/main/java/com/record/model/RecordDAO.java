package com.record.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RecordDAO implements RecordDAO_interface {
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
			"INSERT INTO RECORD (MEMBER_ID, AME_ID, RECORD_DATE, RECORD_STATIME) VALUES (?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT RECORD_ID, MEMBER_ID, AME_ID, RECORD_DATE, RECORD_STATIME, RECORD_COUNT, RECORD_STATUS FROM RECORD order by RECORD_ID";
		private static final String GET_SOME_STMT = 
			"SELECT MEMBER_ID, AME_ID, RECORD_DATE, RECORD_STATIME, RECORD_COUNT, RECORD_STATUS FROM RECORD where MEMBER_ID = ? order by RECORD_STATUS DESC, RECORD_DATE ASC ";
		private static final String CHANGE_RECORD = 
			"UPDATE RECORD set RECORD_STATUS = ? where AME_ID = ? and RECORD_STATIME = ?";
		private static final String UPDATE_RECORDSTA = 
			"UPDATE RECORD set RECORD_STATUS = 1 where MEMBER_ID =? and AME_ID = ? and RECORD_DATE = ? and RECORD_STATIME = ?";
		
		@Override
		public void insert(RecordVO recordVO) {
			Connection con = null;
			PreparedStatement ps = null;
			
			try {
				con = ds.getConnection();
				ps = con.prepareStatement(INSERT_STMT);
				
				ps.setInt(1, recordVO.getMemberId());
				ps.setInt(2, recordVO.getAmeId());
				ps.setDate(3, recordVO.getRecordDate());
				ps.setString(4, recordVO.getRecordStatime());
				
				ps.executeUpdate();
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured "
						+ se.getMessage());
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
		
		@Override
		public void updaterecordsta(RecordVO recordVO) {
			Connection con = null;
			PreparedStatement ps = null;
			
			try {
				con = ds.getConnection();
				ps = con.prepareStatement(UPDATE_RECORDSTA);
				ps.setInt(1, recordVO.getMemberId());
				ps.setInt(2, recordVO.getAmeId());
				ps.setDate(3, recordVO.getRecordDate());
				ps.setString(4, recordVO.getRecordStatime());
				
				ps.executeUpdate();
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured "
						+ se.getMessage());
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

		@Override
		public boolean dorecordsta(Integer ameId, String recordStatime) {
			
			try (Connection con = ds.getConnection();
				 PreparedStatement ps = con.prepareStatement(CHANGE_RECORD)){
				
				ps.setInt(1, 1);
				ps.setInt(2, ameId);
				ps.setString(3, recordStatime);
				
				ps.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			return true;
		}
		
		@Override
		public List<RecordVO> findByPrimaryKey(Integer member_Id) {
			List<RecordVO> list = new ArrayList<RecordVO>();
			RecordVO recordVO = null;
			
			try (Connection con = ds.getConnection();
				 PreparedStatement ps = con.prepareStatement(GET_SOME_STMT)){
				
				ps.setInt(1,member_Id);
				
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) {
					recordVO = new RecordVO();
					recordVO.setMemberId(rs.getInt("MEMBER_ID"));
					recordVO.setAmeId(rs.getInt("AME_ID"));
					recordVO.setRecordDate(rs.getDate("RECORD_DATE"));
					recordVO.setRecordStatime(rs.getString("RECORD_STATIME"));
					recordVO.setRecordCount(rs.getInt("RECORD_COUNT"));
					recordVO.setRecordStatus(rs.getInt("RECORD_STATUS"));
					
					list.add(recordVO);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		public List<RecordVO> getAll(){
			
			List<RecordVO> list = new ArrayList<RecordVO>();
			RecordVO recordVO = null;
			
			try(Connection con = ds.getConnection();
				PreparedStatement ps = con.prepareStatement(GET_ALL_STMT);
				ResultSet rs = ps.executeQuery()    ){
				
				while(rs.next()) {
					recordVO = new RecordVO();
					recordVO.setRecordId(rs.getInt("RECORD_ID"));
					recordVO.setMemberId(rs.getInt("MEMBER_ID"));
					recordVO.setAmeId(rs.getInt("AME_ID"));
					recordVO.setRecordDate(rs.getDate("RECORD_DATE"));
					recordVO.setRecordStatime(rs.getString("RECORD_STATIME"));
					recordVO.setRecordCount(rs.getInt("RECORD_COUNT"));
					recordVO.setRecordStatus(rs.getInt("RECORD_STATUS"));
					
					list.add(recordVO);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
}
