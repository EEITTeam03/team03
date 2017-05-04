package com.membercars.model;

import java.util.List;

import org.hibernate.Session;
import hibernate.util.HibernateUtil;

public class MemberCarsHibernateDAO implements MemberCarsDAO {

	@Override
	public void insert(MemberCarsVO memberCarsVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(MemberCarsVO memberCarsVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberCarsVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String carLicense) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberCarsVO findByPK(String carLicense) {
		MemberCarsVO memberCarsVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memberCarsVO = (MemberCarsVO) session.get(MemberCarsVO.class, carLicense);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memberCarsVO;
	}

	@Override
	public List<MemberCarsVO> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
