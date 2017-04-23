package com.schedule.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.hibernate.type.StandardBasicTypes;

import com.employee.model.EmployeeVO;
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
//		List<ReservVO>list = dao.getAll();
//		for(ReservVO reservVO:list){
//			System.out.println(reservVO.getReservNo()+",");
//			System.out.println(reservVO.getReservDateTime()+",");
//			System.out.println(reservVO.getNoteC()+",");
//			System.out.println(reservVO.getNotesE()+",");
//			System.out.println(reservVO.getStatus()+",");
//			System.out.println(reservVO.getMembercarsVO().getCarLicense()+",");
//			System.out.println(reservVO.getEmployeeVO().getEmployeeNo());
//			Set<ReservListVO>relists = reservVO.getReservlists();
//			for(ReservListVO lists:relists){
//				System.out.println(lists.getServicesVO().getServNo());
//				System.out.println(lists.getServName());
//				System.out.println(lists.getServPrice());
//				System.out.println(lists.getServTime());
//			}
//		}
		List<Object[]>list2 = dao.getSchedule();
//		for(Object[] aArray:list2){
//			System.out.print((Integer)aArray[0]+" ");
//			System.out.print((Timestamp)aArray[1]+" ");
//			System.out.print((Integer)aArray[2]+" ");
//			System.out.print((Integer)aArray[3]+" ");
//			System.out.print((String)aArray[4]+" ");
//		}
		
	}

	@Override
	public List<Object[]> getSchedule() {
		// TODO Auto-generated method stub
		List<Object[]>list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createSQLQuery("select reserv.reservNo,reservDateTime,employeeNo,servTime,servName from reserv inner join reserv_list  on reserv.reservNo = reserv_list.reservNo");
					
			list=query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

}
