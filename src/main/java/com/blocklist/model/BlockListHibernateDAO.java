package com.blocklist.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;

import hibernate.util.HibernateUtil;

public class BlockListHibernateDAO implements BlockListDAO_interface{

	private static final String GET_ALL_STMT = "FROM BlockListVO ORDER BY reservationNo";
	private static final String COUNT_MEMBERNO = "SELECT COUNT (memberInfoVO) FROM BlockListVO where memberInfoVO=?";
	
	@Override
	public void insert(BlockListVO blockListVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(blockListVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(BlockListVO blockListVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(blockListVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}
	@Override
	public void delete(Integer reservationNo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			BlockListVO blockListVO = (BlockListVO) session.get(BlockListVO.class, reservationNo);
			session.delete(blockListVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
	}

	@Override
	public BlockListVO findByPrimaryKey(Integer reservationNo) {
		BlockListVO blockListVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			blockListVO = (BlockListVO) session.get(BlockListVO.class, reservationNo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return blockListVO;
	}

	@Override
	public List<BlockListVO> getAll() {
		List<BlockListVO> list = new ArrayList<BlockListVO>();
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
	public Long countBlockList(MemberInfoVO miv) {
		// TODO Auto-generated method stub
		List<Object> list = new ArrayList<Object>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Long counter = null;
		try {
			session.beginTransaction();
			Query query = session.createQuery(COUNT_MEMBERNO);
			query.setParameter(0, miv);
			list = query.list();
			counter = (Long)list.get(0);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
		return counter;
	}
//	public static void main(String[]args){
//		MemberService ms = new MemberService();
//		 MemberInfoVO miv= ms.getOneMem(9);
//		 BlockListHibernateDAO dao = new BlockListHibernateDAO();
//		 System.out.println(dao.countBlockList(miv));
//		String a="hello";
//		String b=a;
//         a="java";
//        System.out.println(b);
//		Double a=1.0;  
//		 double b=1.0;
//		 float c=1.0;
//		 double s=1;
//		float c = 11.1f; 
//		int i =6;
//		String result=((10+20)<5*i++)+" ";
//		System.out.println(result);
//	}
}
