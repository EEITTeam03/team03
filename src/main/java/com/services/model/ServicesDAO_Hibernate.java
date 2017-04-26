package com.services.model;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.servicecarclass.model.ServiceCarClassVO;
import com.servicestep.model.ServiceStepVO;

import hibernate.util.HibernateUtil;

public class ServicesDAO_Hibernate implements ServicesDAO_interface {
	// 照servNo去選全部
	private static final String GET_ALL_STMT = "FROM ServicesVO order by servNo";
	// 照去選全部
	private static final String GET_ALL_servTypeNo_STMT = "FROM ServicesVO order by servTypeNo";
	// 選取所有日期去排序的
	private static final String GET_ALL_servEffectiveDate_STMT = "FROM ServicesVO order by servEffectiveDate";
	// 照servTypeNo選單個的
	private static final String GET_ONE_servTypeNo_STMT = "FROM ServicesVO where servTypeNo=?";
	// 依servDate選單一年分
	private static final String GET_ONE_servEffectiveDate_STMT = "FROM ServicesVO where DATEPART(yyyy,servEffectiveDate)=?";
	// 依servDate選單月分
	private static final String GET_ONE_MonthDate_STMT = "FROM ServicesVO where DATEPART(mm,servEffectiveDate)=?";

	private static final String DELETE = "DELETE FROM ServicesVO where servNo =?";

	@Override
	public void insert(ServicesVO servo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(servo);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void update(ServicesVO servo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(servo);
			session.getTransaction().commit();

		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void delete(Integer servNo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {

			session.beginTransaction();
			ServicesVO serVO = (ServicesVO) session.get(ServicesVO.class, servNo);
			// Query query = session.createQuery(DELETE);
			// query.setParameter(0, servNo);
			session.delete(serVO);
			// serVO.setServNo(servNo);

			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public ServicesVO findByPrimaryKey(Integer servNo) {
		ServicesVO serVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			serVO = (ServicesVO) session.get(ServicesVO.class, servNo);
			session.getTransaction().commit();

		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return serVO;
	}

	@Override
	public List<ServicesVO> findType(String servTypeNo) {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ONE_servTypeNo_STMT).setParameter(0, servTypeNo);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> findYear(String servEffectiveDate) {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ONE_servEffectiveDate_STMT).setParameter(0, servEffectiveDate);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> findMonth(String servEffectiveDate) {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ONE_MonthDate_STMT).setParameter(0, servEffectiveDate);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> getAll() {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> getAllType() {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ALL_servTypeNo_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> getAllDate() {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ALL_servEffectiveDate_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public Set<ServiceCarClassVO> getCarClassByServNo(Integer servNo) {
		Set<ServiceCarClassVO> set = findByPrimaryKey(servNo).getServiceCarClassVO();
		return set;
	}

	@Override
	public Set<ServiceStepVO> getservStepByServNo(Integer servNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
