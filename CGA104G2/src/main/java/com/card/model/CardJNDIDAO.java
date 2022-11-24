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

import com.transfer.model.TransferVO;

public class CardJNDIDAO implements CardDAO_interface {
	private DataSource ds = null;
	private static final String INSERT= "INSERT INTO CARD(BILL_GROUP,MEMBER_ID)VALUES(?,?)";
	
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
						"SELECT"
						+ "m.MEMBER_PAY_METHOD,c.MEMBER_ID,m.MEMBER_PAY,m.BILL_DATE,c.PAYMENT_MAIL,c.PAY_DATE"
						+ "from CARD c "
						+ " join MEMBER_BILL m"
						+ "  on m.MEMBER_ID=c.MEMBER_ID"
						+ "   where BILL_DATE=? and MEMBER_PAY_METHOD=1 ")) {
			
			ps.setString(1, billDate);
			
			try (ResultSet rs = ps.executeQuery()) {
				List<CardVO> list = new ArrayList<CardVO>();
				while (rs.next()) {
					CardVO vo = new CardVO();

					vo.setPayDate(rs.getTimestamp("PAY_DATE"));
					vo.setMemberId(rs.getInt("MEMBER_ID"));

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
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
