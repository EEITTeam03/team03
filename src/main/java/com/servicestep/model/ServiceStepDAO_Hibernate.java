package com.servicestep.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import com.services.model.ServicesVO;

public class ServiceStepDAO_Hibernate implements ServiceStepDAO_interface {
	private static final String GET_ALL_STMT = "FROM ServiceStepVO order by servNo";
	private static final String GET_ONE_STMT = "FROM ServiceStepVO order by servNo=?";
	private static final String DELETE = "DELETE ServicesVO WHERE servNo=?";

	@Override
	public void insert(ServiceStepVO serviceStepVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(serviceStepVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void update(ServiceStepVO serviceStepVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(serviceStepVO);
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
			Query query = (Query) session.createQuery(DELETE);
			query.setParameter(0, servNo);
			// ServiceStepVO serviceStepVO=new ServiceStepVO();
			// serviceStepVO.setServNo(servNo);
			// session.delete(serviceStepVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public ServiceStepVO findByPrimaryKey(Integer servNo) {
		ServiceStepVO serviceStepVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			serviceStepVO = (ServiceStepVO) session.get(ServiceStepVO.class, servNo);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return serviceStepVO;

	}
	@Override
	public List<ServiceStepVO> findByServNo() {
		List<ServiceStepVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery(GET_ONE_STMT);
			list=query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;

	}

	@Override
	public List<ServiceStepVO> getAll() {
		List<ServiceStepVO> list = null;
		// ServiceStepVO serviceStepVO = null;
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
	public ServiceStepVO findByPrimaryKeyServStepNo(Integer servStepNo) {
		ServiceStepVO serviceStepVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			serviceStepVO = (ServiceStepVO) session.get(ServiceStepVO.class, servStepNo);
			session.getTransaction().commit();
		}catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return serviceStepVO;
	}

	
}
