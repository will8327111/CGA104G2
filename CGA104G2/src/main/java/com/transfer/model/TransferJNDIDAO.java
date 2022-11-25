package com.transfer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.memberbill.model.MemberBillVO;

public class TransferJNDIDAO implements TransferDAO_interface {
	private DataSource ds = null;

	public TransferJNDIDAO() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_TRANSFER = "INSERT INTO TRANSFER(MEMBER_BILL_ID, BILL_DATE, BANK_ID, BANK_NUMBER, MEMBER_ID, MEMBER_PHOTO, MEMBER_PAY_METHOD) values(?, ?, ?, ?, ? ,?, ?)";// 住戶新增匯款資料進去資料
	private static final String BillDate = null;

	public void insert(TransferVO transferVO) {
		try (
			Connection con = ds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(INSERT_TRANSFER);
		) {
			pstmt.setInt(1, transferVO.getMemberBillId());
			pstmt.setString(2, transferVO.getBillDate());
			pstmt.setString(3, transferVO.getBankId());
			pstmt.setInt(4, transferVO.getBankNumber());
			pstmt.setInt(5, transferVO.getMemberId());
			pstmt.setBytes(6, transferVO.getMemberPhoto());
			pstmt.setInt(7, transferVO.getMemberPayMethod());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<TransferVO> getAll(String billDate) {// 後台帳單Table用月份、繳費方式查詢
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(
						"SELECT "
						+ "m.member_bill_Id,"
						+ "t.member_Id,"
						+ "m.MEMBER_NAME,"
						+ "t.bank_Id,"
						+ "t.bank_Number,"
						+ "t.bank_Date,"
						+ "m.bill_Date,"
						+ "m.member_Pay,"
						+ "m.member_Photo "
						+ "from TRANSFER t join MEMBER_BILL m "
						+ "on m.MEMBER_BILL_ID=t.MEMBER_BILL_ID "
						+ "where t.bill_date = ? and t.member_pay_method = 0;")) {
			ps.setString(1, billDate);
			try (ResultSet rs = ps.executeQuery()) {
				List<TransferVO> list = new ArrayList<TransferVO>();
				while (rs.next()) {
					TransferVO vo = new TransferVO();
					vo.setMemberBillId(rs.getInt("MEMBER_BILL_ID"));
					vo.setMemberPay(rs.getString("MEMBER_PAY"));
					vo.setBankId(rs.getString("BANK_ID"));
					vo.setBankNumber(rs.getInt("BANK_NUMBER"));
					vo.setBankDate(rs.getTimestamp("BANK_DATE"));
					vo.setMemberId(rs.getInt("MEMBER_ID"));
					vo.setBillDate(rs.getString("BILL_DATE"));
					vo.setMemberName(rs.getString("MEMBER_NAME"));
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
	
	@Override
	public List<TransferVO> getMemberPay(String memberPay,String billDate) {
		List<TransferVO> list = new ArrayList<TransferVO>();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("SELECT "
								+ "m.member_bill_Id,"
								+ "m.MEMBER_ID, "
								+ "m.MEMBER_NAME, "
								+ "t.BANK_ID, "
								+ "t.BANK_NUMBER,"
								+ "t.bank_Date,"
								+ "m.BILL_DATE, "
								+ "m.MEMBER_PAY, "
								+ "m.MEMBER_PHOTO "
								+ "from TRANSFER t "
								+ "join MEMBER_BILL m on m.MEMBER_BILL_ID=t.MEMBER_BILL_ID  "
								+ "where t.bill_date = ? and m.member_pay = ?; ");// 匯款查詢頁面上方的下拉選單
		) {
			pstmt.setString(1,billDate);
			pstmt.setString(2,memberPay);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {//next意思是還有下一筆資料嗎?  有~就執行以下
				TransferVO vo=new TransferVO();
				vo.setMemberBillId(rs.getInt("MEMBER_BILL_ID"));
				vo.setMemberId(rs.getInt("MEMBER_ID"));
				vo.setMemberName(rs.getString("MEMBER_NAME"));
				vo.setBankId(rs.getString("BANK_ID"));
				vo.setBankNumber(rs.getInt("BANK_NUMBER"));
				vo.setBankDate(rs.getTimestamp("BANK_DATE"));
				vo.setBillDate(rs.getString("BILL_DATE"));
				vo.setMemberPay(rs.getString("MEMBER_PAY"));
				vo.setMemberPhoto(rs.getBytes("MEMBER_PHOTO"));
				
				list.add(vo);
			}
				return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		 }
	}
}
