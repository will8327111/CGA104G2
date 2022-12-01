package com.member.model;

import java.util.*;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO implements MemberDAO_interface {

    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Community");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    //新增
    private static final String INSERT_STMT =
            "INSERT INTO MEMBER (MEMBER_AC,MEMBER_PW,MEMBER_NAME,MEMBER_NICKNAME,MEMBER_SEX,MEMBER_BUILDING," +
                    "MEMBER_EMAIL,MEMBER_MOBILE,MEMBER_TEL,MEMBER_POST,MEMBER_ADDRESS," +
                    "MEMBER_POINTS, MEMBER_PIC,REG_DATE,MEMBER_ID_STATE,AC_STATE)" +
                    "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    //查詢全部
    private static final String GET_ALL_STMT =
            "SELECT MEMBER_ID,MEMBER_AC,MEMBER_PW,MEMBER_NAME,MEMBER_NICKNAME,MEMBER_SEX,MEMBER_BUILDING," +
                    "MEMBER_EMAIL,MEMBER_MOBILE,MEMBER_TEL,MEMBER_POST,MEMBER_ADDRESS," +
                    "MEMBER_POINTS,MEMBER_PIC,REG_DATE,MEMBER_ID_STATE,AC_STATE " +
                    "from MEMBER order by MEMBER_ID";
    //查詢單一
    private static final String GET_ONE_STMT =
            "SELECT MEMBER_ID,MEMBER_AC,MEMBER_PW,MEMBER_NAME,MEMBER_NICKNAME,MEMBER_SEX,MEMBER_BUILDING,MEMBER_EMAIL," +
                    "MEMBER_MOBILE,MEMBER_TEL,MEMBER_POST,MEMBER_ADDRESS,MEMBER_POINTS,MEMBER_PIC,REG_DATE,MEMBER_ID_STATE,AC_STATE " +
                    "from MEMBER where MEMBER_ID = ?";
    //刪除
    private static final String DELETE =
            "DELETE from MEMBER where MEMBER_ID=?";
    //修改
    private static final String UPDATE =
            "UPDATE MEMBER set MEMBER_AC=?, MEMBER_PW=? ,MEMBER_NAME=? ,MEMBER_NICKNAME=? ,MEMBER_SEX=? ," +
                    "MEMBER_BUILDING=?,MEMBER_EMAIL=? ,MEMBER_MOBILE=? ,MEMBER_TEL=? ,MEMBER_POST=? ," +
                    "MEMBER_ADDRESS=? , MEMBER_POINTS=?,MEMBER_PIC=? ,REG_DATE=? ,MEMBER_ID_STATE=? ,AC_STATE=? where MEMBER_ID = ?";

    //新增
    @Override
    public void insert(MemberVO memberVO) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1, memberVO.getMemberAc());
            pstmt.setString(2, memberVO.getMemberPw());
            pstmt.setString(3, memberVO.getMemberName());
            pstmt.setString(4, memberVO.getMemberNickname());
            pstmt.setString(5, memberVO.getMemberSex());
            pstmt.setString(6, memberVO.getMemberBuilding());
            pstmt.setString(7, memberVO.getMemberEmail());
            pstmt.setString(8, memberVO.getMemberMobile());
            pstmt.setString(9, memberVO.getMemberTel());
            pstmt.setString(10, memberVO.getMemberPost());
            pstmt.setString(11, memberVO.getMemberAddress());
            pstmt.setInt(12, memberVO.getMemberPoints());
            pstmt.setBytes(13, memberVO.getMemberPic());
            pstmt.setDate(14, memberVO.getRegDate());
            pstmt.setInt(15, memberVO.getMemberIdState());
            pstmt.setInt(16, memberVO.getAcState());

            pstmt.executeUpdate();

        } catch (SQLException se) {
            se.printStackTrace(System.err);
        } finally { //關連線
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
    //修改
    @Override
    public void update(MemberVO memberVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, memberVO.getMemberAc());
            pstmt.setString(2, memberVO.getMemberPw());
            pstmt.setString(3, memberVO.getMemberName());
            pstmt.setString(4, memberVO.getMemberNickname());
            pstmt.setString(5, memberVO.getMemberSex());
            pstmt.setString(6, memberVO.getMemberBuilding());
            pstmt.setString(7, memberVO.getMemberEmail());
            pstmt.setString(8, memberVO.getMemberMobile());
            pstmt.setString(9, memberVO.getMemberTel());
            pstmt.setString(10, memberVO.getMemberPost());
            pstmt.setString(11, memberVO.getMemberAddress());
            pstmt.setInt(12, memberVO.getMemberPoints());
            pstmt.setBytes(13,memberVO.getMemberPic());
            pstmt.setDate(14, memberVO.getRegDate());
            pstmt.setInt(15, memberVO.getMemberIdState());
            pstmt.setInt(16, memberVO.getAcState());
            pstmt.setInt(17, memberVO.getMemberId());

            pstmt.executeUpdate();

        } catch (SQLException se) {
            se.printStackTrace(System.err);
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

    //刪除
    @Override
    public void delete(Integer memberId) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, memberId);

            pstmt.executeUpdate();

        } catch (SQLException se) {
            se.printStackTrace(System.err);
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

    //查詢單一
    @Override
    public MemberVO findByPrimaryKey(Integer memberId) {

        MemberVO memberVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, memberId);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                // Domain objects
                memberVO = new MemberVO();
                memberVO.setMemberId(rs.getInt("MEMBER_ID"));
                memberVO.setMemberAc(rs.getString("MEMBER_AC"));
                memberVO.setMemberPw(rs.getString("MEMBER_PW"));
                memberVO.setMemberName(rs.getString("MEMBER_NAME"));
                memberVO.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
                memberVO.setMemberSex(rs.getString("MEMBER_SEX"));
                memberVO.setMemberBuilding(rs.getString("MEMBER_BUILDING"));
                memberVO.setMemberEmail(rs.getString("MEMBER_EMAIL"));
                memberVO.setMemberMobile(rs.getString("MEMBER_MOBILE"));
                memberVO.setMemberTel(rs.getString("MEMBER_TEL"));
                memberVO.setMemberPost(rs.getString("MEMBER_POST"));
                memberVO.setMemberAddress(rs.getString("MEMBER_ADDRESS"));
                memberVO.setMemberPoints(rs.getInt("MEMBER_POINTS"));
                memberVO.setMemberPic(rs.getBytes("MEMBER_PIC"));
                memberVO.setRegDate(rs.getDate("REG_DATE"));
                memberVO.setMemberIdState(rs.getInt("MEMBER_ID_STATE"));
                memberVO.setAcState(rs.getInt("AC_STATE"));
            }
            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("資料庫發生錯誤!"
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
        return memberVO;
    }

    //查詢全部
    @Override
    public List<MemberVO> getAll() {
        List<MemberVO> list = new ArrayList<MemberVO>();
        MemberVO memberVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                //  Domain objects
                memberVO = new MemberVO();
                memberVO.setMemberId(rs.getInt("MEMBER_ID"));
                memberVO.setMemberAc(rs.getString("MEMBER_AC"));
                memberVO.setMemberPw(rs.getString("MEMBER_PW"));
                memberVO.setMemberName(rs.getString("MEMBER_NAME"));
                memberVO.setMemberNickname(rs.getString("MEMBER_NICKNAME"));
                memberVO.setMemberSex(rs.getString("MEMBER_SEX"));
                memberVO.setMemberBuilding(rs.getString("MEMBER_BUILDING"));
                memberVO.setMemberEmail(rs.getString("MEMBER_EMAIL"));
                memberVO.setMemberMobile(rs.getString("MEMBER_MOBILE"));
                memberVO.setMemberTel(rs.getString("MEMBER_TEL"));
                memberVO.setMemberPost(rs.getString("MEMBER_POST"));
                memberVO.setMemberAddress(rs.getString("MEMBER_ADDRESS"));
                memberVO.setMemberPoints(rs.getInt("MEMBER_POINTS"));
                memberVO.setMemberPic(rs.getBytes("MEMBER_PIC"));
                memberVO.setRegDate(rs.getDate("REG_DATE"));
                memberVO.setMemberIdState(rs.getInt("MEMBER_ID_STATE"));
                memberVO.setAcState(rs.getInt("AC_STATE"));
                list.add(memberVO);
            }
            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("資料庫發生錯誤! "
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
        return list;
    }

}