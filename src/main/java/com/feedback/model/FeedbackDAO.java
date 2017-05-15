package com.feedback.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class FeedbackDAO implements FeedbackDAO_interface {
	private static final String GET_ALL_STMT = "from FeedbackVO";
	private static final String GET_TOP3 = "from FeedbackVO order by feedbackDate desc";
	@Override
	public void insert(FeedbackVO fVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(fVO);
			session.getTransaction().commit();
		}catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(FeedbackVO fVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(fVO);
			session.getTransaction().commit();
		}catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer feedbackNo) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			FeedbackVO fVO = (FeedbackVO)session.get(FeedbackVO.class, feedbackNo);
			session.delete(fVO);
			session.getTransaction().commit();
		}catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public FeedbackVO findByPK(Integer feedbackNo) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		FeedbackVO fVO = null;
		try{
			session.beginTransaction();
			fVO = (FeedbackVO)session.get(FeedbackVO.class, feedbackNo);
			session.getTransaction().commit();
		}catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return fVO;
	}

	@Override
	public List<FeedbackVO> listAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<FeedbackVO> list = null;
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		}catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<FeedbackVO> listTOP3() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<FeedbackVO> list = null;
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_TOP3);
			query.setFirstResult(0);
			query.setMaxResults(3);
			list = query.list();
			session.getTransaction().commit();
		}catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
//	public static void main(String[] args){
//		FeedbackDAO fd = new FeedbackDAO();
//		List<FeedbackVO> list = fd.listTOP3();
//		for(FeedbackVO fVO:list){
//			System.out.println(fVO.getFeedbackDate().getTime());
//		}
//		
//	}
}
