//package com.mail.model;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//
//public class MailJDBCDAO implements MailDAO_interface{
//	String driver = "com.mysql.cj.jdbc.Driver";
//	String url = "jdbc:mysql://localhost:3306/Community_Management?serverTimezone=Asia/Taipei";
//	String userid = "root";
//	String passwd = "password";
//	
//	private static final String INSERT_MAIL = "insert into Mail (MEMBER_ID,MAIL_TYPE,MAIL_DEL_TIME) values(?,?,?)";
//	private static final String GET_ALL_MAIL = "select * from Mail";
//	private static final String GET_ONE_MAIL ="select MEMBER_ID,MAIL_ID,MAIL_TYPE,MAIL_DEL_TIME,MAIL_STATE from MAIL where MAIL_ID = ?";
//	private static final String GET_ID="select MEMBER_ID from MEMBER where MEMBER_NAME =?";
//	
//	private static final String DELETE = "delect from MAIL where member_Id = ?";
//	private static final String UPDATE = "update MAIL set MEMBER_ID = ?,MAIL_TYPE = ?,MAIL_DEL_TIME = ?, MAIL_PICKUP_TIME = ?, MAIL_STATE = ? where MAIL_ID = ?";
//	
////	private static final String GET_PHOTO = "select PHOTO from MAIL where MEMBER_ID = ?";
//	@Override
//	public void insert(MailVO mailVO) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(INSERT_MAIL);
//
//			pstmt.setInt(1, mailVO.getMemberId());
//			pstmt.setString(2, mailVO.getMailType());
//			pstmt.setDate(3, mailVO.getMailDelTime());
////			pstmt.setBytes(4, mailVO.getPhoto());
//			pstmt.executeUpdate();
//			
//			
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//	}
//
//	@Override
//	public void update(MailVO mailVO) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(UPDATE);
//			
//			
//			pstmt.setInt(1, mailVO.getMemberId());
//			pstmt.setString(2, mailVO.getMailType());
//			pstmt.setDate(3, mailVO.getMailDelTime());
//			pstmt.setDate(4, mailVO.getMailPickupTime());
//			pstmt.setInt(5, mailVO.getMailState());
//			pstmt.setInt(6, mailVO.getMailId());
//			
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		
//	}
////	public static void main(String[] args) {
////		MailJDBCDAO dao = new MailJDBCDAO();
////		MailVO mailVO = new MailVO();
////		mailVO.setMember_Id(2);
////		mailVO.setMail_type("�l��");
////		dao.insert(mailVO);
////	}
//	@Override
//	public void delete(Integer member_Id) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(DELETE);
//
//			pstmt.setInt(1, member_Id);
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//	}
//
//	@Override
//	public MailVO findByPrimaryKey(Integer mailId) {
//		MailVO mailVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ONE_MAIL);
//
//			pstmt.setInt(1, mailId);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				mailVO = new MailVO();
//				mailVO.setMailId(rs.getInt("mail_id"));
//				mailVO.setMemberId(rs.getInt("member_id"));
//				mailVO.setMailType(rs.getString("mail_type"));
//				mailVO.setMailDelTime(rs.getDate("mail_del_time"));
//				mailVO.setMailState(rs.getInt("mail_state"));
//
//			}
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return mailVO;
//	}
//	
//	@Override
//	public MailVO findByMemberName(String member_name) {
//		MailVO mailVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ID);
//
//			pstmt.setString(1, member_name);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				mailVO = new MailVO();
//				mailVO.setMemberName(member_name);
//				mailVO.setMemberId(rs.getInt("member_Id"));
//			}
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return mailVO;
//	}
//
//	@Override
//	public List<MailVO> getAll() {
//		List<MailVO> list = new ArrayList<MailVO>();
//		MailVO mailVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ALL_MAIL);
//			rs = pstmt.executeQuery();
//			
//			while (rs.next()) {				
//				mailVO = new MailVO();
//				mailVO.setMailId(rs.getInt("mail_Id"));
//				mailVO.setMemberId(rs.getInt("member_Id"));
//				mailVO.setMailType(rs.getString("mail_type"));
//				mailVO.setMailDelTime(rs.getDate("mail_del_time"));
//				mailVO.setMailPickupTime(rs.getDate("mail_pickup_time"));
//				mailVO.setMailState(rs.getInt("mail_state"));
////				mailVO.setPhoto(rs.getBytes("photo"));
//				list.add(mailVO); // Store the row in the list
//			}
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return list;
//	}
//	
//	public byte[] getPhoto(Integer member_Id) {
//		byte[] photo = null;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_PHOTO);
//			pstmt.setInt(1, member_Id);
//			rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				photo = rs.getBytes("PHOTO");
//			}
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return photo;
//	}
//}
