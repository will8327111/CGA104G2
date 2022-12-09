package com.bulletinboard.model;
//import com.bulletinboardpic.model;

import java.sql.Date;
import java.util.List;

public class BulletinboardService {
    private BulletinboardDAO_interface dao;

    public BulletinboardService() {
        dao = new BulletinboardDAO();
    }

    //新增
    public BulletinboardVO addBulletinboard(String bbClass, String bbTitle, String bbContent, Date bbPostdate,
                                            Date bbUpdate, Integer bbArticalState,Integer bmId) {

        BulletinboardVO bulletinboardVO = new BulletinboardVO();

        bulletinboardVO.setBbClass(bbClass);
        bulletinboardVO.setBbTitle(bbTitle);
        bulletinboardVO.setBbContent(bbContent);
        bulletinboardVO.setBbPostdate(bbPostdate);
        bulletinboardVO.setBbUpdate(bbUpdate);
        bulletinboardVO.setBbArticalState(bbArticalState);

        bulletinboardVO.setBmId(bmId);

//        bulletinboardVO.setBbPic(bbPic);

        dao.insert(bulletinboardVO);

        return bulletinboardVO;
    }

    //修改
    public BulletinboardVO updateBulletinboard(Integer bbSubId, String bbClass, String bbTitle, String bbContent,
                                               Date bbPostdate, Date bbUpdate, Integer bbArticalState, Integer bmId) {

        BulletinboardVO bulletinboardVO = new BulletinboardVO();

        bulletinboardVO.setBbSubId(bbSubId);
        bulletinboardVO.setBbClass(bbClass);
        bulletinboardVO.setBbTitle(bbTitle);
        bulletinboardVO.setBbContent(bbContent);
        bulletinboardVO.setBbPostdate(bbPostdate);
        bulletinboardVO.setBbUpdate(bbUpdate);
        bulletinboardVO.setBbArticalState(bbArticalState);

        bulletinboardVO.setBmId(bmId);

//        bulletinboardVO.setBbPic(bbPic);

        dao.update(bulletinboardVO);

        return bulletinboardVO;
    }
//    刪除
    public void deleteBulletinboard(Integer bbSubId) {
        dao.delete(bbSubId);
    }
//    以ID查找
    public BulletinboardVO getOneBulletinboard(Integer bbSubId) {
        return dao.findByPrimaryKey(bbSubId);
    }
//     全部
    public List<BulletinboardVO> getAll() {
        return dao.getAll();
    }
//    上架全部
    public List<BulletinboardVO> getAllOn() { return dao.getAllOn(); }
//    選擇上架+特定類別
    public List<BulletinboardVO> getBbSelect(String bbClass) { return dao.getBbSelect(bbClass); }
//    找類別
    public BulletinboardVO findClass(String bbClass) {
        return dao.findClass(bbClass);
    }
}

