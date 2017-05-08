package com.membercars.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;


import hibernate.util.HibernateUtil;

public class MemberCarsHibernateDAO implements MemberCarsDAO {
	
	private static final String GET_ALL_STMT = "from MemberCarsVO order by memberNo";
	private static final String GET_BY_MEM = "from MemberCarsVO where memberNo=?";
	
	
	@Override
	public void insert(MemberCarsVO memberCarsVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try{
			session.beginTransaction();
			session.saveOrUpdate(memberCarsVO);
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(MemberCarsVO memberCarsVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try{
			session.beginTransaction();
			session.saveOrUpdate(memberCarsVO);
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String carLicense) {
		// TODO Auto-generated method stub
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

//		try{
//			session.beginTransaction();
//			session.delete(carLicense);
//			session.getTransaction().commit();
//		}catch(RuntimeException ex){
//			ex.printStackTrace();
//			session.getTransaction().rollback();
//			throw ex;
//		}
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
		List<MemberCarsVO> list = null;
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
	public List<MemberCarsVO> findByMember(String memberNo) {
		List<MemberCarsVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_MEM);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

}
