package com.bulletinboardpic.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BulletinBoardPicDAO implements BulletinBoardPicDAO_interface {

    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    //新增
    private static final String INSERT_BB_PIC =
            "INSERT INTO BULLETIN_BOARD_PICTURES (BB_SUB_ID,BB_PIC)" +
                    "VALUES(?,?)";
    //修改圖片
    private static final String UPDATE =
            "UPDATE BULLETIN_BOARD_PICTURES set BB_PIC=? where BB_PIC_ID = ?";
    //查詢單一
    private static final String GET_ONE_BB_PIC =
            "SELECT BB_SUB_ID,BB_PIC from BULLETIN_BOARD_PICTURES where BB_SUB_ID = ?";
    //查詢全部
    private static final String GET_ALL_BB_PIC =
            "SELECT * from BULLETIN_BOARD_PICTURES";
    //刪除
//    private static final String DELETE =
//            "DELETE from BULLETIN_BOARD_PICTURES where BB_PIC_ID=?";

    //新增
    @Override
    public void insert(BulletinBoardPicVO bulletinBoardPicVO) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_BB_PIC);

            pstmt.setInt(1, bulletinBoardPicVO.getBbSubId());
            pstmt.setBytes(2, bulletinBoardPicVO.getBbPic());

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
    public void update(BulletinBoardPicVO bulletinBoardPicVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setInt(1, bulletinBoardPicVO.getBbSubId());
            pstmt.setBytes(2, bulletinBoardPicVO.getBbPic());

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
    public BulletinBoardPicVO getOnePic(Integer bbPicId) {

        BulletinBoardPicVO bulletinBoardPicVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_BB_PIC);

            pstmt.setInt(1, bbPicId);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                // Domain objects
                bulletinBoardPicVO = new BulletinBoardPicVO();
                bulletinBoardPicVO.setBbPicId(rs.getInt("BB_PIC_ID"));
                bulletinBoardPicVO.setBbSubId(rs.getInt("BB_SUB_ID"));
                bulletinBoardPicVO.setBbPic(rs.getBytes("BB_PIC"));

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
        return bulletinBoardPicVO;
    }

    //查詢全部
    @Override
    public List<BulletinBoardPicVO> getAllPic() {
        List<BulletinBoardPicVO> list = new ArrayList<BulletinBoardPicVO>();
        BulletinBoardPicVO bulletinBoardPicVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_BB_PIC);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                //  Domain objects
                bulletinBoardPicVO = new BulletinBoardPicVO();
                bulletinBoardPicVO.setBbPicId(rs.getInt("BB_PIC_ID"));
                bulletinBoardPicVO.setBbSubId(rs.getInt("BB_SUB_ID"));
                bulletinBoardPicVO.setBbPic(rs.getBytes("BB_PIC"));

                list.add(bulletinBoardPicVO);
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
    //刪除 沒使用
//    @Override
//    public void delete(Integer bbPicId) {
//        Connection con = null;
//        PreparedStatement pstmt = null;
//
//        try {
//
//            con = ds.getConnection();
//            pstmt = con.prepareStatement(DELETE);
//
//            pstmt.setInt(1,bbPicId);
//
//            pstmt.executeUpdate();
//
//        } catch (SQLException se) {
//            se.printStackTrace(System.err);
//        } finally {
//            if (pstmt != null) {
//                try {
//                    pstmt.close();
//                } catch (SQLException se) {
//                    se.printStackTrace(System.err);
//                }
//            }
//            if (con != null) {
//                try {
//                    con.close();
//                } catch (Exception e) {
//                    e.printStackTrace(System.err);
//                }
//            }
//        }
//    }

}