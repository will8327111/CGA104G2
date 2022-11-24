package com.bulletinboardpic.model;

import java.util.List;

public class BulletinBoardPicService {
    private BulletinBoardPicDAO_interface dao;

    public BulletinBoardPicService() {
        dao = new BulletinBoardPicDAO();
    }
public BulletinBoardPicVO addBbPic(Integer bbSubId, byte[] bbPic){
        BulletinBoardPicVO bulletinBoardPicVO=new BulletinBoardPicVO();

        bulletinBoardPicVO.setBbSubId(bbSubId);
        bulletinBoardPicVO.setBbPic(bbPic);
        dao.insert(bulletinBoardPicVO);

        return  bulletinBoardPicVO;
}
public BulletinBoardPicVO updateBbPic(Integer bbPicId,Integer bbSubId,byte[] bbPic){
        BulletinBoardPicVO bulletinBoardPicVO=new BulletinBoardPicVO();

        bulletinBoardPicVO.setBbPicId(bbPicId);
        bulletinBoardPicVO.setBbSubId(bbSubId);
        bulletinBoardPicVO.setBbPic(bbPic);

        dao.update(bulletinBoardPicVO);

        return bulletinBoardPicVO;
}
    public BulletinBoardPicVO getOnePic(Integer bbPicId){
        return  dao.getOnePic(bbPicId);
    }
    public List<BulletinBoardPicVO> getAllPic(){
        return  dao.getAllPic();
    }
//刪除 沒使用
//public void deleteBbPic(Integer bbPicId){
//        return dao.delete(bbPicId);
//}

}



