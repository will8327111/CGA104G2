package com.memberbill.model;

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

public class MemberBillJDBCDAO implements MemberBillDAO_interface {
	private static final String INSERT_MEMBER_BILL_ID = "INSERT INTO MEMBER_BILL(MEMBER_ID,COST_ID,MEMBER_NAME,BILL_AMOUNT,BILL_DATE,MEMBER_PAY,MEMBER_PAY_DATE,MEMBER_PAY_LIMIT,MEMBER_PAY_METHOD,MODIFY_USER,MODIFY_DATE)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ONE_MEMBER_BILL_ID = "SELECT * FROM MEMBER_BILL";
	private static final String UPDATE = "UPDATE MEMBER_BILL SET MEMBER_PAY=? WHERE MEMBER_BILL_ID = ?";//修改狀態
	private static final String MEMBER_PHOTO = "SELECT MEMBER_PHOTO FROM MEMBER_BILL  WHERE MEMBER_BILL_ID = ?";
	private static final String GET_BILL_DATE = "SELECT distinct BILL_DATE,MEMBER_BILL_ID FROM MEMBER_BILL WHERE MEMBER_ID= ? and MEMBER_PAY=0"; // 拿住戶本月未繳費的日期(重複月份不出現);0為未繳費
	private static final String UPDATE_memberPay = "UPDATE  MEMBER_BILL SET MEMBER_PAY=2 WHERE MEMBER_BILL_ID=?";// 把這個function放進insert裡面先new放進值在一起跑更改狀態為待審核

	private DataSource ds;

	public MemberBillJDBCDAO() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public void insert(MemberBillVO memberBillVO) {
		Connection con = null;// 連接
		PreparedStatement pstmt = null;// 用方法取得物件

		try {
			con = DriverManager.getConnection("jdbc:mysql:///db01", "root", "password");
			pstmt = con.prepareStatement(INSERT_MEMBER_BILL_ID);

			pstmt.setInt(1, memberBillVO.getMemberId());
			pstmt.setInt(2, memberBillVO.getCostId());
			pstmt.setString(3, memberBillVO.getMemberName());
			pstmt.setString(4, memberBillVO.getBillAmount());
			pstmt.setString(5, memberBillVO.getBillDate());
			pstmt.setString(6, memberBillVO.getMemberPay());
			pstmt.setDate(7, memberBillVO.getMemberPayDate());
			pstmt.setDate(8, memberBillVO.getMemberPayLimit());
			pstmt.setString(9, memberBillVO.getMemberPayMethod());
			pstmt.setString(10, memberBillVO.getModifyUser());
			pstmt.setDate(11, memberBillVO.getModifyDate());
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} 
		finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);// 程序中出錯的位置//System.err輸出到控制台
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
	public List<MemberBillVO> getAll() {
		List<MemberBillVO> list = new ArrayList<MemberBillVO>();
		MemberBillVO MemberBillVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;// 集合查詢返回的對象

		try {
			con = DriverManager.getConnection("jdbc:mysql:///db01", "root", "password");
			pstmt = con.prepareStatement(GET_ONE_MEMBER_BILL_ID);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				MemberBillVO = new MemberBillVO();// 新增一個VO物件
				MemberBillVO.setMemberBillId(rs.getInt("MEMBER_BILL_ID"));
				MemberBillVO.setMemberId(rs.getInt("MEMBER_ID"));
				MemberBillVO.setCostId(rs.getInt("COST_ID"));
				MemberBillVO.setMemberName(rs.getString("MEMBER_NAME"));
				MemberBillVO.setBillAmount(rs.getString("BILL_AMOUNT"));
				MemberBillVO.setBillDate(rs.getString("BILL_DATE"));
				if (rs.getString("MEMBER_PAY") == "0") {

					MemberBillVO.setMemberPay("未繳費");
				} else if (rs.getString("MEMBER_PAY") == "1") {

					MemberBillVO.setMemberPay("已繳費");
				} else {
					MemberBillVO.setMemberPay("待審核");
				}

				MemberBillVO.setMemberPayDate(rs.getDate("MEMBER_PAY_DATE"));
				MemberBillVO.setMemberPayLimit(rs.getDate("MEMBER_PAY_LIMIT"));
//				MemberBillVO.setMemberPayMethod(rs.getInt("MEMBER_PAY_METHOD") == 0 ? "匯款" : "刷卡");
				if(rs.getInt("MEMBER_PAY_METHOD")==0) {
					MemberBillVO.setMemberPayMethod("匯款");
				}else if (rs.getInt("MEMBER_PAY_METHOD")==1) {
					MemberBillVO.setMemberPayMethod("刷卡");
				}else{
					MemberBillVO.setMemberPayMethod("尚未繳費");
				}
				MemberBillVO.setModifyUser(rs.getString("MODIFY_USER"));
				MemberBillVO.setModifyDate(rs.getDate("MODIFY_DATE"));
//				Member_billVO.setMember_photo(rs.getByte("MEMBER_PHOTO"));

				list.add(MemberBillVO);
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

	public static void main(String[] args) {

		MemberBillJDBCDAO dao = new MemberBillJDBCDAO();

		MemberBillVO Member_bill = new MemberBillVO();

		Member_bill.setMemberId(10);
		Member_bill.setCostId(1);
		Member_bill.setMemberName("柚子");
		Member_bill.setBillAmount("3000");
		Member_bill.setBillDate("2022-10");
		Member_bill.setMemberPay("0");
		Member_bill.setMemberPayDate(java.sql.Date.valueOf("2022-10-20"));
		Member_bill.setMemberPayLimit(java.sql.Date.valueOf("2022-10-16"));
		Member_bill.setMemberPayMethod(null);
		Member_bill.setModifyUser("PG");
		Member_bill.setModifyDate(java.sql.Date.valueOf("2022-10-16"));
		Member_bill.setMemberPhoto(null);

		dao.insert(Member_bill);

		List<MemberBillVO> list = dao.getAll();
		for (MemberBillVO mem : list) {
			System.out.print(mem.getMemberBillId() + ",");
			System.out.print(mem.getMemberId() + ",");
			System.out.print(mem.getCostId() + ",");
			System.out.print(mem.getMemberName() + ",");
			System.out.print(mem.getBillAmount() + ",");
			System.out.print(mem.getBillDate() + ",");
			System.out.print(mem.getMemberPay() + ",");
			System.out.print(mem.getMemberPayDate() + ",");
			System.out.print(mem.getMemberPayLimit() + ",");
			System.out.print(mem.getMemberPayMethod() + ",");
			System.out.print(mem.getModifyUser() + ",");
			System.out.print(mem.getModifyDate() + ",");
			System.out.print(mem.getMemberPhoto() + ",");

			System.out.println();

		}
	}

	@Override
	public void update(MemberBillVO MemberBillVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, MemberBillVO.getMemberBillId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());

		} finally {
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
	}

	@Override
	public void updatePhoto(MemberBillVO vo) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE MEMBER_BILL SET MEMBER_PHOTO= ? WHERE MEMBER_BILL_ID = ?");// PreparedStatement查詢資料庫
		) {
			pstmt.setBytes(1, vo.getMemberPhoto());
			pstmt.setInt(2, vo.getMemberBillId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public byte[] getPhoto(Integer memberId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		byte[] photo = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(MEMBER_PHOTO);
			pstmt.setInt(1, memberId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				photo = rs.getBytes("MEMBER_PHOTO");
			}
			return photo;
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
	}

	@Override
	public List<MemberBillVO> getUnpaid(Integer memberId) {
		List<MemberBillVO> list = new ArrayList<MemberBillVO>();
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn
						.prepareStatement("select * from MEMBER_BILL where MEMBER_ID=? and MEMBER_PAY=0;")) {//查詢繳費狀態為未繳費
			ps.setInt(1, memberId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				MemberBillVO member_bill = new MemberBillVO();
				member_bill.setMemberBillId(rs.getInt("MEMBER_BILL_ID"));
				member_bill.setMemberId(rs.getInt("MEMBER_ID"));
				member_bill.setMemberPay(rs.getString("MEMBER_PAY"));
				member_bill.setBillDate(rs.getString("BILL_DATE"));
				list.add(member_bill);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return list;
	}

	@Override
	public void updatePay(Integer memberPay) {

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("update MEMBER_BILL set MEMBER_PAY=3 where MEMBER_ID = ?");// PreparedStatement查詢資料庫
		) {
			MemberBillVO memberBillVO = new MemberBillVO();
			pstmt.setInt(1, memberBillVO.getMemberId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<MemberBillVO> getBillDate(Integer memberId) {// 從資料庫拿出住戶「未繳費」的「帳單月份」
		try (										   		//用<String>裝接下來會新增的字串(帳單月份)
			Connection con = DriverManager.getConnection("jdbc:mysql:///db01", "root", "password");
			PreparedStatement pstmt = con.prepareStatement(GET_BILL_DATE);
		) {
			pstmt.setInt(1, memberId);
			try (ResultSet rs = pstmt.executeQuery()) {
				List<MemberBillVO> list = new ArrayList<MemberBillVO>();
				while (rs.next()) {
					MemberBillVO MemberBillVO = null;
					MemberBillVO = new MemberBillVO();// 新增一個VO物件
					MemberBillVO.setBillDate(rs.getString("BILL_DATE"));
					MemberBillVO.setMemberBillId(rs.getInt("MEMBER_BILL_ID"));
					list.add(MemberBillVO);
				}
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public MemberBillVO updateMemberPay(Integer memberBillId) {// 繳費狀態因不同需求需更改
		MemberBillVO vo1 = null;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_memberPay);
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
		return vo1;

	}


}
