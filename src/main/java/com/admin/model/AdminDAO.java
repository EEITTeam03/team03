package com.admin.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.blocklist.model.BlockListVO;
import com.schedule.model.ReservDAO;
import com.schedule.model.ReservService;

import hibernate.util.HibernateUtil;

public class AdminDAO implements AdminDAO_interface {
	private static final String GET_ALL_STMT="from AdminVO order by email";
	@Override
	public AdminVO findByPK(String email) {
		// TODO Auto-generated method stub
		AdminVO adminVO=null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			 adminVO= (AdminVO)session.get(AdminVO.class, email);
			 session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return adminVO;
	}

	@Override
	public void insert(AdminVO adminVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			 session.saveOrUpdate(adminVO);
			 session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(AdminVO adminVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			 session.saveOrUpdate(adminVO);
			 session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String email) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			 AdminVO adminVO= (AdminVO)session.get(AdminVO.class, email);
			 session.delete(adminVO);
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public List<AdminVO> getAll() {
		// TODO Auto-generated method stub
		List<AdminVO> list = new ArrayList<AdminVO>();
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
	public List<AdminVO> findByName(String name) {
		// TODO Auto-generated method stub
		List<AdminVO> list = new ArrayList<AdminVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			 Query query = session.createQuery("from AdminVO where name=?");
			 query.setParameter(0,name );
			 list = query.list();
			 session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<AdminVO> findAdmin(String email, String password) {
		// TODO Auto-generated method stub
			List<AdminVO> list = new ArrayList<AdminVO>();
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				try{
					session.beginTransaction();
					 Query query = session.createQuery("from AdminVO where email=? and password=?");
					 query.setParameter(0, email);
					 query.setParameter(1, password);
					 list = query.list();
					 session.getTransaction().commit();
				} catch (RuntimeException ex) {
					session.getTransaction().rollback();
					throw ex;
				}
				return list;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AdminDAO dao = new AdminDAO();
		List<AdminVO> adm = dao.findAdmin("EEITTeam0","P@ssw0rd");
		for(AdminVO adv :adm){
			System.out.println(adv.getEmail());
			System.out.println(adv.getPassword());
		}
		//System.out.println(adm);
	}
}
