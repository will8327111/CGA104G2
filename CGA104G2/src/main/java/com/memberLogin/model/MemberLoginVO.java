package com.memberLogin.model;
import java.sql.Date;

public class MemberLoginVO implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String memberAc;
	private String memberPw;
	private String memberName;
	private String memberNickname;
	private String memberSex;
	private String memberBuilding;
	private String memberEmail;
	private String memberMobile;
	private String memberTel;
	private String memberPost;
	private String memberAddress;
	private Integer memberPoints;
	private Byte memberPic;
	private Date regDate;
	private Short memberIdState;
	private Short acState;
	
	
	private Integer memberId;
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getMemberAc() {
		return memberAc;
	}
	public void setMemberAc(String memberAc) {
		this.memberAc = memberAc;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberSex() {
		return memberSex;
	}
	public void setMemberSex(String memberSex) {
		this.memberSex = memberSex;
	}
	public String getMemberBuilding() {
		return memberBuilding;
	}
	public void setMemberBuilding(String memberBuilding) {
		this.memberBuilding = memberBuilding;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberMobile() {
		return memberMobile;
	}
	public void setMemberMobile(String memberMobile) {
		this.memberMobile = memberMobile;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getMemberPost() {
		return memberPost;
	}
	public void setMemberPost(String memberPost) {
		this.memberPost = memberPost;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public Integer getMemberPoints() {
		return memberPoints;
	}
	public void setMemberPoints(Integer memberPoints) {
		this.memberPoints = memberPoints;
	}
	public Byte getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(Byte memberPic) {
		this.memberPic = memberPic;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Short getMemberIdState() {
		return memberIdState;
	}
	public void setMemberIdState(Short memberIdState) {
		this.memberIdState = memberIdState;
	}
	public Short getAcState() {
		return acState;
	}
	public void setAcState(Short acState) {
		this.acState = acState;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	


	
	
	
	
	
}
