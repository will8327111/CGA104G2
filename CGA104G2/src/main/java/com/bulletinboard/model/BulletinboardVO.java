package com.bulletinboard.model;


public class BulletinboardVO implements java.io.Serializable{

  private Integer bbSubId;
  private String bbClass;
  private String bbTitle;
  private String bbContent;
  private java.sql.Date bbPostdate;
  private java.sql.Date bbUpdate;
  private Integer bbArticalState;
  private Integer bmId;

  private byte[] bbPic;


  public Integer getBbSubId() {
    return bbSubId;
  }

  public void setBbSubId(Integer bbSubId) {
    this.bbSubId = bbSubId;
  }




  public String getBbClass() {
    return bbClass;
  }

  public void setBbClass(String bbClass) {
    this.bbClass = bbClass;
  }


  public String getBbTitle() {
    return bbTitle;
  }

  public void setBbTitle(String bbTitle) {
    this.bbTitle = bbTitle;
  }


  public String getBbContent() {
    return bbContent;
  }

  public void setBbContent(String bbContent) {
    this.bbContent = bbContent;
  }


  public java.sql.Date getBbPostdate() {
    return bbPostdate;
  }

  public void setBbPostdate(java.sql.Date bbPostdate) {
    this.bbPostdate = bbPostdate;
  }


  public java.sql.Date getBbUpdate() {
    return bbUpdate;
  }

  public void setBbUpdate(java.sql.Date bbUpdate) {
    this.bbUpdate = bbUpdate;
  }


  public Integer getBbArticalState() {
    return bbArticalState;
  }

  public void setBbArticalState(Integer bbArticalState) {
    this.bbArticalState = bbArticalState;
  }
  public Integer getBmId() {
    return bmId;
  }

  public void setBmId(Integer bmId) {
    this.bmId = bmId;
  }

    public byte[] getBbPic() {
    return bbPic;
    }
    public void setBbPic(byte[] bbPic) {
    this.bbPic = bbPic;
    }
//     for join bbPic from bbPicId
//  public com.bulletinboardpic.model.BulletinBoardPicVO getBulletinBoardVO() {
//    com.bulletinboardpic.model.BulletinBoardPicService bulletinBoardPicSvc = new com.bulletinboardpic.model.BulletinBoardPicService();
//    com.bulletinboardpic.model.BulletinBoardPicVO bulletinboardpicVO = bulletinBoardPicSvc.getOneBbPic(bbPicId);
//    return bulletinboardpicVO;
//  }

}
