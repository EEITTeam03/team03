package com.membercars.model;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;

import com.memberinfo.model.MemberInfoVO;

import hibernate.util.HibernateUtil;

public class MemberCarsHibernateDAO implements MemberCarsDAO {

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
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try{
			session.beginTransaction();
			session.delete(carLicense);
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
			throw ex;
		}
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberInfoVO> findAddMember(String email, String password, String memberName, String phone,
			Date birthday, String address, Date effectiveDate) {
		// TODO Auto-generated method stub
		return null;
	}

}
