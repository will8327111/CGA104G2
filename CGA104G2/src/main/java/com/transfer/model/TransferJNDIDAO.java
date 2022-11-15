package com.transfer.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TransferJNDIDAO implements TransferDAO_interface {
	private DataSource ds = null;

	public TransferJNDIDAO() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_TRANSFER = "INSERT INTO TRANSFER(Bill_Group,BANK_ID,BANK_NUMBER,member_Id) values(?, ?, ?,?)";// 住戶新增匯款資料進去資料

	public void insert(TransferVO transferVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql:///db01", "root", "password");
			pstmt = con.prepareStatement(INSERT_TRANSFER);

			pstmt.setString(1, transferVO.getBillGroup());
			pstmt.setString(2, transferVO.getBankId());
			pstmt.setInt(3, transferVO.getBankNumber());
			pstmt.setInt(4, transferVO.getMemberId());
			pstmt.executeUpdate();

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

	@SuppressWarnings("unused")
	@Override
	public List<TransferVO> getAll(String billDate) {// 後台帳單Table用月份、繳費方式查詢
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(
						"SELECT m.cost_Id,m.member_pay_method,t.transfer_Id,t.member_Bill_Id,t.member_Id,t.bank_Id,t.bank_Number,t.bank_Date,m.bill_Date,m.member_Pay,m.member_Photo \r\n"
								+ "from TRANSFER t \r\n" + "join MEMBER_BILL m \r\n"
								+ "on m.MEMBER_BILL_ID=t.MEMBER_BILL_ID \r\n"
								+ "where bill_date=?and member_pay_method=0")) {
			ps.setString(1, billDate);
			try (ResultSet rs = ps.executeQuery()) {
				List<TransferVO> list = new ArrayList<TransferVO>();
				while (rs.next()) {
					TransferVO vo = new TransferVO();
					vo.setMemberPay(rs.getString("MEMBER_PAY"));
					vo.setTransferId(rs.getInt("TRANSFER_ID"));
					vo.setMemberBillId(rs.getInt("MEMBER_BILL_ID"));
					vo.setBankId(rs.getString("BANK_ID"));
					vo.setBankNumber(rs.getInt("BANK_NUMBER"));
					vo.setBankDate(rs.getTimestamp("BANK_DATE"));
					vo.setMemberId(rs.getInt("MEMBER_ID"));
					vo.setBillDate(rs.getString("BILL_DATE"));
					vo.setCostId(rs.getInt("COST_ID"));

					var memberPayMethod = rs.getInt("MEMBER_PAY_METHOD");
					if (rs.getInt("MEMBER_PAY_METHOD") == 0) {
						vo.setMemberPayMethod("匯款");
					} else if (rs.getInt("MEMBER_PAY_METHOD") == 1) {
						vo.setMemberPayMethod("刷卡");
					} else {
						vo.setMemberPayMethod("尚未繳費");
					}
					vo.setMemberPhoto(rs.getBytes("MEMBER_PHOTO"));
					list.add(vo);
				}
				
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	
	}

	public List<String> getOneBillDate() {// 查詢出帳單內有的繳費月份(不重複)，目的:將Table有的月份放進下拉選單查詢
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement("select distinct bill_Date from member_bill")) {
//			ps.setString(1, billDate);

			try (ResultSet rs = ps.executeQuery()) {
				List<String> list = new ArrayList<String>();
				while (rs.next()) {
					list.add(rs.getString("BILL_DATE"));
					Collections.sort(list);// 排序日期
				}
				return list;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
