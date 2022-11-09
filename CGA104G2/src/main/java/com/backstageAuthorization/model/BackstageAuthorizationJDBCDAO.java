package com.backstageAuthorization.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BackstageAuthorizationJDBCDAO implements BackstageAuthorizationDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei";
	String account = "root";
	String password = "password";

	private static final String INSERT_STMT = "INSERT INTO BACKSTAGE_AUTHORIZATION (BM_ID, BM_CAPABILITIES_ID) VALUES (?, ?)";
	
	private static final String DELETE = "DELETE FROM BACKSTAGE_AUTHORIZATION where BM_ID = ? and BM_CAPABILITIES_ID = ?";

	private static final String GET_ALL_STMT = "SELECT BA.BM_ID, BM_NAME, BC.BM_CAPABILITIES_ID, BM_CAPABILITIES_NAME, BM_CAPABILITIES_CONTENT FROM BACKSTAGE_ACCOUNT BA left join BACKSTAGE_AUTHORIZATION BAA on BA.BM_ID = BAA.BM_ID left join BACKSTAGE_CAPABILITIES BC on BAA.BM_CAPABILITIES_ID = BC.BM_CAPABILITIES_ID";


	public void insert(BackstageAuthorizationVO backstageAuthorizationVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, backstageAuthorizationVO.getBmId());
			pstmt.setInt(2, backstageAuthorizationVO.getBmCapabilitiesId());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	public void delete(Integer bmId, Integer bmCapabilitiesId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, bmId);
			pstmt.setInt(2, bmCapabilitiesId);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	

	public List<BackstageAuthorizationVO> getAll() {

		List<BackstageAuthorizationVO> list = new ArrayList<BackstageAuthorizationVO>();
		BackstageAuthorizationVO backstageAuthorizationVO = new BackstageAuthorizationVO();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				backstageAuthorizationVO = new BackstageAuthorizationVO();
				backstageAuthorizationVO.setBmId(rs.getInt("bm_id"));
				backstageAuthorizationVO.setBmCapabilitiesId(rs.getInt("bm_capabilities_id"));
				backstageAuthorizationVO.setBmName(rs.getString("bm_name"));
				backstageAuthorizationVO.setBmCapabilitiesName(rs.getString("bm_capabilities_name"));
				backstageAuthorizationVO.setBmCapabilitiesContent(rs.getString("bm_capabilities_content"));
				list.add(backstageAuthorizationVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return list;
	}

	public static void main(String[] args) {

		BackstageAuthorizationJDBCDAO dao = new BackstageAuthorizationJDBCDAO();

		// 新增
//		BackstageAuthorizationVO backstageAuthorizationVO1 = new BackstageAuthorizationVO();
//		backstageAuthorizationVO1.setBmId(7);
//		backstageAuthorizationVO1.setBmCapabilitiesId(1);
//		dao.insert(backstageAuthorizationVO1);
		
		// 刪除
//		dao.delete(7, 3);

		// 查詢所有人權限功能
//		List<BackstageAuthorizationVO> list = dao.getAll();
//		for (BackstageAuthorizationVO a : list) {
//			System.out.print(a.getBmId() + ",");
//			System.out.print(a.getBmName() + ",");
//			System.out.print(a.getBmCapabilitiesId() + ",");
//			System.out.print(a.getBmCapabilitiesName() + ",");
//			System.out.print(a.getBmCapabilitiesContent() + ",");
//			System.out.println();
//		}

	}
}
