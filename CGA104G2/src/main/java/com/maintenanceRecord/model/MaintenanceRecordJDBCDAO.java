package com.maintenanceRecord.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.privateReport1.model.PrivateReportDAO1_interface;
import com.privateReport1.model.PrivateReportJDBCDAO1;
import com.privateReport1.model.PrivateReportVO1;

public class MaintenanceRecordJDBCDAO implements MaintenanceRecordDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei";
	String account = "root";
	String password = "password";

	private static final String FRONT_END_INSERT = "INSERT INTO MAINTENANCE_RECORD (MEMBER_ID,MAINTENANCE_CONTENT,MAINTENANCE_PIC,MAINTENANCE_STATUS) VALUES(?, ?, ?, ?)";

	private static final String GET_INFO_BY_MEMBER_AC = "SELECT MEMBER_ID, MEMBER_AC FROM MEMBER WHERE MEMBER_AC = ?;";
	
	private static final String GET_BY_MEMBER_AC = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS,\r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID WHERE MEMBER_AC = ?";

	private static final String GET_BY_MEMBER_AC_AND_REPORT_ID = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS,\r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n"
			+ "WHERE MEMBER_AC = ? AND MAINTENANCE_ID = ?";

	private static final String UPDATE = "UPDATE MAINTENANCE_RECORD set REPLY_OF_MAINTENANCE = ?, REPLY_PIC = ?, MAINTENANCE_STATUS = ?, REPLY_OF_MAINTENANCE_TIME=CURRENT_TIMESTAMP() where MAINTENANCE_ID = ?";

	private static final String DELETE = "DELETE FROM MAINTENANCE_RECORD where MAINTENANCE_ID = ?";

	private static final String GET_ONE_BY_MEMBERNAME = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS, \r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MEMBER_NAME = ?;";

	private static final String GET_ONE_BY_REPORTID = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS, \r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MAINTENANCE_ID = ?;";

	private static final String GET_BY_MEMBERNAME = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS, \r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MEMBER_NAME = ?;";
	
	
	private static final String GET_ONE_BY_REPORTSTATUS = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS, \r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MAINTENANCE_STATUS = ?;";

	private static final String GET_ALL_STMT = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS, \r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "ORDER BY MAINTENANCE_ID;";

	private static final String GET_ALL_SELECTED = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS, \r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MAINTENANCE_STATUS = ? ORDER BY MAINTENANCE_ID;";

	private static final String MEMBER_GET_ALL_SELECTED = "SELECT MAINTENANCE_ID, PR.MEMBER_ID, MEMBER_NAME, MAINTENANCE_TIME,\r\n"
			+ "MAINTENANCE_CONTENT, MAINTENANCE_PIC, MAINTENANCE_STATUS, \r\n"
			+ "REPLY_OF_MAINTENANCE, REPLY_PIC, REPLY_OF_MAINTENANCE_TIME FROM MAINTENANCE_RECORD PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MAINTENANCE_STATUS = ? AND MEMBER_AC = ?;";
	
	@Override
	public void frontEndInsert(MaintenanceRecordVO maintenanceRecordVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(FRONT_END_INSERT);

			pstmt.setInt(1, maintenanceRecordVO.getMemberId());
			pstmt.setString(2, maintenanceRecordVO.getMaintenanceContent());
			pstmt.setBytes(3, maintenanceRecordVO.getMaintenancePic());
			pstmt.setInt(4, maintenanceRecordVO.getMaintenanceStatus());
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
	public List<MaintenanceRecordVO> findByMemberName(String memberName) {
		List<MaintenanceRecordVO> list = new ArrayList<MaintenanceRecordVO>();
		MaintenanceRecordVO maintenanceRecordVO = new MaintenanceRecordVO();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ONE_BY_MEMBERNAME);

			pstmt.setString(1, memberName);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_maintenance_time"));
				list.add(maintenanceRecordVO);
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

	@Override
	public void update(MaintenanceRecordVO maintenanceRecordVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, maintenanceRecordVO.getReplyOfMaintenance());
			pstmt.setBytes(2, maintenanceRecordVO.getReplyPic());
			pstmt.setInt(3, maintenanceRecordVO.getMaintenanceStatus());
			pstmt.setInt(4, maintenanceRecordVO.getMaintenanceId());
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
	public void delete(Integer maintenanceId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, maintenanceId);

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
	public MaintenanceRecordVO findInfoByAc(String memberAc) {

		MaintenanceRecordVO maintenanceRecordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_INFO_BY_MEMBER_AC);
			pstmt.setString(1, memberAc);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberAc(rs.getString("member_ac"));
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
		return maintenanceRecordVO;
	}
	
	@Override
	public MaintenanceRecordVO findByMtIdAndAc(Integer maintenanceId, String memberAc) {

		MaintenanceRecordVO maintenanceRecordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_BY_MEMBER_AC_AND_REPORT_ID);
			pstmt.setString(1, memberAc);
			pstmt.setInt(2, maintenanceId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_maintenance_time"));
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
		return maintenanceRecordVO;
	}
	
	@Override
	public MaintenanceRecordVO findByMtId(Integer maintenanceId) {

		MaintenanceRecordVO maintenanceRecordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ONE_BY_REPORTID);
			pstmt.setInt(1, maintenanceId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("Maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("Maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("Maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("Maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("Maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_Maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_Maintenance_time"));
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
		return maintenanceRecordVO;
	}

	@Override
	public MaintenanceRecordVO findMemberName(String memberName) {

		MaintenanceRecordVO maintenanceRecordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_BY_MEMBERNAME);
			pstmt.setString(1, memberName);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("Maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("Maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("Maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("Maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("Maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_Maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_Maintenance_time"));
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
		return maintenanceRecordVO;
	}
	
	@Override
	public MaintenanceRecordVO findByMtStatus(Integer maintenanceStatus) {

		MaintenanceRecordVO maintenanceRecordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ONE_BY_REPORTSTATUS);
			pstmt.setInt(1, maintenanceStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("Maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("Maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("Maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("Maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("Maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_Maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_Maintenance_time"));
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
		return maintenanceRecordVO;
	}

	@Override
	public List<MaintenanceRecordVO> findByMemberAc(String memberAc) {
		List<MaintenanceRecordVO> list = new ArrayList<MaintenanceRecordVO>();
		MaintenanceRecordVO maintenanceRecordVO = new MaintenanceRecordVO();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_BY_MEMBER_AC);

			pstmt.setString(1, memberAc);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("Maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("Maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("Maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("Maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_Maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_Maintenance_time"));
				list.add(maintenanceRecordVO);
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

	public List<MaintenanceRecordVO> getAllMt() {

		List<MaintenanceRecordVO> list = new ArrayList<MaintenanceRecordVO>();
		MaintenanceRecordVO maintenanceRecordVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("Maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("Maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("Maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("Maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("Maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_Maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_Maintenance_time"));
				list.add(maintenanceRecordVO);
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

	public List<MaintenanceRecordVO> getAllSelected(Integer maintenanceStatus) {

		List<MaintenanceRecordVO> list = new ArrayList<MaintenanceRecordVO>();
		MaintenanceRecordVO maintenanceRecordVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ALL_SELECTED);
			pstmt.setInt(1, maintenanceStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("Maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("Maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("Maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("Maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("Maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_Maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_Maintenance_time"));
				list.add(maintenanceRecordVO);
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

	public List<MaintenanceRecordVO> memberGetAllSelected(Integer maintenanceStatus, String memberAc) {

		List<MaintenanceRecordVO> list = new ArrayList<MaintenanceRecordVO>();
		MaintenanceRecordVO maintenanceRecordVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(MEMBER_GET_ALL_SELECTED);
			pstmt.setInt(1, maintenanceStatus);
			pstmt.setString(2, memberAc);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				maintenanceRecordVO = new MaintenanceRecordVO();
				maintenanceRecordVO.setMaintenanceId(rs.getInt("Maintenance_id"));
				maintenanceRecordVO.setMemberId(rs.getInt("member_id"));
				maintenanceRecordVO.setMemberName(rs.getString("member_name"));
				maintenanceRecordVO.setMaintenanceTime(rs.getTimestamp("Maintenance_time"));
				maintenanceRecordVO.setMaintenanceContent(rs.getString("Maintenance_content"));
				maintenanceRecordVO.setMaintenancePic(rs.getBytes("Maintenance_pic"));
				maintenanceRecordVO.setMaintenanceStatus(rs.getInt("Maintenance_Status"));
				maintenanceRecordVO.setReplyOfMaintenance(rs.getString("reply_of_Maintenance"));
				maintenanceRecordVO.setReplyPic(rs.getBytes("reply_pic"));
				maintenanceRecordVO.setReplyOfMaintenanceTime(rs.getTimestamp("reply_of_Maintenance_time"));
				list.add(maintenanceRecordVO);
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

		MaintenanceRecordJDBCDAO maintenanceRecordJDBCDAO = new MaintenanceRecordJDBCDAO();

		// 前台新增檢舉資料
//		MaintenanceRecordVO maintenanceRecordVO = new MaintenanceRecordVO();
//		maintenanceRecordVO.setMemberId(3);
//		maintenanceRecordVO.setMaintenanceContent("外面地板都是尿欸!");
//		maintenanceRecordVO.setMaintenancePic(null);
//		maintenanceRecordVO.setMaintenanceStatus(0);
//		maintenanceRecordJDBCDAO.frontEndInsert(maintenanceRecordVO);

		// 前台以會員帳號查詢
//		MaintenanceRecordVO maintenanceRecordVO = maintenanceRecordJDBCDAO.findInfoByAc("EreYea1");
//		System.out.print(maintenanceRecordVO.getMemberId() + ",");
//		System.out.print(maintenanceRecordVO.getMemberAc() + ",");
//		System.out.println();
		
		// 前台以會員帳號查詢個人檢舉
//		List<MaintenanceRecordVO> list = maintenanceRecordJDBCDAO.findByMemberAc("EreYea1");
//		for (MaintenanceRecordVO a : list) {
//			System.out.print(a.getMaintenanceId() + ",");
//			System.out.print(a.getMemberId() + ",");
//			System.out.print(a.getMemberName() + ",");
//			System.out.print(a.getMaintenanceTime() + ",");
//			System.out.print(a.getMaintenanceContent() + ",");
//			System.out.print(a.getMaintenancePic() + ",");
//			System.out.print(a.getMaintenanceStatus() + ",");
//			System.out.print(a.getReplyOfMaintenance() + ",");
//			System.out.print(a.getReplyPic() + ",");
//			System.out.print(a.getReplyOfMaintenanceTime() + ",");
//			System.out.println();
//		}

		// 前台以檢舉編號查詢個人檢舉
//		MaintenanceRecordVO maintenanceRecordVO = maintenanceRecordJDBCDAO.findByMtIdAndAc(1, "EreYea1");
//			System.out.print(maintenanceRecordVO.getMaintenanceId() + ",");
//			System.out.print(maintenanceRecordVO.getMemberId() + ",");
//			System.out.print(maintenanceRecordVO.getMemberName() + ",");
//			System.out.print(maintenanceRecordVO.getMaintenanceTime() + ",");
//			System.out.print(maintenanceRecordVO.getMaintenanceContent() + ",");
//			System.out.print(maintenanceRecordVO.getMaintenancePic() + ",");
//			System.out.print(maintenanceRecordVO.getMaintenanceStatus() + ",");
//			System.out.print(maintenanceRecordVO.getReplyOfMaintenance() + ",");
//			System.out.print(maintenanceRecordVO.getReplyPic() + ",");
//			System.out.print(maintenanceRecordVO.getReplyOfMaintenanceTime() + ",");
//			System.out.println();
		
		// 後台新增回覆內容
//		MaintenanceRecordVO maintenanceRecordVO = new MaintenanceRecordVO();
//		maintenanceRecordVO.setReplyOfMaintenance("所以勒?");
//		maintenanceRecordVO.setReplyPic(null);
//		maintenanceRecordVO.setMaintenanceStatus(1);
//		maintenanceRecordVO.setMaintenanceId(3);
//		maintenanceRecordVO.setMemberId(3);
//		maintenanceRecordJDBCDAO.update(maintenanceRecordVO);

//		 前台刪除檢舉資料
//		maintenanceRecordJDBCDAO.delete(63);

		// 以檢舉編號查詢個人檢舉
//		MaintenanceRecordVO maintenanceRecordVO = maintenanceRecordJDBCDAO.findByMtId(3);
//			System.out.print(maintenanceRecordVO.getMaintenanceId() + ",");
//			System.out.print(maintenanceRecordVO.getMemberId() + ",");
//			System.out.print(maintenanceRecordVO.getMemberName() + ",");
//			System.out.print(maintenanceRecordVO.getMaintenanceTime() + ",");
//			System.out.print(maintenanceRecordVO.getMaintenanceContent() + ",");
//			System.out.print(maintenanceRecordVO.getMaintenancePic() + ",");
//			System.out.print(maintenanceRecordVO.getMaintenanceStatus() + ",");
//			System.out.print(maintenanceRecordVO.getReplyOfMaintenance() + ",");
//			System.out.print(maintenanceRecordVO.getReplyPic() + ",");
//			System.out.print(maintenanceRecordVO.getReplyOfMaintenanceTime() + ",");
//			System.out.println();

		// 以會員名稱查詢個人檢舉
//		List<MaintenanceRecordVO> list = maintenanceRecordJDBCDAO.findByMemberName("阿敏");
//		for (MaintenanceRecordVO a : list) {
//			System.out.print(a.getMaintenanceId() + ",");
//			System.out.print(a.getMemberId() + ",");
//			System.out.print(a.getMemberName() + ",");
//			System.out.print(a.getMaintenanceTime() + ",");
//			System.out.print(a.getMaintenanceContent() + ",");
//			System.out.print(a.getMaintenancePic() + ",");
//			System.out.print(a.getMaintenanceStatus() + ",");
//			System.out.print(a.getReplyOfMaintenance() + ",");
//			System.out.print(a.getReplyPic() + ",");
//			System.out.print(a.getReplyOfMaintenanceTime() + ",");
//			System.out.println();
//		}

		// 以編號查詢個人檢舉
//			List<MaintenanceRecordVO> list = maintenanceRecordJDBCDAO.findByMemberId(3);
//			for (MaintenanceRecordVO a : list) {
//				System.out.print(a.getMaintenanceId() + ",");
//				System.out.print(a.getMemberId() + ",");
//				System.out.print(a.getMemberName() + ",");
//				System.out.print(a.getMaintenanceTime() + ",");
//				System.out.print(a.getMaintenanceContent() + ",");
//				System.out.print(a.getMaintenancePic() + ",");
//				System.out.print(a.getMaintenanceStatus() + ",");
//				System.out.print(a.getReplyOfMaintenance() + ",");
//				System.out.print(a.getReplyPic() + ",");
//				System.out.print(a.getReplyOfMaintenanceTime() + ",");
//				System.out.println();
//			}

		// 查詢全部人的檢舉
//		List<MaintenanceRecordVO> list = maintenanceRecordJDBCDAO.getAllMt();
//		for (MaintenanceRecordVO a : list) {
//			System.out.print(a.getMaintenanceId() + ",");
//			System.out.print(a.getMemberId() + ",");
//			System.out.print(a.getMemberName() + ",");
//			System.out.print(a.getMaintenanceTime() + ",");
//			System.out.print(a.getMaintenanceContent() + ",");
//			System.out.print(a.getMaintenancePic() + ",");
//			System.out.print(a.getMaintenanceStatus() + ",");
//			System.out.print(a.getReplyOfMaintenance() + ",");
//			System.out.print(a.getReplyPic() + ",");
//			System.out.print(a.getReplyOfMaintenanceTime() + ",");
//			System.out.println();
//		}

		// 後台查詢未完成和已完成的檢舉
//		List<MaintenanceRecordVO> list = maintenanceRecordJDBCDAO.getAllSelected(0);
//		for (MaintenanceRecordVO a : list) {
//			System.out.print(a.getMaintenanceId() + ",");
//			System.out.print(a.getMemberId() + ",");
//			System.out.print(a.getMemberName() + ",");
//			System.out.print(a.getMaintenanceTime() + ",");
//			System.out.print(a.getMaintenanceContent() + ",");
//			System.out.print(a.getMaintenancePic() + ",");
//			System.out.print(a.getMaintenanceStatus() + ",");
//			System.out.print(a.getReplyOfMaintenance() + ",");
//			System.out.print(a.getReplyPic() + ",");
//			System.out.print(a.getReplyOfMaintenanceTime() + ",");
//			System.out.println();
//		}

			// 前台查詢個人未完成和已完成的檢舉
			List<MaintenanceRecordVO> list = maintenanceRecordJDBCDAO.memberGetAllSelected(1, "EreYea1");
			for (MaintenanceRecordVO a : list) {
				System.out.print(a.getMaintenanceId() + ",");
				System.out.print(a.getMemberId() + ",");
				System.out.print(a.getMemberName() + ",");
				System.out.print(a.getMaintenanceTime() + ",");
				System.out.print(a.getMaintenanceContent() + ",");
				System.out.print(a.getMaintenancePic() + ",");
				System.out.print(a.getMaintenanceStatus() + ",");
				System.out.print(a.getReplyOfMaintenance() + ",");
				System.out.print(a.getReplyPic() + ",");
				System.out.print(a.getReplyOfMaintenanceTime() + ",");
				System.out.println();
			}
			
	}

}

	

