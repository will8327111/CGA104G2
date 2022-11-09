package com.activitytype.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.json.JSONArray;


public class ActivityTypeJDBCDAO implements ActivityTypeDAO_interface{
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";
		
	private static final String INSERT_STMT ="INSERT INTO ACTIVITY_TYPE (ACTIVITY_TYPE_NAME)"
			+ "values (?)";
	
	private static final String DELETE ="DELETE from ACTIVITY_TYPE where ACTIVITY_TYPE_ID = ?";	
	
	public void insert(ActivityTypeVO Activity_typeVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, Activity_typeVO.getActTypeName());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException se) {
			se.printStackTrace(System.err);
		} 	
		catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
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


	public void delete(Integer acttypeid) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {


			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt.setInt(1, acttypeid);
			pstmt.executeUpdate();

		
		} catch (ClassNotFoundException se) {
			se.printStackTrace(System.err);
		} 	
		catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
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

	
	
	
	public static void main(String[] args) {
	
		ActivityTypeJDBCDAO dao = new ActivityTypeJDBCDAO();
		ActivityTypeVO activity_type=new ActivityTypeVO();
		activity_type.setActTypeName("戶外");
		dao.insert(activity_type);
	}


	@Override
	public List<ActivityTypeVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public JSONArray getType() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
