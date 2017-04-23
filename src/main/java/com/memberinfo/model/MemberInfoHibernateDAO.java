package com.memberinfo.model;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;

public class MemberInfoHibernateDAO implements MemberInfoDAO {
	
	private static final String GET_ALL_STMT = "from MemberInfoVO order by memberNo";
	private static final String GET_BY_PHONE = "from MemberInfoVO where phone =?";
	
	@Override
	public void insert(MemberInfoVO memberInfoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberInfoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(MemberInfoVO memberInfoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberInfoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer memberNo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			MemberInfoVO memberInfoVO = (MemberInfoVO) session.get(MemberInfoVO.class, memberNo);
			session.delete(memberInfoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public MemberInfoVO findByPK(Integer memberNo) {
		MemberInfoVO memberInfoVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memberInfoVO = (MemberInfoVO) session.get(MemberInfoVO.class, memberNo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memberInfoVO;
	}

	@Override
	public MemberInfoVO findByPhone(String phone) {
		MemberInfoVO memberInfoVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_PHONE);
			query.setParameter(0, phone);
			List<MemberInfoVO> list = query.list();
			if(list.size() != 0)
				memberInfoVO = list.get(0);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memberInfoVO;
	}

	@Override
	public List<MemberInfoVO> listAll() {
		List<MemberInfoVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

}