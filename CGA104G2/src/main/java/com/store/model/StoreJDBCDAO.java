package com.store.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mail.model.MailVO;

public class StoreJDBCDAO implements StoreDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";
	
	private static final String GET_ALL_STORE = "SELECT *  FROM APPOINTED_STORE as1 left join APPOINTED_STORE_TYPE ast on as1.STORE_TYPE_ID = ast.STORE_TYPE_ID left join APPOINTED_STORE_PHOTO asp on as1.STORE_ID  = asp.STORE_ID order by as1.STORE_ID DESC";

	private static final String INSERT_STORE = "insert into APPOINTED_STORE (store_Type_Id,store_Name,store_Info,store_Loc,STORE_LON,store_Lat) values(?,?,?,?,?,?)";
	private static final String INSERT_STORE_PHOTO = "insert into APPOINTED_STORE_PHOTO (store_id, store_photo) values(?,?)";
	
	private static final String GET_ONE_STORE ="select * from APPOINTED_STORE as1 left join APPOINTED_STORE_PHOTO asp on as1.STORE_ID = asp.STORE_ID where asp.STORE_ID = ? order by as1.STORE_ID DESC ;";
	
	private static final String DELETE = "DELETE FROM APPOINTED_STORE where STORE_ID =?";
	private static final String DELETE_PHOTO = "DELETE FROM APPOINTED_STORE_PHOTO where STORE_ID =?";
	
	private static final String UPDATE = "update APPOINTED_STORE set STORE_NAME = ? ,STORE_TYPE_ID = ?, STORE_INFO = ?, STORE_LOC = ?, STORE_LON = ?, STORE_LAT = ? where STORE_ID = ?";
	private static final String UPDATE_PHOTO = "update APPOINTED_STORE_PHOTO set STORE_PHOTO = ? where STORE_ID = ?";
	
	private static final String GET_STORE_TYPE="SELECT DISTINCT STORE_TYPE_NAME FROM APPOINTED_STORE as1 left join APPOINTED_STORE_TYPE ast on as1.STORE_TYPE_ID = ast.STORE_TYPE_ID";
	
	
	@Override
	public JSONArray getAll() {
		JSONArray array = new JSONArray();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STORE);
			rs = pstmt.executeQuery();
			java.util.Base64.Encoder encoder = Base64.getEncoder();
			String img = null;
			
			while (rs.next()) {
				
				JSONObject store = new JSONObject();			
				store.put("storeId", rs.getInt("STORE_ID"));
				store.put("storeName", rs.getString("STORE_NAME"));
				store.put("storeTypeId", rs.getString("STORE_TYPE_ID"));
				store.put("storeTypeName", rs.getString("STORE_TYPE_NAME"));
				store.put("storeInfo", rs.getString("STORE_INFO"));
				store.put("storeLoc", rs.getString("STORE_LOC"));
				store.put("storeLon", rs.getBigDecimal("STORE_LON"));
				store.put("storeLat", rs.getBigDecimal("STORE_LAT"));
				
//				byte[] photo = rs.getBase64img("STORE_PHOTO");
//				img = encoder.encodeToString(photo);
				store.put("base64img",rs.getString("STORE_PHOTO"));
				
				array.put(store);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
		return array;
	}

	@Override
	public void insert(StoreVO storeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int storeId = 0;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			pstmt = con.prepareStatement(INSERT_STORE,pstmt.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, storeVO.getStoreTypeId());
			pstmt.setString(2, storeVO.getStoreName());
			pstmt.setString(3, storeVO.getStoreInfo());
			pstmt.setString(4, storeVO.getStoreLoc());
			pstmt.setBigDecimal(5, storeVO.getStoreLon());
			pstmt.setBigDecimal(6, storeVO.getStoreLat());
			pstmt.executeUpdate();
			
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				storeId = rs.getInt(1);
			}
			pstmt = con.prepareStatement(INSERT_STORE_PHOTO);
			pstmt.setInt(1, storeId);
			pstmt.setString(2, storeVO.getBase64img());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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

	@Override
	public void update(StoreVO storeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, storeVO.getStoreName());
			pstmt.setInt(2, storeVO.getStoreTypeId());
			pstmt.setString(3, storeVO.getStoreInfo());
			pstmt.setString(4, storeVO.getStoreLoc());
			pstmt.setBigDecimal(5, storeVO.getStoreLon());
			pstmt.setBigDecimal(6, storeVO.getStoreLat());
			pstmt.setInt(7, storeVO.getStoreId());
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(UPDATE_PHOTO);
			pstmt.setString(1, storeVO.getBase64img());
			pstmt.setInt(2, storeVO.getStoreId());		
			pstmt.executeUpdate();
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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

	@Override
	public void delete(Integer storeId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_PHOTO);
			pstmt.setInt(1, storeId);
			pstmt.executeUpdate();
			
			
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, storeId);

			pstmt.executeUpdate();
			
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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

	@Override
	public JSONArray findByPrimaryKey(Integer storeId) {
		JSONArray array = new JSONArray();
		StoreVO storeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		java.util.Base64.Encoder encoder = Base64.getEncoder();
		String img = null;	
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STORE);
			pstmt.setInt(1, storeId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				array.put(rs.getString("STORE_NAME"));
				array.put(rs.getString("STORE_INFO"));
				array.put(rs.getString("STORE_LOC"));
				array.put(rs.getString("STORE_PHOTO"));
				array.put(rs.getString("STORE_LAT"));
				array.put(rs.getString("STORE_LON"));
				
//				byte[] photo = rs.getBytes("STORE_PHOTO");
//				img = encoder.encodeToString(photo);
//				array.put(img);
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
		return array;
	}

	@Override
	public JSONArray findStoreType() {

		JSONArray array = new JSONArray();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_STORE_TYPE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JSONObject store = new JSONObject();	
				store.put("storeTypeName",rs.getString("STORE_TYPE_NAME"));
				
				array.put(store);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
		
		return array;
	}
	@Override
	public JSONArray search(String storeTypeName, Integer storeId) {
		JSONArray array = new JSONArray();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			final String SEARCH_STORE = "SELECT *  FROM APPOINTED_STORE as1 left join APPOINTED_STORE_TYPE ast on as1.STORE_TYPE_ID = ast.STORE_TYPE_ID left join APPOINTED_STORE_PHOTO asp on as1.STORE_ID  = asp.STORE_ID where STORE_TYPE_NAME = ? and as1.STORE_ID = ?";
			
//			if(!(storeId == 0)) {
//				SEARCH_STORE.append(" "+"as1.STORE_ID"+" "+"="+" "+"?"+" "+"and");
//			}
//			SEARCH_STORE.append(" "+"STORE_TYPE_NAME"+" "+"="+" "+'"'+"?"+'"'+" "+"ORDER BY"+" "+"as1.STORE_ID"+" "+"DESC");
			
			pstmt = con.prepareStatement(String.valueOf(SEARCH_STORE));
			pstmt.setString(1,storeTypeName);
			pstmt.setInt(2,storeId);
			
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				
				JSONObject store = new JSONObject();			
				store.put("storeId", rs.getInt("STORE_ID"));
				store.put("storeName", rs.getString("STORE_NAME"));
				store.put("storeTypeName", rs.getString("STORE_TYPE_NAME"));
				store.put("storeInfo", rs.getString("STORE_INFO"));
				store.put("storeLoc", rs.getString("STORE_LOC"));
				store.put("storeLon", rs.getBigDecimal("STORE_LON"));
				store.put("storeLat", rs.getBigDecimal("STORE_LAT"));
				
//				byte[] photo = rs.getBase64img("STORE_PHOTO");
//				img = encoder.encodeToString(photo);
				store.put("base64img",rs.getString("STORE_PHOTO"));
				array.put(store);
			}			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
		return array;
	}
}
