package com.ame.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AmeJDBCDAO implements AmeDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";
 
	private static final String INSERT_STMT =  //AME_IMG 圖片記得!
			"INSERT INTO AMENITIES (AME_NAME, AME_INTRODUCE, AME_POINT, AME_MAX, AME_OPENING) VALUES (?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
			"SELECT AME_ID, AME_NAME, AME_INTRODUCE, AME_POINT, AME_MAX, AME_OPENING FROM AMENITIES order by AME_ID";
	private static final String GET_SOME_STMT =
			"SELECT AME_ID, AME_NAME, AME_IMG, AME_INTRODUCE FROM AMENITIES where AME_ID = ?";
	private static final String DELETE =
			"DELETE FROM AMENITIES where AME_ID = ?";
	private static final String UPDATE =
			"UPDATE AMENITIES set AME_POINT=?, AME_MAX=?, AME_OPENING=? where AME_ID = ?";

	public Integer insert(AmeVO ameVO) {
		Connection con = null;
		PreparedStatement ps = null;
		Integer ameid = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps = con.prepareStatement(INSERT_STMT);

			ps.setInt(1, ameVO.getAmeId());
			ps.setString(1, ameVO.getAmeName());
			ps.setBytes(2, ameVO.getAmeImg());
			ps.setString(2, ameVO.getAmeIntroduce());
			ps.setInt(3, ameVO.getAmePoint());
			ps.setInt(4, ameVO.getAmeMax());
			ps.setString(5, ameVO.getAmeOpening());

			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
                ameid = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return ameid;
	}

	public Integer delete(Integer AME_ID) {
		Connection con = null;
		PreparedStatement ps = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps = con.prepareStatement(DELETE);

			ps.setInt(1, AME_ID);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		return AME_ID;
	}

	public void update(AmeVO ameVO) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps = con.prepareStatement(UPDATE);

			ps.setInt(1, ameVO.getAmePoint());
			ps.setInt(2, ameVO.getAmeMax());
			ps.setString(3, ameVO.getAmeOpening());
			ps.setInt(4, ameVO.getAmeId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public AmeVO findByPrimaryKey(Integer AME_ID) {

		AmeVO ameVO = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps = con.prepareStatement(GET_SOME_STMT);

			ps.setInt(1, AME_ID);

			rs = ps.executeQuery();

			while (rs.next()) {
				ameVO = new AmeVO();
				ameVO.setAmeId(rs.getInt("AME_ID"));
				ameVO.setAmeName(rs.getString("AME_NAME"));
				ameVO.setAmeImg(rs.getBytes("AME_IMG"));
				ameVO.setAmeIntroduce(rs.getString("AME_INTRODUCE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return ameVO;

	}

	public List<AmeVO> getAll() {

		List<AmeVO> list = new ArrayList<AmeVO>();
		AmeVO ameVO = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps = con.prepareStatement(GET_ALL_STMT);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				ameVO = new AmeVO();
				ameVO.setAmeId(rs.getInt("AME_ID"));
				ameVO.setAmeName(rs.getString("AME_NAME"));
				ameVO.setAmeImg(rs.getBytes("AME_IMG"));
				ameVO.setAmeIntroduce(rs.getString("AME_INTRODUCE"));
				ameVO.setAmePoint(rs.getInt("AME_POINT"));
				ameVO.setAmeMax(rs.getInt("AME_MAX"));
				ameVO.setAmeOpening(rs.getString("AME_OPENING"));

				list.add(ameVO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	public static void main(String[] args) {
		AmeJDBCDAO dao = new AmeJDBCDAO();
		
		//新
//		AmeVO ameVO1 = new AmeVO();
//		ameVO1.setAME_NAME("KTV");
////		ameVO1.setAME_IMG(null);  // 圖片部分 後修
//		ameVO1.setAME_INTRODUCE("test");
//		ameVO1.setAME_POINT(3);
//		ameVO1.setAME_MAX(1);
//		ameVO1.setAME_OPENING("000000000001111111000000");
//		dao.insert(ameVO1);
//		System.out.println(ameVO1);
		
		
		//修
//		AmeVO ameVO2 = new AmeVO();
//		ameVO2.setAME_POINT(1);
//		ameVO2.setAME_MAX(1);
//		ameVO2.setAME_OPENING("111111111111111111111111");
//		ameVO2.setAME_ID(2);   
//		dao.update(ameVO2);
		
		//刪
//		dao.delete(3); //括號內打ID
		
		//單查
//		AmeVO ameVO3 = dao.findByPrimaryKey(2);
//		System.out.print(ameVO3.getAME_ID() + ",");
//		System.out.print(ameVO3.getAME_NAME() + ",");
//		System.out.print(ameVO3.getAME_IMG() + ","); //圖片
//		System.out.print(ameVO3.getAME_INTRODUCE());
//		System.out.println("---------------------------------------");
		
		//全查
//		List<AmeVO> list = dao.getAll();
//		for(AmeVO amevo : list) {
//			System.out.print(amevo.getAME_ID() + ",");
//			System.out.print(amevo.getAME_NAME() + ",");
////			System.out.print(amevo.getAME_IMG() + ",");  //圖片 後修
//			System.out.print(amevo.getAME_INTRODUCE() + ",");
//			System.out.print(amevo.getAME_POINT() + ",");
//			System.out.print(amevo.getAME_MAX() + ",");
//			System.out.print(amevo.getAME_OPENING());
//			System.out.println();
//		}
		
	}

}
