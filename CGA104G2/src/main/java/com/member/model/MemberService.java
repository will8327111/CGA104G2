package com.member.model;

import java.sql.Date;
import java.util.List;

public class MemberService {
    private MemberDAO_interface dao;

    public MemberService() {
        dao = new MemberDAO();
    }

    public MemberVO addMember(String memberAc, String memberPw, String memberName, String memberNickname,
                              String memberSex, String memberBuilding, String memberEmail, String memberMobile,
                              String memberTel, String memberPost, String memberAddress, Integer memberPoints,
                              Date regDate, Integer memberIdState, Integer acState,byte[] memberPic) {

        MemberVO memberVO = new MemberVO();

        memberVO.setMemberAc(memberAc);
        memberVO.setMemberPw(memberPw);
        memberVO.setMemberName(memberName);
        memberVO.setMemberNickname(memberNickname);
        memberVO.setMemberSex(memberSex);
        memberVO.setMemberBuilding(memberBuilding);
        memberVO.setMemberEmail(memberEmail);
        memberVO.setMemberMobile(memberMobile);
        memberVO.setMemberTel(memberTel);
        memberVO.setMemberPost(memberPost);
        memberVO.setMemberAddress(memberAddress);
        memberVO.setMemberPoints(memberPoints);
        memberVO.setMemberPic(memberPic);
        memberVO.setRegDate(regDate);
        memberVO.setMemberIdState(memberIdState);
        memberVO.setAcState(acState);
        dao.insert(memberVO);

        return memberVO;
    }
    public MemberVO updateMember(Integer memberId, String memberAc, String memberPw, String memberName, String memberNickname,
                                 String memberSex, String memberBuilding, String memberEmail, String memberMobile,
                                 String memberTel, String memberPost, String memberAddress, Integer memberPoints,
                                 Date regDate, Integer memberIdState, Integer acState,byte[] memberPic) {

        MemberVO memberVO = new MemberVO();

        memberVO.setMemberId(memberId);
        memberVO.setMemberAc(memberAc);
        memberVO.setMemberPw(memberPw);
        memberVO.setMemberName(memberName);
        memberVO.setMemberNickname(memberNickname);
        memberVO.setMemberSex(memberSex);
        memberVO.setMemberBuilding(memberBuilding);
        memberVO.setMemberEmail(memberEmail);
        memberVO.setMemberMobile(memberMobile);
        memberVO.setMemberTel(memberTel);
        memberVO.setMemberPost(memberPost);
        memberVO.setMemberAddress(memberAddress);
        memberVO.setMemberPoints(memberPoints);
        memberVO.setRegDate(regDate);
        memberVO.setMemberIdState(memberIdState);
        memberVO.setAcState(acState);
        memberVO.setMemberPic(memberPic);
        dao.update(memberVO);

        return memberVO;
    }
    public void deleteMember(Integer memberId) {
        dao.delete(memberId);
    }
    public MemberVO getOneMember(Integer memberId) {
        return dao.findByPrimaryKey(memberId);
    }
    public List<MemberVO> getAll() {
        return dao.getAll();
    }
}
