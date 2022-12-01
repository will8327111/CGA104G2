package com.card.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.memberbill.model.MemberBillVO;
import com.transfer.model.TransferVO;

public class CardJNDIDAO implements CardDAO_interface {
	private DataSource ds = null;
	private static final String INSERT= "INSERT INTO CARD(BILL_GROUP,MEMBER_ID,MEMBER_BILL_ID)VALUES(?,?,?)";
	private static final String UPDATE_CARD = "UPDATE MEMBER_BILL SET MEMBER_PAY=1,MEMBER_PAY_METHOD=2 WHERE MEMBER_BILL_ID = ?";//修改狀態(給綠界用)
	
	public CardJNDIDAO() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<CardVO> getAllCard(String billDate) {// 後台帳單Table用月份、繳費方式查詢刷卡有誰
		
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(
						"SELECT c.MEMBER_ID, m.MEMBER_NAME, c.MEMBER_PAY, c.PAY_DATE, c.BILL_GROUP, m.BILL_DATE from CARD c join MEMBER_BILL m on m.MEMBER_ID=c.MEMBER_ID where BILL_DATE=? ")) {
			
			ps.setString(1, billDate);
			
			try (ResultSet rs = ps.executeQuery()) {
				List<CardVO> list = new ArrayList<CardVO>();
				while (rs.next()) {
					CardVO vo = new CardVO();

					vo.setMemberId(rs.getInt("MEMBER_ID"));
					vo.setMemberName(rs.getString("MEMBER_NAME"));
					vo.setMemberPay(rs.getInt("MEMBER_PAY"));
					vo.setPayDate(rs.getTimestamp("PAY_DATE"));
					vo.setBillGroup(rs.getString("BILL_GROUP"));
					vo.setBillDate(rs.getString("BILL_DATE"));
					System.out.println(rs.getInt("MEMBER_PAY"));
					

					list.add(vo);
				}
				
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	
	}
	

	public void insert(CardVO cardVO) {
		try (
			Connection con = ds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(INSERT);
		) {
			pstmt.setString(1, cardVO.getBillGroup());
			pstmt.setInt(2, cardVO.getMemberId());
			pstmt.setInt(3, cardVO.getMemberBillId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public CardVO updateCard(Integer memberBillId) {
		CardVO cardVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_CARD);
			pstmt.setInt(1, memberBillId);

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
		return cardVO;

	}
}
