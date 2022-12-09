package com.bulletinboard.model;

import com.bulletinboardpic.model.BulletinBoardPicVO;

import java.util.List;

public interface BulletinboardDAO_interface {
    //新增
    void insert(BulletinboardVO bulletinboardVO);

    //修改
    void update(BulletinboardVO bulletinboardVO);

    //刪除
    void delete(Integer bbSubId);

    //查詢單一
    BulletinboardVO findByPrimaryKey(Integer bbSubId);

    //查詢全部
    List<BulletinboardVO> getAll();

    //上架的全部
    List<BulletinboardVO> getAllOn();

    // 選擇上架+特定類別
    List<BulletinboardVO> getBbSelect(String bbClass);

    //查詢類別
        BulletinboardVO findClass(String bbClass);


}
