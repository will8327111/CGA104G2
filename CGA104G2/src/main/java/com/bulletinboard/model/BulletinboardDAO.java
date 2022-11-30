package com.bulletinboard.model;

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

public class BulletinboardDAO implements BulletinboardDAO_interface {
    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    //新增BB
    private static final String INSERT_BB =
            "insert into bulletin_board (BB_CLASS, BB_TITLE, BB_CONTENT, BB_POSTDATE, BB_UPDATE, BB_ARTICAL_STATE, BM_ID) values(?,?,?,?,?,?,?)";

    //新增圖片
    private static final String INSERT_BB_PIC =
            "insert into bulletin_board_pictures (BB_SUB_ID, BB_PIC) values(?,?)";

    //查詢全部
    private static final String GET_ALL_BB =
            "SELECT * from bulletin_board order by BB_SUB_ID";

    private static final String GET_ALL_BB_ON =
            "SELECT bb.BB_SUB_ID,bb.BB_CLASS,bb.BB_TITLE,bb.BB_CONTENT,bb.BB_POSTDATE,bb.BB_UPDATE,bbp.BB_PIC\n" +
                    "from bulletin_board bb\n" +
                    "        left join bulletin_board_pictures bbp\n" +
                    "              on bb.BB_SUB_ID = bbp.BB_SUB_ID\n" +
//                    "where bb.BB_CLASS='社區規約'\n" +
//                    "  and BB_ARTICAL_STATE=1;";
    "where BB_ARTICAL_STATE=1 order by 1 DESC;";
    //查詢單一類別
    private static final String GET_ONE_BB =
            "SELECT * from bulletin_board bb1 left join bulletin_board_pictures bbp on bb1.BB_SUB_ID = bbp.BB_SUB_ID where bbp.BB_SUB_ID = ? order by bb1.BB_SUB_ID DESC ;";
    //查詢單一類別+join圖片
//    private static final String GET_ONE_BB_WITH_PIC ="select * from bulletin_board bb left join bulletin_board_pictures bbpic on bb.BB_SUB_ID = bbpic.BB_SUB_ID where bb.BB_SUB_ID = ? order by bb.BB_SUB_ID DESC ;";

    //差詢類別
    private static final String GET_BB_Class =
            "SELECT  BB_TITLE,BB_CONTENT,BB_POSTDATE from bulletin_board where BB_CLASS like ?";

    //刪除
    private static final String DELETE =
            "DELETE from bulletin_board where BB_SUB_ID =?";
    private static final String DELETE_PIC =
            "DELETE from bulletin_board_pictures where BB_SUB_ID =?";
    //修改
    private static final String UPDATE =
            "UPDATE bulletin_board set BB_CLASS=?, BB_TITLE=?,BB_CONTENT=? ,BB_POSTDATE=?,BB_UPDATE=? ,BB_ARTICAL_STATE=? ,BM_ID=? where BB_SUB_ID = ?";
//    private static final String UPDATE_PIC =
//            "UPDATE bulletin_board_pictures set BB_PIC = ? where BB_SUB_ID = ?";


    //新增
    @Override
    public void insert(BulletinboardVO bulletinboardVO) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int bbSubId = 0;
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_BB,pstmt.RETURN_GENERATED_KEYS);

            pstmt.setString(1, bulletinboardVO.getBbClass());
            pstmt.setString(2, bulletinboardVO.getBbTitle());
            pstmt.setString(3, bulletinboardVO.getBbContent());
            pstmt.setDate(4, bulletinboardVO.getBbPostdate());
            pstmt.setDate(5, bulletinboardVO.getBbUpdate());
            pstmt.setInt(6, bulletinboardVO.getBbArticalState());
            pstmt.setInt(7, bulletinboardVO.getBmId());

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();
            if(rs.next()) {
                bbSubId = rs.getInt(1);
            }
            pstmt = con.prepareStatement(INSERT_BB_PIC);
            pstmt.setInt(1,bbSubId);
            pstmt.setBytes(2,bulletinboardVO.getBbPic());

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
    public void update(BulletinboardVO bulletinboardVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, bulletinboardVO.getBbClass());
            pstmt.setString(2, bulletinboardVO.getBbTitle());
            pstmt.setString(3, bulletinboardVO.getBbContent());
            pstmt.setDate(4, bulletinboardVO.getBbPostdate());
            pstmt.setDate(5, bulletinboardVO.getBbUpdate());
            pstmt.setInt(6, bulletinboardVO.getBbArticalState());
            pstmt.setInt(7, bulletinboardVO.getBmId());
            pstmt.setInt(8, bulletinboardVO.getBbSubId());

            pstmt.executeUpdate();

//            pstmt = con.prepareStatement(UPDATE_PIC);
//            pstmt.setBytes(1,bulletinboardVO.getBbPic());
//            pstmt.setInt(2, bulletinboardVO.getBbSubId());
//
//            pstmt.executeUpdate();

            // Handle any driver errors
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

    //刪除
    @Override
    public void delete(Integer bbSubId) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);
            pstmt.setInt(1, bbSubId);

            pstmt.executeUpdate();

            pstmt = con.prepareStatement(DELETE_PIC);
            pstmt.setInt(1, bbSubId);

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
    public BulletinboardVO findByPrimaryKey(Integer bbSubId) {

        BulletinboardVO bulletinboardVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_BB);

            pstmt.setInt(1, bbSubId);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                // Domain objects
                bulletinboardVO = new BulletinboardVO();
                bulletinboardVO.setBbSubId(rs.getInt("BB_SUB_ID"));
                bulletinboardVO.setBbClass(rs.getString("BB_CLASS"));
                bulletinboardVO.setBbTitle(rs.getString("BB_TITLE"));
                bulletinboardVO.setBbContent(rs.getString("BB_CONTENT"));
                bulletinboardVO.setBbPostdate(rs.getDate("BB_POSTDATE"));
                bulletinboardVO.setBbUpdate(rs.getDate("BB_UPDATE"));
                bulletinboardVO.setBbArticalState(rs.getInt("BB_ARTICAL_STATE"));
                bulletinboardVO.setBmId(rs.getInt("BM_ID"));

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
        return bulletinboardVO;
    }

    //查詢全部
    @Override
    public List<BulletinboardVO> getAll() {
        List<BulletinboardVO> list = new ArrayList<BulletinboardVO>();
        BulletinboardVO bulletinboardVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_BB);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                //  Domain objects
                bulletinboardVO = new BulletinboardVO();
                bulletinboardVO.setBbSubId(rs.getInt("BB_SUB_ID"));
                bulletinboardVO.setBbClass(rs.getString("BB_CLASS"));
                bulletinboardVO.setBbTitle(rs.getString("BB_TITLE"));
                bulletinboardVO.setBbContent(rs.getString("BB_CONTENT"));
                bulletinboardVO.setBbPostdate(rs.getDate("BB_POSTDATE"));
                bulletinboardVO.setBbUpdate(rs.getDate("BB_UPDATE"));
                bulletinboardVO.setBbArticalState(rs.getInt("BB_ARTICAL_STATE"));
                bulletinboardVO.setBmId(rs.getInt("BM_ID"));

                list.add(bulletinboardVO);
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

//上架的全部
    @Override
    public List<BulletinboardVO> getAllOn() {
        List<BulletinboardVO> list = new ArrayList<BulletinboardVO>();
        BulletinboardVO bulletinboardVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_BB_ON);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                //  Domain objects
                bulletinboardVO = new BulletinboardVO();
                bulletinboardVO.setBbSubId(rs.getInt("BB_SUB_ID"));
                bulletinboardVO.setBbClass(rs.getString("BB_CLASS"));
                bulletinboardVO.setBbTitle(rs.getString("BB_TITLE"));
                bulletinboardVO.setBbContent(rs.getString("BB_CONTENT"));
                bulletinboardVO.setBbPostdate(rs.getDate("BB_POSTDATE"));
                bulletinboardVO.setBbUpdate(rs.getDate("BB_UPDATE"));
//                bulletinboardVO.setBbArticalState(rs.getInt("BB_ARTICAL_STATE"));
//                bulletinboardVO.setBmId(rs.getInt("BM_ID"));

                list.add(bulletinboardVO);
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


    //照類別查詢

    @Override
    public List<BulletinboardVO> findClass(String bbClass) {
        List<BulletinboardVO> list = new ArrayList<BulletinboardVO>();
        BulletinboardVO bulletinboardVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_BB_Class);

            pstmt.setString(1, bbClass);
            rs = pstmt.executeQuery();


            rs = pstmt.executeQuery();

            while (rs.next()) {
                //  Domain objects
                bulletinboardVO = new BulletinboardVO();

//                bulletinboardVO.setBbTitle(rs.getString("BB_CLASS"));
                bulletinboardVO.setBbTitle(rs.getString("BB_TITLE"));
                bulletinboardVO.setBbContent(rs.getString("BB_CONTENT"));
                bulletinboardVO.setBbPostdate(rs.getDate("BB_POSTDATE"));
//                bulletinboardVO.setBbUpdate(rs.getDate("BB_UPDATE"));

                list.add(bulletinboardVO);
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
