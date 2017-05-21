package com.reservlist.model;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import myutil.MyUtil;

public class ReservListHibernateDAO implements ReservListDAO{
	
	private static final String DEL_BY_NO = "delete ReservListVO where reservNo=?";
	private static final String GET_ALL_STMT = "from ReservListVO order by reservNo";
	private static final String GET_BY_NO = "from ReservListVO where reservNo=?";
	private static final String GET_ALL_BY_SERV = "from ReservListVO where servNo=? order by servNo";
	private static final String GET_ALL_GROUP_BY_SERV = "select servicesVO.servNo,count(*) from ReservListVO group by servicesVO.servNo";
	private static final String GET_ALL_GROUP_BY_SERV_MONTH = "select servicesVO.servNo,count(*) from ReservListVO where reservVO.reservDateTime between ? and ? group by servicesVO.servNo";
	private static final String GET_ALL_GROUP_BY_SERV_MONTH_TYPE = "select servicesVO.servNo,count(*) from ReservListVO where servicesVO.servTypeNo=? and reservVO.reservDateTime between ? and ? group by servicesVO.servNo";
	private static final String GET_MONEY_GROUP_BY_EMP_MONTH = "select reservVO.employeeVO.employeeNo,SUM(servPrice) from ReservListVO where reservVO.reservDateTime between ? and ? group by reservVO.employeeVO.employeeNo";
	
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

	@Override
	public List<Object[]> listAllCount(String month) {
		List<Object[]> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Calendar cal = MyUtil.getCalenderMonth(month);
			Calendar cal2 = Calendar.getInstance();
			cal2.setTime(cal.getTime());
			cal2.add(Calendar.MONTH, 1);
			Query query= session.createQuery(GET_ALL_GROUP_BY_SERV_MONTH);
			query.setParameter(0, cal);
			query.setParameter(1, cal2);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<Object[]> listAllMoney(String month) {
		List<Object[]> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Calendar cal = MyUtil.getCalenderMonth(month);
			Calendar cal2 = Calendar.getInstance();
			cal2.setTime(cal.getTime());
			cal2.add(Calendar.MONTH, 1);
			Query query= session.createQuery(GET_MONEY_GROUP_BY_EMP_MONTH);
			query.setParameter(0, cal);
			query.setParameter(1, cal2);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<Object[]> listAllCount(String month, String type) {
		List<Object[]> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Calendar cal = MyUtil.getCalenderMonth(month);
			Calendar cal2 = Calendar.getInstance();
			cal2.setTime(cal.getTime());
			cal2.add(Calendar.MONTH, 1);
			Query query= session.createQuery(GET_ALL_GROUP_BY_SERV_MONTH_TYPE);
			query.setParameter(0, type);
			query.setParameter(1, cal);
			query.setParameter(2, cal2);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	
	
	
	
}
