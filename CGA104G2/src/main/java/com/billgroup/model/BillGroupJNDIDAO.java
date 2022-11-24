
package com.billgroup.model;

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

public class BillGroupJNDIDAO implements BillGroupDAO_interface {
	private DataSource ds = null;

	private static final String GET_BILL_GROUP = "SELECT BILL_GROUP FROM BILLGROUP where MEMBER_ID=?";

	public BillGroupJNDIDAO() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public String getBillGroup(Integer memberId) {

		try (Connection con = ds.getConnection(); PreparedStatement pstmt = con.prepareStatement(GET_BILL_GROUP);

		) {

			pstmt.setInt(1, memberId);

			ResultSet rs = pstmt.executeQuery();
			String billGroup = null;
			if (rs.next()) {
				billGroup = rs.getString(1);

			}
			return billGroup;

		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}
	
	}
}
