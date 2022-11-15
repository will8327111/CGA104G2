package com.store.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import org.json.JSONArray;
import org.json.JSONObject;

public class StoreJDBCDAO implements StoreDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";
	
	private static final String GET_ALL_STORE = "SELECT * FROM APPOINTED_STORE as1 left join APPOINTED_STORE_PHOTO asp on as1.STORE_ID = asp.STORE_ID order by as1.STORE_ID DESC";
	private static final String GET_PHOTO = "SELECT STORE_PHOTO FROM APPOINTED_STORE_PHOTO WHERE store_Id = ?";
	private static final String INSERT_STORE = "insert into APPOINTED_STORE (store_Type_Id,store_Info,store_Loc,STORE_LON,store_Lat) values(?,?,?,?,?)";
	private static final String INSERT_STORE_PHOTO = "insert into APPOINTED_STORE_PHOTO (store_id, store_photo) values(?,?)";
	
	private static final String GET_ONE_STORE ="select * from APPOINTED_STORE as1 left join APPOINTED_STORE_PHOTO asp on as1.STORE_ID = asp.STORE_ID where asp.STORE_ID = ? order by as1.STORE_ID DESC ;";
	
	private static final String DELETE = "DELETE FROM APPOINTED_STORE where STORE_ID =?";
	private static final String DELETE_PHOTO = "DELETE FROM APPOINTED_STORE_PHOTO where STORE_ID =?";
	
	private static final String UPDATE = "update APPOINTED_STORE set STORE_TYPE_ID = ?, STORE_INFO = ?, STORE_LOC = ?, STORE_LON = ?, STORE_LAT = ? where STORE_ID = ?";
	private static final String UPDATE_PHOTO = "update APPOINTED_STORE_PHOTO set STORE_PHOTO = ? where STORE_ID = ?";
	
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
				store.put("storeTypeId", rs.getInt("STORE_TYPE_ID"));
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
			pstmt.setString(2, storeVO.getStoreInfo());
			pstmt.setString(3, storeVO.getStoreLoc());
			pstmt.setBigDecimal(4, storeVO.getStoreLon());
			pstmt.setBigDecimal(5, storeVO.getStoreLat());
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
			
			pstmt.setInt(1, storeVO.getStoreTypeId());
			pstmt.setString(2, storeVO.getStoreInfo());
			pstmt.setString(3, storeVO.getStoreLoc());
			pstmt.setBigDecimal(4, storeVO.getStoreLon());
			pstmt.setBigDecimal(5, storeVO.getStoreLat());
			pstmt.setInt(6, storeVO.getStoreId());
			pstmt.executeUpdate();
	

			pstmt = con.prepareStatement(UPDATE_PHOTO);
			pstmt.setBytes(1, storeVO.getStorePhoto());
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
	public StoreVO findByPrimaryKey(Integer storeId) {
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
				storeVO = new StoreVO();
				storeVO.setStoreId(rs.getInt("STORE_ID"));
				storeVO.setStoreTypeId(rs.getInt("STORE_TYPE_ID"));
				storeVO.setStoreInfo(rs.getString("STORE_INFO"));
				storeVO.setStoreLoc(rs.getString("STORE_LOC"));
				storeVO.setStoreLon(rs.getBigDecimal("STORE_LON"));
				storeVO.setStoreLat(rs.getBigDecimal("STORE_LAT"));
				
				
				
				byte[] photo = rs.getBytes("STORE_PHOTO");
				img = encoder.encodeToString(photo);
				storeVO.setBase64img(img);
				
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
		return storeVO;
	}

	@Override
	public JSONArray findStoreType() {
		// TODO Auto-generated method stub
		return null;
	}

}
