package com.bank.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BankJNDIDAO implements BankDAO_interface {
	private static final String GET_BANK = "SELECT * FROM BANK";

	private DataSource ds;

	public BankJNDIDAO() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BankVO> getAll() {
		List<BankVO> list = new ArrayList<BankVO>();
		BankVO bankVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;// 集合查詢返回的對象

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BANK);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bankVO = new BankVO();
				bankVO.setBankId(rs.getString("BANK_ID"));
				bankVO.setBankName(rs.getString("BANK_NAME"));
				list.add(bankVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
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
}
