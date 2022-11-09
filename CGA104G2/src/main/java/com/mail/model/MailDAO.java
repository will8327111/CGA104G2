package com.mail.model;

import java.util.List;

public class MailDAO implements MailDAO_interface {

	@Override
	public List<MailVO> getAll() {
		beginTransaction();
		final String hql = "FROM MailVO";
		List<MailVO> list = getSession().createQuery(hql).list();
		commit();
		return list;
	}

	@Override
	public void insert(MailVO mailVO) {
		try {
			beginTransaction();
			getSession().persist(mailVO);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void update(MailVO mailVO) {
		try {
			beginTransaction();
			getSession().persist(mailVO);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Integer mailId) {
		try {
			beginTransaction();
			MailVO mailVO = new MailVO();
			mailVO.setMailId(mailId);
			getSession().remove(mailVO);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
	}

	@Override
	public List<MailVO> findByPrimaryKey(Integer mailId) {
		try {
			beginTransaction();
			final String hql = "FROM MailVO where mailId = :id";
			List<MailVO> list = getSession().createQuery(hql, MailVO.class).setParameter("id", mailId).list();
			return list;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public MailVO findByMemberName(String memberName) {
//		beginTransaction();
//		final String hql ="FROM MailVO WHERE memberName = :id"; 
//		commit();
		return null;
	}

}
