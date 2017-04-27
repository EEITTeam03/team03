package com.servicecarclass.model;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.services.model.ServicesVO;

import hibernate.util.HibernateUtil;

public class ServiceCarClassDAO_Hibernate implements ServiceCarClassDAO_interface {

	private static final String GET_ALL_STMT = "FROM ServiceCarClassVO";
	private static final String GET_ONE_STMT = "SELECT servNo ,servPrice,servTime,carClass FROM services_carClass WHERE servNo=? AND carClass=?";
	private static final String GET_SERs_BYSerNo_STMT = "SELECT servNo,servTypeNo,servName,servDesc,servPhoto,servEffectiveDate,servStatus FROM services WHERE servNo=? order by servNo ";
	private static final String DELETE = "DELETE ServiceCarClassVO WHERE ServNo=?";
	@Override
	public void insert(ServiceCarClassVO serCarVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(serCarVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void update(ServiceCarClassVO serCarVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(serCarVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void delete(Integer servNo, String carClass) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			//TODO 由於有外部鍵，所以刪不掉
			session.beginTransaction();
//			CarClassVO carClassVO = new CarClassVO();
//			session.delete(carClassVO);
//			session.getTransaction().commit();
			Query query=(Query) session.createQuery(DELETE);
			query.setParameter(0, servNo);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public ServiceCarClassVO findByPrimaryKey(Integer ServNo) {
		ServiceCarClassVO serCarVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			serCarVO = (ServiceCarClassVO) session.get(ServiceCarClassVO.class, ServNo);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return serCarVO;
	}

	@Override
	public List<ServiceCarClassVO> getAll() {
		List<ServiceCarClassVO> list = null;
//		ServiceCarClassVO serCarVO = null;
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
	public Set<ServicesVO> getSerBySerNo(Integer servNo) {
//		Set<ServicesVO> set = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = (Query) session.createQuery(GET_ALL_STMT);
//			set = (Set<ServicesVO>) query.list();
//			session.getTransaction().commit();
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			throw e;
//		}
//
//		return set;
		return null;
	}

//	@Override
//	public Set<ServicesVO> getSerBySerNo(Integer ServNo) {
//		Set<ServicesVO> set =findByPrimaryKey(ServNo).getCarClassNo();
//	//TODO 要做從ServCarClass去找到所有的服務;
//		return null;
//	}

}