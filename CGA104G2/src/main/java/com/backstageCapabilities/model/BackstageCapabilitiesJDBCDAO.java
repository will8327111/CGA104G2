package com.backstageCapabilities.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.backstageAccount.model.BackstageAccountJDBCDAO;
import com.backstageAccount.model.BackstageAccountVO;

public class BackstageCapabilitiesJDBCDAO implements BackstageCapabilitiesDAO_interface{

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei";
	String account = "root";
	String password = "password";

	private static final String INSERT_STMT = "INSERT INTO BACKSTAGE_CAPABILITIES (BM_CAPABILITIES_NAME, BM_CAPABILITIES_CONTENT) "
			+ "VALUES (?, ?)";

	private static final String DELETE = "DELETE FROM BACKSTAGE_CAPABILITIES where BM_CAPABILITIES_ID = ?";

	private static final String UPDATE = "UPDATE BACKSTAGE_CAPABILITIES set BM_CAPABILITIES_NAME=?, "
			+ "BM_CAPABILITIES_CONTENT=? where BM_CAPABILITIES_ID = ?";

	private static final String GET_ONE_STMT = "SELECT BM_CAPABILITIES_ID, BM_CAPABILITIES_NAME, BM_CAPABILITIES_CONTENT FROM BACKSTAGE_CAPABILITIES where BM_CAPABILITIES_ID = ?";
	
	private static final String GET_ALL_STMT = "SELECT BM_CAPABILITIES_ID, BM_CAPABILITIES_NAME,"
			+ "BM_CAPABILITIES_CONTENT FROM BACKSTAGE_CAPABILITIES order by BM_CAPABILITIES_ID";

	private static final String FIND_BY_NAME = "select * from BACKSTAGE_CAPABILITIES where BM_CAPABILITIES_NAME = ?";
	
	@Override
	public void insert(BackstageCapabilitiesVO backstageCapabilitiesVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, backstageCapabilitiesVO.getBmCapabilitiesName());
			pstmt.setString(2, backstageCapabilitiesVO.getBmCapabilitiesContent());

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

	@Override
	public void delete(Integer bmCapabilitiesId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, bmCapabilitiesId);

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

	public void update(BackstageCapabilitiesVO backstageCapabilitiesVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, backstageCapabilitiesVO.getBmCapabilitiesName());
			pstmt.setString(2, backstageCapabilitiesVO.getBmCapabilitiesContent());
			pstmt.setInt(3, backstageCapabilitiesVO.getBmCapabilitiesId());

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

	public BackstageCapabilitiesVO findByPrimaryKey(Integer bmCapabilitiesId) {
		
		BackstageCapabilitiesVO backstageCapabilitiesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, bmCapabilitiesId);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				backstageCapabilitiesVO = new BackstageCapabilitiesVO();
				backstageCapabilitiesVO.setBmCapabilitiesId(rs.getInt("bm_capabilities_id"));
				backstageCapabilitiesVO.setBmCapabilitiesName(rs.getString("bm_capabilities_name"));
				backstageCapabilitiesVO.setBmCapabilitiesContent(rs.getString("bm_capabilities_content"));
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
		return backstageCapabilitiesVO;
	};

public BackstageCapabilitiesVO findByCapName(String bmCapabilitiesName) {
		
		BackstageCapabilitiesVO backstageCapabilitiesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(FIND_BY_NAME);

			pstmt.setString(1, bmCapabilitiesName);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				backstageCapabilitiesVO = new BackstageCapabilitiesVO();
				backstageCapabilitiesVO.setBmCapabilitiesId(rs.getInt("bm_capabilities_id"));
				backstageCapabilitiesVO.setBmCapabilitiesName(rs.getString("bm_capabilities_name"));
				backstageCapabilitiesVO.setBmCapabilitiesContent(rs.getString("bm_capabilities_content"));
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
		return backstageCapabilitiesVO;
	};
	
	public List<BackstageCapabilitiesVO> getAll() {

		List<BackstageCapabilitiesVO> list = new ArrayList<BackstageCapabilitiesVO>();
		BackstageCapabilitiesVO backstageCapabilitiesVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				backstageCapabilitiesVO = new BackstageCapabilitiesVO();
				backstageCapabilitiesVO.setBmCapabilitiesId(rs.getInt("bm_capabilities_id"));
				backstageCapabilitiesVO.setBmCapabilitiesName(rs.getString("bm_capabilities_name"));
				backstageCapabilitiesVO.setBmCapabilitiesContent(rs.getString("bm_capabilities_content"));
				list.add(backstageCapabilitiesVO); // Store the row in the list
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

		BackstageCapabilitiesJDBCDAO backstageCapabilitiesJDBCDAO = new BackstageCapabilitiesJDBCDAO();

		// 新增
//			BackstageCapabilitiesVO backstageCapabilitiesVO1 = new BackstageCapabilitiesVO();
//			backstageCapabilitiesVO1.setBmCapabilitiesId(6);
//			backstageCapabilitiesVO1.setBmCapabilitiesName("投票");
//			backstageCapabilitiesVO1.setBmCapabilitiesContent("誰贊成,誰反對?");
//			backstageCapabilitiesJDBCDAO.insert(backstageCapabilitiesVO1);

		// 刪除
//		backstageCapabilitiesJDBCDAO.delete(6);	

		// 修改
//			BackstageCapabilitiesVO backstageCapabilitiesVO2 = new BackstageCapabilitiesVO();
//			backstageCapabilitiesVO2.setBmCapabilitiesId(5);
//			backstageCapabilitiesVO2.setBmCapabilitiesName("不");
//			backstageCapabilitiesVO2.setBmCapabilitiesContent("我反對!");
//			backstageCapabilitiesJDBCDAO.update(backstageCapabilitiesVO2);

		// 單一查詢
//			BackstageCapabilitiesVO backstageCapabilitiesVO3 = backstageCapabilitiesJDBCDAO.findByPrimaryKey(4);
//			System.out.print(backstageCapabilitiesVO3.getBmCapabilitiesId() + ",");
//			System.out.print(backstageCapabilitiesVO3.getBmCapabilitiesName() + ",");
//			System.out.print(backstageCapabilitiesVO3.getBmCapabilitiesContent() + ",");
		
		// 以功能名稱查詢
		BackstageCapabilitiesVO backstageCapabilitiesVO3 = backstageCapabilitiesJDBCDAO.findByCapName("公佈欄管理");
		System.out.print(backstageCapabilitiesVO3.getBmCapabilitiesId() + ",");
		System.out.print(backstageCapabilitiesVO3.getBmCapabilitiesName() + ",");
		System.out.print(backstageCapabilitiesVO3.getBmCapabilitiesContent() + ",");
		
		// 查詢全部
//		List<BackstageCapabilitiesVO> list = backstageCapabilitiesJDBCDAO.getAll();
//		for (BackstageCapabilitiesVO aBackstageCapabilities : list) {
//			System.out.print(aBackstageCapabilities.getBmCapabilitiesId() + ",");
//			System.out.print(aBackstageCapabilities.getBmCapabilitiesName() + ",");
//			System.out.print(aBackstageCapabilities.getBmCapabilitiesContent() + ",");
//			System.out.println();
//		}
		
	}
	
}
