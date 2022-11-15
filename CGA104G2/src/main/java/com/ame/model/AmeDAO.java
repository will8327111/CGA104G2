package com.ame.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class AmeDAO implements AmeDAO_interface {
	
	private static DataSource ds = null;
	Integer ameid = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Community");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

		private static final String INSERT_STMT = 
			"INSERT INTO AMENITIES (AME_NAME, AME_IMG, AME_INTRODUCE, AME_POINT, AME_MAX, AME_OPENING) VALUES (?, ?, ?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT AME_ID, AME_NAME, AME_INTRODUCE, AME_POINT, AME_MAX, AME_OPENING FROM AMENITIES order by AME_ID";
		private static final String GET_SOME_STMT = 
			"SELECT AME_ID, AME_NAME, AME_IMG, AME_INTRODUCE, AME_POINT, AME_MAX, AME_OPENING FROM AMENITIES where AME_ID = ?";
		private static final String DELETE = 
			"DELETE FROM AMENITIES where AME_ID = ?";
		private static final String UPDATE = 
			"UPDATE AMENITIES set AME_NAME= ?, AME_IMG= ?, AME_INTRODUCE= ?, AME_POINT= ?, AME_MAX= ?, AME_OPENING= ? where AME_ID = ?";
	
		
		public Integer insert(AmeVO ameVO) {
			try( Connection con = ds.getConnection();
				 PreparedStatement ps = con.prepareStatement(INSERT_STMT, Statement.RETURN_GENERATED_KEYS) ){
				
				ps.setString(1, ameVO.getAmeName());
				ps.setBytes(2, ameVO.getAmeImg());
				ps.setString(3, ameVO.getAmeIntroduce());
				ps.setInt(4, ameVO.getAmePoint());
				ps.setInt(5, ameVO.getAmeMax());
				ps.setString(6, ameVO.getAmeOpening());
				
				ps.executeUpdate();
				
			    Integer ameid = null;
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
	                ameid = rs.getInt(1);
	           }
//				System.out.println(ameid);
				return ameid;
			} catch(Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		public Integer delete(Integer ameid) {
			Connection con = null;
			PreparedStatement ps = null;
			
			try {
				
				con = ds.getConnection();
				ps = con.prepareStatement(DELETE);
				
				ps.setInt(1, ameid);
				
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
			return ameid;
		}
	
		public void update(AmeVO ameVO) {
			try( Connection con = ds.getConnection();
				 PreparedStatement ps = con.prepareStatement(UPDATE) ){
					
					ps.setString(1, ameVO.getAmeName());
					ps.setBytes(2, ameVO.getAmeImg());
					ps.setString(3, ameVO.getAmeIntroduce());
					ps.setInt(4, ameVO.getAmePoint());
					ps.setInt(5, ameVO.getAmeMax());
					ps.setString(6, ameVO.getAmeOpening());
					
					ps.setInt(7, ameVO.getAmeId());

					ps.executeUpdate();
					
				} catch(Exception e) {
					e.printStackTrace();
				}
		}
		
		public AmeVO findByPrimaryKey(Integer ameid) {
			
			AmeVO ameVO = null;
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				con = ds.getConnection();
				ps = con.prepareStatement(GET_SOME_STMT);

				ps.setInt(1, ameid);
				
				rs = ps.executeQuery();
				
				while (rs.next()) {
					ameVO = new AmeVO();
					ameVO.setAmeId(rs.getInt("AME_ID"));    
					ameVO.setAmeName(rs.getString("AME_NAME"));
					ameVO.setAmeImg(rs.getBytes("AME_IMG"));
					ameVO.setAmeIntroduce(rs.getString("AME_INTRODUCE"));
					ameVO.setAmePoint(rs.getInt("AME_POINT"));
					ameVO.setAmeMax(rs.getInt("AME_MAX"));
					ameVO.setAmeOpening(rs.getString("AME_OPENING"));
				}
				
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
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
			return ameVO;
			
		}
		
		public List<AmeVO> getAll(){
			
			List<AmeVO> list = new ArrayList<AmeVO>();
			AmeVO ameVO = null;
			
			try( Connection con = ds.getConnection();
				     PreparedStatement ps = con.prepareStatement(GET_ALL_STMT);
					     ResultSet rs = ps.executeQuery()    ){
				    
				    while (rs.next()) {
				    	ameVO = new AmeVO();
				    	ameVO.setAmeId(rs.getInt("AME_ID"));
				    	ameVO.setAmeName(rs.getString("AME_NAME"));
				    	ameVO.setAmeIntroduce(rs.getString("AME_INTRODUCE"));
				    	ameVO.setAmePoint(rs.getInt("AME_POINT"));
				    	ameVO.setAmeMax(rs.getInt("AME_MAX"));
				    	ameVO.setAmeOpening(rs.getString("AME_OPENING"));
				    
				    	list.add(ameVO);
				    }
				} catch(Exception e) {
					e.printStackTrace();
				}
			return list;
		};
		
}
