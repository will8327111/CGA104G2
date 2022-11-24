package com.bulletinboardpic.model;


public class BulletinBoardPicVO {

  private Integer bbPicId;
  private Integer bbSubId;
  private byte[] bbPic;


  public Integer getBbPicId() {
    return bbPicId;
  }

  public void setBbPicId(Integer bbPicId) {
    this.bbPicId = bbPicId;
  }


  public Integer getBbSubId() {
    return bbSubId;
  }

  public void setBbSubId(Integer bbSubId) {
    this.bbSubId = bbSubId;
  }


  public byte[] getBbPic() {
    return bbPic;
  }

  public void setBbPic(byte[] bbPic) {
    this.bbPic = bbPic;
  }

}
