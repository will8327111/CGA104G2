package com.privateReport1.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PrivateReportJDBCDAO1 implements PrivateReportDAO1_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei";
	String account = "root";
	String password = "password";

	private static final String FRONT_END_INSERT = "INSERT INTO PRIVATE_REPORT (MEMBER_ID,PRIVATE_REPORT_CONTENT,PRIVATE_REPORT_PIC,PRIVATE_REPORT_STATUS) VALUES(?, ?, ?, ?)";

	private static final String GET_INFO_BY_MEMBER_AC = "SELECT MEMBER_ID, MEMBER_AC FROM MEMBER WHERE MEMBER_AC = ?;";
	
	private static final String GET_BY_MEMBER_AC = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS,\r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MEMBER_AC = ?";

	private static final String GET_BY_MEMBER_AC_AND_REPORT_ID = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS,\r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n"
			+ "WHERE MEMBER_AC = ? AND PRIVATE_REPORT_ID = ?";

	private static final String UPDATE = "UPDATE PRIVATE_REPORT set REPLY_OF_REPORT = ?, REPLY_PIC = ?, PRIVATE_REPORT_STATUS = ?, REPLY_OF_REPORT_TIME=CURRENT_TIMESTAMP() where PRIVATE_REPORT_ID = ?";

	private static final String DELETE = "DELETE FROM PRIVATE_REPORT where PRIVATE_REPORT_ID = ?";

	private static final String GET_ONE_BY_MEMBERNAME = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS, \r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MEMBER_NAME = ?;";

	private static final String GET_ONE_BY_REPORTID = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS, \r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE PRIVATE_REPORT_ID = ?;";

	private static final String GET_BY_MEMBERNAME = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS, \r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE MEMBER_NAME = ?;";
	
	
	private static final String GET_ONE_BY_REPORTSTATUS = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS, \r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE PRIVATE_REPORT_STATUS = ?;";

	private static final String GET_ALL_STMT = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS, \r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "ORDER BY PRIVATE_REPORT_ID;";

	private static final String GET_ALL_SELECTED = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS, \r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE PRIVATE_REPORT_STATUS = ?;";

	private static final String MEMBER_GET_ALL_SELECTED = "SELECT PRIVATE_REPORT_ID, PR.MEMBER_ID, MEMBER_NAME, PRIVATE_REPORT_TIME,\r\n"
			+ "PRIVATE_REPORT_CONTENT, PRIVATE_REPORT_PIC, PRIVATE_REPORT_STATUS, \r\n"
			+ "REPLY_OF_REPORT, REPLY_PIC, REPLY_OF_REPORT_TIME FROM PRIVATE_REPORT PR\r\n"
			+ "JOIN MEMBER MB on PR.MEMBER_ID = MB.MEMBER_ID\r\n" + "WHERE PRIVATE_REPORT_STATUS = ? AND MEMBER_AC = ?;";
	
	@Override
	public void frontEndInsert(PrivateReportVO1 privateReportVO1) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(FRONT_END_INSERT);

			pstmt.setInt(1, privateReportVO1.getMemberId());
			pstmt.setString(2, privateReportVO1.getPrivateReportContent());
			pstmt.setBytes(3, privateReportVO1.getPrivateReportPic());
			pstmt.setInt(4, privateReportVO1.getPrivateReportStatus());

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
	public List<PrivateReportVO1> findByMemberName(String memberName) {
		List<PrivateReportVO1> list = new ArrayList<PrivateReportVO1>();
		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();

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
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
				list.add(privateReportVO1);
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
	public void update(PrivateReportVO1 privateReportVO1) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, privateReportVO1.getReplyOfReport());
			pstmt.setBytes(2, privateReportVO1.getReplyPic());
			pstmt.setInt(3, privateReportVO1.getPrivateReportStatus());
			pstmt.setInt(4, privateReportVO1.getPrivateReportId());
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
	public void delete(Integer privateReportId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, privateReportId);

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
	public PrivateReportVO1 findInfoByAc(String memberAc) {

		PrivateReportVO1 privateReportVO1 = null;
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
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberAc(rs.getString("member_ac"));
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
		return privateReportVO1;
	}
	
	@Override
	public PrivateReportVO1 findByReportIdAndAc(Integer privateReportId, String memberAc) {

		PrivateReportVO1 privateReportVO1 = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_BY_MEMBER_AC_AND_REPORT_ID);
			pstmt.setString(1, memberAc);
			pstmt.setInt(2, privateReportId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
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
		return privateReportVO1;
	}
	
	@Override
	public PrivateReportVO1 findByReportId(Integer privateReportId) {

		PrivateReportVO1 privateReportVO1 = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ONE_BY_REPORTID);
			pstmt.setInt(1, privateReportId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
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
		return privateReportVO1;
	}

	@Override
	public PrivateReportVO1 findMemberName(String memberName) {

		PrivateReportVO1 privateReportVO1 = null;
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
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
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
		return privateReportVO1;
	}
	
	@Override
	public PrivateReportVO1 findByReportStatus(Integer privateReportStatus) {

		PrivateReportVO1 privateReportVO1 = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ONE_BY_REPORTSTATUS);
			pstmt.setInt(1, privateReportStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
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
		return privateReportVO1;
	}

	@Override
	public List<PrivateReportVO1> findByMemberAc(String memberAc) {
		List<PrivateReportVO1> list = new ArrayList<PrivateReportVO1>();
		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();

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
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
				list.add(privateReportVO1);
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

	public List<PrivateReportVO1> getAllReport() {

		List<PrivateReportVO1> list = new ArrayList<PrivateReportVO1>();
		PrivateReportVO1 privateReportVO1 = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
				list.add(privateReportVO1);
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

	public List<PrivateReportVO1> getAllSelected(Integer privateReportStatus) {

		List<PrivateReportVO1> list = new ArrayList<PrivateReportVO1>();
		PrivateReportVO1 privateReportVO1 = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(GET_ALL_SELECTED);
			pstmt.setInt(1, privateReportStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
				list.add(privateReportVO1);
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

	public List<PrivateReportVO1> memberGetAllSelected(Integer privateReportStatus, String memberAc) {

		List<PrivateReportVO1> list = new ArrayList<PrivateReportVO1>();
		PrivateReportVO1 privateReportVO1 = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(MEMBER_GET_ALL_SELECTED);
			pstmt.setInt(1, privateReportStatus);
			pstmt.setString(2, memberAc);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				privateReportVO1 = new PrivateReportVO1();
				privateReportVO1.setPrivateReportId(rs.getInt("private_Report_id"));
				privateReportVO1.setMemberId(rs.getInt("member_id"));
				privateReportVO1.setMemberName(rs.getString("member_name"));
				privateReportVO1.setPrivateReportTime(rs.getTimestamp("private_report_time"));
				privateReportVO1.setPrivateReportContent(rs.getString("private_report_content"));
				privateReportVO1.setPrivateReportPic(rs.getBytes("private_report_pic"));
				privateReportVO1.setPrivateReportStatus(rs.getInt("private_report_Status"));
				privateReportVO1.setReplyOfReport(rs.getString("reply_of_report"));
				privateReportVO1.setReplyPic(rs.getBytes("reply_pic"));
				privateReportVO1.setReplyOfReportTime(rs.getTimestamp("reply_of_report_time"));
				list.add(privateReportVO1);
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

		PrivateReportJDBCDAO1 privateReportJDBCDAO1 = new PrivateReportJDBCDAO1();

		// 前台新增檢舉資料
//		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();
//		privateReportVO1.setMemberId(1);
//		privateReportVO1.setPrivateReportContent("外面地板都是尿欸!");
//		privateReportVO1.setPrivateReportPic(null);
//		privateReportVO1.setPrivateReportStatus(0);
//		privateReportJDBCDAO1.frontEndInsert(privateReportVO1);

		// 前台以會員帳號查詢
		PrivateReportVO1 privateReportVO1 = privateReportJDBCDAO1.findInfoByAc("EreYea1");
		System.out.print(privateReportVO1.getMemberId() + ",");
		System.out.print(privateReportVO1.getMemberAc() + ",");
		System.out.println();
		
		// 前台以會員帳號查詢個人檢舉
//		List<PrivateReportVO1> list = privateReportJDBCDAO1.findByMemberAc("EreYea1");
//		for (PrivateReportVO1 a : list) {
//			System.out.print(a.getPrivateReportId() + ",");
//			System.out.print(a.getMemberId() + ",");
//			System.out.print(a.getMemberName() + ",");
//			System.out.print(a.getPrivateReportTime() + ",");
//			System.out.print(a.getPrivateReportContent() + ",");
//			System.out.print(a.getPrivateReportPic() + ",");
//			System.out.print(a.getPrivateReportStatus() + ",");
//			System.out.print(a.getReplyOfReport() + ",");
//			System.out.print(a.getReplyPic() + ",");
//			System.out.print(a.getReplyOfReportTime() + ",");
//			System.out.println();
//		}

		// 前台以檢舉編號查詢個人檢舉
//		PrivateReportVO1 privateReportVO1 = privateReportJDBCDAO1.findByReportIdAndAc(1, "EreYea1");
//			System.out.print(privateReportVO1.getPrivateReportId() + ",");
//			System.out.print(privateReportVO1.getMemberId() + ",");
//			System.out.print(privateReportVO1.getMemberName() + ",");
//			System.out.print(privateReportVO1.getPrivateReportTime() + ",");
//			System.out.print(privateReportVO1.getPrivateReportContent() + ",");
//			System.out.print(privateReportVO1.getPrivateReportPic() + ",");
//			System.out.print(privateReportVO1.getPrivateReportStatus() + ",");
//			System.out.print(privateReportVO1.getReplyOfReport() + ",");
//			System.out.print(privateReportVO1.getReplyPic() + ",");
//			System.out.print(privateReportVO1.getReplyOfReportTime() + ",");
//			System.out.println();
		
		// 後台新增回覆內容
//		PrivateReportVO1 privateReportVO1 = new PrivateReportVO1();
//		privateReportVO1.setReplyOfReport("所以勒?");
//		privateReportVO1.setReplyPic(null);
//		privateReportVO1.setPrivateReportStatus(1);
//		privateReportVO1.setPrivateReportId(13);
//		privateReportVO1.setMemberId(1);
//		privateReportJDBCDAO1.update(privateReportVO1);

//		 前台刪除檢舉資料
//		privateReportJDBCDAO1.delete(30);

		// 以檢舉編號查詢個人檢舉
//		PrivateReportVO1 privateReportVO1 = privateReportJDBCDAO1.findByReportId(3);
//			System.out.print(privateReportVO1.getPrivateReportId() + ",");
//			System.out.print(privateReportVO1.getMemberId() + ",");
//			System.out.print(privateReportVO1.getMemberName() + ",");
//			System.out.print(privateReportVO1.getPrivateReportTime() + ",");
//			System.out.print(privateReportVO1.getPrivateReportContent() + ",");
//			System.out.print(privateReportVO1.getPrivateReportPic() + ",");
//			System.out.print(privateReportVO1.getPrivateReportStatus() + ",");
//			System.out.print(privateReportVO1.getReplyOfReport() + ",");
//			System.out.print(privateReportVO1.getReplyPic() + ",");
//			System.out.print(privateReportVO1.getReplyOfReportTime() + ",");
//			System.out.println();

		// 以會員名稱查詢個人檢舉
//		List<PrivateReportVO1> list = privateReportJDBCDAO1.findByMemberName("阿敏");
//		for (PrivateReportVO1 a : list) {
//			System.out.print(a.getPrivateReportId() + ",");
//			System.out.print(a.getMemberId() + ",");
//			System.out.print(a.getMemberName() + ",");
//			System.out.print(a.getPrivateReportTime() + ",");
//			System.out.print(a.getPrivateReportContent() + ",");
//			System.out.print(a.getPrivateReportPic() + ",");
//			System.out.print(a.getPrivateReportStatus() + ",");
//			System.out.print(a.getReplyOfReport() + ",");
//			System.out.print(a.getReplyPic() + ",");
//			System.out.print(a.getReplyOfReportTime() + ",");
//			System.out.println();
//		}

		// 以編號查詢個人檢舉
//			List<PrivateReportVO1> list = privateReportJDBCDAO1.findByMemberId(3);
//			for (PrivateReportVO1 a : list) {
//				System.out.print(a.getPrivateReportId() + ",");
//				System.out.print(a.getMemberId() + ",");
//				System.out.print(a.getMemberName() + ",");
//				System.out.print(a.getPrivateReportTime() + ",");
//				System.out.print(a.getPrivateReportContent() + ",");
//				System.out.print(a.getPrivateReportPic() + ",");
//				System.out.print(a.getPrivateReportStatus() + ",");
//				System.out.print(a.getReplyOfReport() + ",");
//				System.out.print(a.getReplyPic() + ",");
//				System.out.print(a.getReplyOfReportTime() + ",");
//				System.out.println();
//			}

		// 查詢全部人的檢舉
//		List<PrivateReportVO1> list = privateReportJDBCDAO1.getAllReport();
//		for (PrivateReportVO1 a : list) {
//			System.out.print(a.getPrivateReportId() + ",");
//			System.out.print(a.getMemberId() + ",");
//			System.out.print(a.getMemberName() + ",");
//			System.out.print(a.getPrivateReportTime() + ",");
//			System.out.print(a.getPrivateReportContent() + ",");
//			System.out.print(a.getPrivateReportPic() + ",");
//			System.out.print(a.getPrivateReportStatus() + ",");
//			System.out.print(a.getReplyOfReport() + ",");
//			System.out.print(a.getReplyPic() + ",");
//			System.out.print(a.getReplyOfReportTime() + ",");
//			System.out.println();
//		}

		// 後台查詢未完成和已完成的檢舉
//		List<PrivateReportVO1> list = privateReportJDBCDAO1.getAllSelected(0);
//		for (PrivateReportVO1 a : list) {
//			System.out.print(a.getPrivateReportId() + ",");
//			System.out.print(a.getMemberId() + ",");
//			System.out.print(a.getMemberName() + ",");
//			System.out.print(a.getPrivateReportTime() + ",");
//			System.out.print(a.getPrivateReportContent() + ",");
//			System.out.print(a.getPrivateReportPic() + ",");
//			System.out.print(a.getPrivateReportStatus() + ",");
//			System.out.print(a.getReplyOfReport() + ",");
//			System.out.print(a.getReplyPic() + ",");
//			System.out.print(a.getReplyOfReportTime() + ",");
//			System.out.println();
//		}

			// 前台查詢個人未完成和已完成的檢舉
//			List<PrivateReportVO1> list = privateReportJDBCDAO1.memberGetAllSelected(1, "EreYea1");
//			for (PrivateReportVO1 a : list) {
//				System.out.print(a.getPrivateReportId() + ",");
//				System.out.print(a.getMemberId() + ",");
//				System.out.print(a.getMemberName() + ",");
//				System.out.print(a.getPrivateReportTime() + ",");
//				System.out.print(a.getPrivateReportContent() + ",");
//				System.out.print(a.getPrivateReportPic() + ",");
//				System.out.print(a.getPrivateReportStatus() + ",");
//				System.out.print(a.getReplyOfReport() + ",");
//				System.out.print(a.getReplyPic() + ",");
//				System.out.print(a.getReplyOfReportTime() + ",");
//				System.out.println();
//			}
			
	}

}
