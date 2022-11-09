package com.backstageAccount.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.backstageAuthorization.model.BackstageAuthorizationVO;

public class BackstageAccountJDBCDAO implements BackstageAccountDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei";
	String account = "root";
	String password = "password";

	private static final String INSERT_STMT = "INSERT INTO BACKSTAGE_ACCOUNT (BM_NAME,BM_ACCOUNT,BM_PASSWORD,BM_EMAIL,BM_STATUS) "
			+ "VALUES (?, ?, ?, ?, ?)";

	private static final String SHOW_INFO = "select * from BACKSTAGE_ACCOUNT where "
			+ "BM_ACCOUNT = ? and BM_PASSWORD = ?";

	private static final String RESEND_INFO = "select * from BACKSTAGE_ACCOUNT where "
			+ "BM_ACCOUNT = ? and BM_EMAIL = ?";

	private static final String DELETE = "DELETE FROM BACKSTAGE_ACCOUNT where BM_ID = ?";

	private static final String UPDATE = "UPDATE BACKSTAGE_ACCOUNT set BM_NAME=?, BM_ACCOUNT=?, "
			+ "BM_PASSWORD=?,BM_EMAIL=?,BM_STATUS=? where BM_ID = ?";

	private static final String GET_ONE_STMT = "SELECT BM_ID,BM_NAME,BM_ACCOUNT,BM_PASSWORD,BM_EMAIL,BM_STATUS FROM BACKSTAGE_ACCOUNT"
			+ " where BM_ID = ?";

	private static final String GET_ALL_STMT = "SELECT BM_ID, BM_NAME, BM_ACCOUNT,"
			+ "BM_PASSWORD,BM_EMAIL, BM_STATUS FROM BACKSTAGE_ACCOUNT order by BM_ID";

	private static final String GET_ONE_AUTHORIZATION = "SELECT BA.BM_ID, BM_NAME, BC.BM_CAPABILITIES_ID, BM_CAPABILITIES_NAME, BM_CAPABILITIES_CONTENT FROM BACKSTAGE_ACCOUNT BA join BACKSTAGE_AUTHORIZATION BAA on BA.BM_ID = BAA.BM_ID join BACKSTAGE_CAPABILITIES BC on BAA.BM_CAPABILITIES_ID = BC.BM_CAPABILITIES_ID where BA.BM_ID = ?";

	@Override
	public void insert(BackstageAccountVO backstageAccountVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, backstageAccountVO.getBmName());
			pstmt.setString(2, backstageAccountVO.getBmAccount());
			pstmt.setString(3, backstageAccountVO.getBmPassword());
			pstmt.setString(4, backstageAccountVO.getBmEmail());
			pstmt.setInt(5, backstageAccountVO.getBmStatus());

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

	public BackstageAccountVO findByAcAndPwd(String bmAccount, String bmPassword) {

		BackstageAccountVO backstageAccountVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(SHOW_INFO);
			pstmt.setString(1, bmAccount);
			pstmt.setString(2, bmPassword);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				backstageAccountVO = new BackstageAccountVO();
				backstageAccountVO.setBmId(rs.getInt("bm_id"));
				backstageAccountVO.setBmName(rs.getString("bm_name"));
				backstageAccountVO.setBmAccount(rs.getString("bm_account"));
				backstageAccountVO.setBmPassword(rs.getString("bm_password"));
				backstageAccountVO.setBmEmail(rs.getString("bm_email"));
				backstageAccountVO.setBmStatus(rs.getInt("bm_status"));

			}
			;

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
		return backstageAccountVO;
	};

	public BackstageAccountVO findByAcAndEmail(String bmAccount, String bmEmail) {

		BackstageAccountVO backstageAccountVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(RESEND_INFO);
			pstmt.setString(1, bmAccount);
			pstmt.setString(2, bmEmail);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				backstageAccountVO = new BackstageAccountVO();
				backstageAccountVO.setBmId(rs.getInt("bm_id"));
				backstageAccountVO.setBmName(rs.getString("bm_name"));
				backstageAccountVO.setBmAccount(rs.getString("bm_account"));
				backstageAccountVO.setBmPassword(rs.getString("bm_password"));
				backstageAccountVO.setBmEmail(rs.getString("bm_email"));
				backstageAccountVO.setBmStatus(rs.getInt("bm_status"));

			}
			;

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
		return backstageAccountVO;
	};

	@Override
	public void delete(Integer bmId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, bmId);

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

	public void update(BackstageAccountVO backstageAccountVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, backstageAccountVO.getBmName());
			pstmt.setString(2, backstageAccountVO.getBmAccount());
			pstmt.setString(3, backstageAccountVO.getBmPassword());
			pstmt.setString(4, backstageAccountVO.getBmEmail());
			pstmt.setInt(5, backstageAccountVO.getBmStatus());
			pstmt.setInt(6, backstageAccountVO.getBmId());

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

	public BackstageAccountVO findByPrimaryKey(Integer bmId) {

		BackstageAccountVO backstageAccountVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, bmId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				backstageAccountVO = new BackstageAccountVO();
				backstageAccountVO.setBmId(rs.getInt("bm_id"));
				backstageAccountVO.setBmName(rs.getString("bm_name"));
				backstageAccountVO.setBmAccount(rs.getString("bm_account"));
				backstageAccountVO.setBmPassword(rs.getString("bm_password"));
				backstageAccountVO.setBmEmail(rs.getString("bm_email"));
				backstageAccountVO.setBmStatus(rs.getInt("bm_status"));
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
		return backstageAccountVO;
	}

	public List<BackstageAccountVO> findOneAuthorization(Integer bmId) {
		
		List<BackstageAccountVO> list = new ArrayList<BackstageAccountVO>();
		BackstageAccountVO backstageAccountVO = new BackstageAccountVO();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ONE_AUTHORIZATION);
			
			pstmt.setInt(1, bmId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				backstageAccountVO = new BackstageAccountVO();
				backstageAccountVO.setBmId(rs.getInt("bm_id"));
				backstageAccountVO.setBmCapabilitiesId(rs.getInt("bm_capabilities_id"));
				backstageAccountVO.setBmName(rs.getString("bm_name"));
				backstageAccountVO.setBmCapabilitiesName(rs.getString("bm_capabilities_name"));
				backstageAccountVO.setBmCapabilitiesContent(rs.getString("bm_capabilities_content"));
				list.add(backstageAccountVO);
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

	public List<BackstageAccountVO> getAll() {

		List<BackstageAccountVO> list = new ArrayList<BackstageAccountVO>();
		BackstageAccountVO backstageAccountVO = null;

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
				backstageAccountVO = new BackstageAccountVO();
				backstageAccountVO.setBmId(rs.getInt("bm_id"));
				backstageAccountVO.setBmName(rs.getString("bm_name"));
				backstageAccountVO.setBmAccount(rs.getString("bm_account"));
				backstageAccountVO.setBmPassword(rs.getString("bm_password"));
				backstageAccountVO.setBmEmail(rs.getString("bm_email"));
				backstageAccountVO.setBmStatus(rs.getInt("bm_status"));
				list.add(backstageAccountVO); // Store the row in the list
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

		BackstageAccountJDBCDAO backstageAccountJDBCDAO = new BackstageAccountJDBCDAO();

		// 查詢個人訊息
//			BackstageAccountVO backstageAccountVO1 = backstageAccountJDBCDAO.findByAcAndPwd("allenChiu", "1234567");
//			System.out.print(backstageAccountVO1.getBmId() + ",");
//			System.out.print(backstageAccountVO1.getBmName() + ",");
//			System.out.print(backstageAccountVO1.getBmAccount() + ",");
//			System.out.print(backstageAccountVO1.getBmPassword() + ",");
//			System.out.print(backstageAccountVO1.getBmEmail() + ",");
//			System.out.print(backstageAccountVO1.getBmStatus() + ",");

		// 新增
//			BackstageAccountVO backstageAccountVO2 = new BackstageAccountVO();
//			backstageAccountVO2.setBmId(4);
//			backstageAccountVO2.setBmName("韓國瑜");
//			backstageAccountVO2.setBmAccount("danielHan");
//			backstageAccountVO2.setBmPassword("faDaChai");
//			backstageAccountVO2.setBmEmail("danielHan@gmail.com");
//			backstageAccountVO2.setBmStatus(1);
//			backstageAccountJDBCDAO.insert(backstageAccountVO2);

		// 刪除
//			backstageAccountJDBCDAO.delete(4);	

		// 修改
//		BackstageAccountVO backstageAccountVO3 = new BackstageAccountVO();
//		backstageAccountVO3.setBmId(9);
//		backstageAccountVO3.setBmName("韓國瑜");
//		backstageAccountVO3.setBmAccount("DanielHan");
//		backstageAccountVO3.setBmPassword("faDaChai");
//		backstageAccountVO3.setBmEmail("Daniel@gmail.com");
//		backstageAccountVO3.setBmStatus(1);
//		backstageAccountJDBCDAO.update(backstageAccountVO3);

		// 單一查詢
//			BackstageAccountVO backstageAccountVO4 = backstageAccountJDBCDAO.findByPrimaryKey(3);
//			System.out.print(backstageAccountVO4.getBmId() + ",");
//			System.out.print(backstageAccountVO4.getBmName() + ",");
//			System.out.print(backstageAccountVO4.getBmAccount() + ",");
//			System.out.print(backstageAccountVO4.getBmPassword() + ",");
//			System.out.print(backstageAccountVO4.getBmEmail() + ",");
//			System.out.print(backstageAccountVO4.getBmStatus());

		
		// 查詢個人權限功能
		List<BackstageAccountVO> list = backstageAccountJDBCDAO.findOneAuthorization(1);
		for (BackstageAccountVO a : list) {
			System.out.print(a.getBmId() + ",");
			System.out.print(a.getBmName() + ",");
			System.out.print(a.getBmCapabilitiesId() + ",");
			System.out.print(a.getBmCapabilitiesName() + ",");
			System.out.print(a.getBmCapabilitiesContent() + ",");
			System.out.println();
		}
		
		// 查詢全部
//		List<BackstageAccountVO> list = backstageAccountJDBCDAO.getAll();
//		for (BackstageAccountVO aBackstage : list) {
//			System.out.print(aBackstage.getBmId() + ",");
//			System.out.print(aBackstage.getBmName() + ",");
//			System.out.print(aBackstage.getBmAccount() + ",");
//			System.out.print(aBackstage.getBmPassword() + ",");
//			System.out.print(aBackstage.getBmEmail() + ",");
//			System.out.print(aBackstage.getBmStatus() + ",");
//			System.out.println();
//		}

		// 忘記密碼(輸入驗證碼得到舊密碼)
//		BackstageAccountVO backstageAccountVO1 = backstageAccountJDBCDAO.findByAcAndEmail
//				("allenChiu", "allen@gmail.com");
//		System.out.print(backstageAccountVO1.getBmId() + ",");
//		System.out.print(backstageAccountVO1.getBmName() + ",");
//		System.out.print(backstageAccountVO1.getBmAccount() + ",");
//		System.out.print(backstageAccountVO1.getBmPassword() + ",");
//		System.out.print(backstageAccountVO1.getBmEmail() + ",");
//		System.out.print(backstageAccountVO1.getBmStatus() + ",");

		// 查詢某部門的員工
//		BackstageAuthorizationVO backstageAuthorizationVO = new BackstageAuthorizationVO();
//		Set<BackstageAuthorizationVO> set = backstageAccountJDBCDAO.getCapsByBmId(1);
//		for (BackstageAuthorizationVO a : set) {
//			System.out.print(a.getBmId() + ",");
//			System.out.print(a.getBmCapabilitiesId() + ",");
//		}
	}

}
