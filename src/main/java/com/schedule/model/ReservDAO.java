package com.schedule.model;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.classic.Session;

import com.membercars.model.MemberCarsVO;

import com.reservlist.model.ReservListVO;


import hibernate.util.HibernateUtil;

public class ReservDAO implements ReservDAO_interface {

	@Override
	public ReservVO findByPrimaryKey(Integer reservNo) {
		// TODO Auto-generated method stub
	ReservVO reservVO=null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	try{
	session.beginTransaction();
	reservVO=(ReservVO)session.get(ReservVO.class, reservNo);
	session.getTransaction().commit();
	} catch (RuntimeException ex) {
		session.getTransaction().rollback();
		throw ex;
	}
		return reservVO;
	}

	@Override
	public List<ReservVO> getAll() {
		// TODO Auto-generated method stub
		List<ReservVO>list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery("from ReservVO");
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
		ReservDAO dao = new ReservDAO();
		List<ReservVO>list = dao.getAll();
		for(ReservVO reservVO:list){
			System.out.println(reservVO.getReservNo()+",");
			System.out.println(reservVO.getReservDateTime()+",");
			System.out.println(reservVO.getNoteC()+",");
			System.out.println(reservVO.getNotesE()+",");
			System.out.println(reservVO.getStatus()+",");
			System.out.println(reservVO.getMembercarsVO().getCarLicense()+",");
			System.out.println(reservVO.getEmployeeVO().getEmployeeNo());
			Set<ReservListVO>relists = reservVO.getReservlists();
			for(ReservListVO lists:relists){
				System.out.println(lists.getServicesVO().getServNo());
				System.out.println(lists.getServName());
				System.out.println(lists.getServPrice());
				System.out.println(lists.getServTime());
			}
		}
		
	}

}
