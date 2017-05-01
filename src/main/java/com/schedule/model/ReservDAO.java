package com.schedule.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.hibernate.type.StandardBasicTypes;


import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsVO;
import com.memberinfo.model.MemberInfoVO;
import com.reservlist.model.ReservListVO;


import hibernate.util.HibernateUtil;
import myutil.MyUtil;

public class ReservDAO implements ReservDAO_interface {
	private static final String GET_ALL_STMT="from ReservVO order by reservNo";
	private static final String GET_BY_DATE="from ReservVO where reservDateTime between ? and ? order by reservDateTime";
	
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
			Query query = session.createQuery(GET_ALL_STMT);
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
//
//		List<ReservVO>list = dao.getAll();
		
//		for(ReservVO reservVO:list){
//			System.out.print(reservVO.getReservNo()+",");
//			System.out.print(reservVO.getReservDateTime()+",");
//			System.out.print(reservVO.getNoteC()+",");
//			System.out.print(reservVO.getNotesE()+",");
//			System.out.print(reservVO.getStatus()+",");
//			System.out.print(reservVO.getMembercarsVO().getCarLicense()+",");
//			System.out.println(reservVO.getEmployeeVO().getEmployeeNo());
//			Set<ReservListVO>relists = reservVO.getReservlists();
//			for(ReservListVO lists:relists){
//				System.out.println(lists.getReservListNo());
//
//				System.out.println(lists.getServicesVO().getServNo());
//				System.out.println(lists.getServName());
//				System.out.println(lists.getServPrice());
//				System.out.println(lists.getServTime());
//			}
//		}

		ReservService reservice = new ReservService();
		
		List<Map> list = reservice.getScheduleForJSON();
		for(Map map:list){
			Iterator iter = map.entrySet().iterator(); 
			while (iter.hasNext()) { 
			    Map.Entry entry = (Map.Entry) iter.next(); 
			    Object key = entry.getKey(); 
			    Object val = entry.getValue();
			    System.out.print(key+":"+val+" ");
			} 
			System.out.println();
		}
	}

	@Override
	public void insert(ReservVO reservVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(reservVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ReservVO reservVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(reservVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public List<ReservVO> findByDate(Calendar cal) {
		List<ReservVO> list = null;
		Calendar cal2 = Calendar.getInstance();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_DATE);
			query.setParameter(0, cal);
			cal2.setTime(cal.getTime());
			cal2.add(Calendar.DATE, 1);
			query.setParameter(1, cal2);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

}
