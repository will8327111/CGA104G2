package com.memberLogin.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberLoginJDBCDAO implements MemberLoginDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei";
	String account = "root";
	String password = "password";

	private static final String SHOW_INFO = "select * from MEMBER where MEMBER_AC = ? and MEMBER_PW = ?";

	public MemberLoginVO findByAcAndPwd(String memberAc, String memberPw) {
		MemberLoginVO memberLoginVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, account, password);
			pstmt = con.prepareStatement(SHOW_INFO);
			pstmt.setString(1, memberAc);
			pstmt.setString(2, memberPw);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberLoginVO = new MemberLoginVO();
				memberLoginVO.setMemberId(rs.getInt("member_id"));
				memberLoginVO.setMemberAc(rs.getString("member_ac"));
				memberLoginVO.setMemberPw(rs.getString("member_pw"));
				memberLoginVO.setMemberName(rs.getString("member_name"));
				memberLoginVO.setMemberNickname(rs.getString("member_nickname"));
				memberLoginVO.setMemberSex(rs.getString("member_sex"));
				memberLoginVO.setMemberBuilding(rs.getString("member_building"));
				memberLoginVO.setMemberEmail(rs.getString("member_email"));
				memberLoginVO.setMemberMobile(rs.getString("member_mobile"));
				memberLoginVO.setMemberTel(rs.getString("member_tel"));
				memberLoginVO.setMemberPost(rs.getString("member_post"));
				memberLoginVO.setMemberAddress(rs.getString("member_address"));
				memberLoginVO.setMemberPoints(rs.getInt("member_points"));
//				memberLoginVO.setMemberPic(rs.getByte("member_pic"));
				memberLoginVO.setRegDate(rs.getDate("reg_date"));
				memberLoginVO.setMemberIdState(rs.getShort("member_id_state"));
				memberLoginVO.setAcState(rs.getShort("ac_state"));
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
		return memberLoginVO;
	};
	
	// Main方法測試
	public static void main(String[] args) {
		
		MemberLoginJDBCDAO jdbcDao = new MemberLoginJDBCDAO();
		MemberLoginVO test = jdbcDao.findByAcAndPwd("ArmiAlert2", "A8351103A");
		
			System.out.print(test.getMemberId() + ",");
			System.out.print(test.getMemberAc() + ",");
			System.out.print(test.getMemberPw() + ",");
			System.out.print(test.getMemberName() + ",");
			System.out.print(test.getMemberNickname() + ",");
			System.out.print(test.getMemberSex() + ",");
			System.out.print(test.getMemberBuilding() + ",");
			System.out.print(test.getMemberEmail() + ",");
			System.out.print(test.getMemberMobile() + ",");
			System.out.print(test.getMemberTel() + ",");
			System.out.print(test.getMemberPost() + ",");
			System.out.print(test.getMemberAddress() + ",");
			System.out.print(test.getMemberPoints() + ",");
			System.out.print(test.getMemberPic() + ",");
			System.out.print(test.getRegDate() + ",");
			System.out.print(test.getMemberIdState() + ",");
			System.out.print(test.getAcState());
		}
	}


