package com.bulletinboardpic.model;

import java.util.List;

public interface BulletinBoardPicDAO_interface {
    //新增
    void insert(BulletinBoardPicVO bulletinBoardPicVO);

    //修改
    void update(BulletinBoardPicVO bulletinBoardPicVO);

    //查詢單一
    BulletinBoardPicVO getOnePic(Integer bbPicId);

    //查詢全部
    List<BulletinBoardPicVO> getAllPic();
}
