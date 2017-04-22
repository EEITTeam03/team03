package com.carclass.model;

import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;
import com.cartype.model.CarTypeVO;

public class CarClassHibernateDAO implements CarClassDAO {

	private static final String GET_ALL_STMT = "from CarClassVO";
	
	@Override
	public void insert(CarClassVO carClassVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(carClassVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(CarClassVO carClassVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(carClassVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String carClass) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			CarClassVO carClassVO = (CarClassVO) session.get(CarClassVO.class, carClass);
			session.delete(carClassVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public CarClassVO findByPK(String carClass) {
		CarClassVO carClassVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			carClassVO = (CarClassVO) session.get(CarClassVO.class, carClass);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return carClassVO;
	}

	@Override
	public List<CarClassVO> listAll() {
		List<CarClassVO> list = null;
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

	@Override
	public Set<CarTypeVO> findTypesByClass(String carClass) {
			Set<CarTypeVO> set = findByPK(carClass).getCarTypes();
		return set;
	}

}
