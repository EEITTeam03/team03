package com.reservlist.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class ReservListHibernateDAO implements ReservListDAO{
	
	private static final String DEL_BY_NO = "delete ReservListVO where reservNo=?";
	private static final String GET_ALL_STMT = "from ReservListVO order by reservNo";
	private static final String GET_BY_NO = "from ReservListVO where reservNo=?";
	private static final String GET_ALL_BY_SERV = "from ReservListVO where servNo=? order by servNo";
	private static final String GET_ALL_GROUP_BY_SERV = "select servicesVO.servNo,count(*) from ReservListVO group by servicesVO.servNo";
	
	@Override
	public void insert(ReservListVO reservListVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(reservListVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ReservListVO reservListVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(reservListVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer reservNo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query= session.createQuery(DEL_BY_NO);
			query.setParameter(0, reservNo);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public List<ReservListVO> findByReservNo(Integer reservNo) {
		List<ReservListVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query= session.createQuery(GET_BY_NO);
			query.setParameter(0, reservNo);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<ReservListVO> listAll() {
		List<ReservListVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query= session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<ReservListVO> listAllByServ(String servNo) {
		List<ReservListVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query= session.createQuery(GET_ALL_BY_SERV);
			query.setParameter(0, servNo);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<Object[]> listAllCount() {
		List<Object[]> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query= session.createQuery(GET_ALL_GROUP_BY_SERV);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	
	
	
	
}
