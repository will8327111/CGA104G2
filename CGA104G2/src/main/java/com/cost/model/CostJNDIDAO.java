package com.cost.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CostJNDIDAO implements CostDAO_interface{
	private static DataSource ds = null;

	static{
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_COST = "INSERT INTO cost (COST_NAME,START_DATE,COST,ENABLE_STATUS,CREATE_USER) VALUES (?, ?, ?, ? ,?)";
	
	@Override
	public void insert(CostVO costVo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_COST);

			pstmt.setString(1, costVo.getCostName());	//費用名稱
			pstmt.setDate(2, costVo.getStartDate());	//開始日期
			pstmt.setInt(3, costVo.getCost());			//坪數費用
			pstmt.setInt(4, costVo.getEnableStatus());	//啟用狀態
			pstmt.setString(5, costVo.getCreateUser());	//新增人員

			pstmt.executeUpdate();

			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
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
}
