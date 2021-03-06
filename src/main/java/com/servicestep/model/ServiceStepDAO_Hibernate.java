package com.servicestep.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import com.services.model.ServicesVO;

public class ServiceStepDAO_Hibernate implements ServiceStepDAO_interface {
	private static final String GET_ALL_STMT = "FROM ServiceStepVO order by servNo";
	private static final String GET_ONE_STMT = "FROM ServiceStepVO where servNo=?";
	private static final String GET_DISTINCT = "Select distinct servicesVO.servNo FROM ServiceStepVO";
    
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
	public void delete(Integer servStepNo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {

			session.beginTransaction();
			Query query = (Query) session.createQuery(DELETE);
			query.setParameter(0, servStepNo);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public ServiceStepVO findByPrimaryKey(Integer servStepNo) {
		ServiceStepVO serviceStepVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			serviceStepVO = (ServiceStepVO) session.get(ServiceStepVO.class, servStepNo);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return serviceStepVO;
	}

	@Override
	public List<ServiceStepVO> getAll() {
		List<ServiceStepVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery(GET_ALL_STMT);
			list=query.list();
			if(list!=null){
				session.getTransaction().commit();
			}
//			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}
	@Override
	public List<Object> getDist() {
		List<Object> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery(GET_DISTINCT);
			list=query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServiceStepVO> findByForeignKey(Integer servNo) {
		List<ServiceStepVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery(GET_ONE_STMT);
			query.setParameter(0, servNo);
			list=query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

}
