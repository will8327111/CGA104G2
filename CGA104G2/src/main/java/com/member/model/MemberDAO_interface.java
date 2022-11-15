package com.member.model;

import java.util.*;

public interface MemberDAO_interface {
    public void insert(MemberVO memberVO);

    public void delete(Integer memberId);

    public void update(MemberVO memberVO);

    public MemberVO findByPrimaryKey(Integer memberId);

    public List<MemberVO> getAll();
}