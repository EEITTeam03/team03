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
	private static final String GET_BY_DATE_EMP="from ReservVO where reservDateTime between ? and ? AND employeeNo=? order by reservDateTime";
	private static final String ALL_STMT_Time="select min(reservDateTime) from ReservVO where reservDateTime > ? ";
	private static final String GET_TIME_BY_DATE="from ReservVO where reservDateTime between ? and ? order by reservDateTime";
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
		//測findTimeByDate
//		Calendar cal = Calendar.getInstance();
//		cal.set(2017,4,10);
//		
//		List<ReservVO>list = dao.findTimeByDate(cal);
		
//		List<ReservVO>list = dao.findByYear(cal);
//		List<ReservVO>list = dao.findByWeek(cal);
		
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
//
//			for(ReservListVO lists:relists){
//				System.out.println(lists.getReservListNo());
//
//				System.out.println(lists.getServicesVO().getServNo());
//				System.out.println(lists.getServName());
//				System.out.println(lists.getServPrice());
//				System.out.println(lists.getServTime());
//			}
//		}

//		ReservService reservice = new ReservService();
//		
//		List<Map> list = reservice.getScheduleForJSON();
//		for(Map map:list){
//			Iterator iter = map.entrySet().iterator(); 
//			while (iter.hasNext()) { 
//			    Map.Entry entry = (Map.Entry) iter.next(); 
//			    Object key = entry.getKey(); 
//			    Object val = entry.getValue();
//			    System.out.print(key+":"+val+" ");
//			} 
//			System.out.println();
//		}
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
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(cal.getTime());
		cal1.set(Calendar.HOUR_OF_DAY,0);
		cal1.set(Calendar.MINUTE,0);
		Calendar cal2 = Calendar.getInstance();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_DATE);
			query.setParameter(0, cal1);
			cal2.setTime(cal1.getTime());
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

	@Override
	public List<ReservVO> findByYear(Calendar cal) {
		// TODO Auto-generated method stub
		List<ReservVO> list = null;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Calendar cal3 = Calendar.getInstance();
			cal3.setTime(cal.getTime());
			//cal3.set(2017,4,8);
			Query query = session.createQuery(GET_BY_DATE);
			
			//神奇的下一行
			//System.out.println(cal.get(Calendar.DATE));
			cal.get(Calendar.DATE);
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));						
			
			System.out.println(cal.get(Calendar.DAY_OF_MONTH));
			query.setParameter(0, cal);
			
			//神奇的下一行
			//System.out.println(cal3.get(Calendar.DATE));
			
			cal3.get(Calendar.DATE);
			cal3.set(Calendar.DAY_OF_MONTH, cal3.getActualMaximum(Calendar.DAY_OF_MONTH));
			System.out.println(cal3.get(Calendar.DAY_OF_MONTH));

			query.setParameter(1, cal3);
			
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<ReservVO> findByWeek(Calendar cal) {
		// TODO Auto-generated method stub
		List<ReservVO> list = null;
		Calendar cal3 = Calendar.getInstance();
		cal3.setTime(cal.getTime());	
		/*Calendar沒辦法new，只能使用他的方法取得該物件
		 但用getInstance()會取到今天日期，
		 因此testForGetJSON.jsp 只能輸入:2017-05-03以前的值，且區間不是會是week。---輸入3/20會出現0320~0503的所有資料。
		=>加上 cal3.setTime(cal.getTime()); 將指定日期設給Calendar
		 */
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			
			session.beginTransaction();
			
			//cal3.set(2017,4,8);
			Query query = session.createQuery(GET_BY_DATE);
			
			//神奇的下一行
			//System.out.println(cal.get(Calendar.DATE));
			cal.get(Calendar.DATE);
			cal.set(Calendar.DAY_OF_WEEK, cal.getActualMinimum(Calendar.DAY_OF_WEEK));						
			
			System.out.println(cal.get(Calendar.DATE));
			query.setParameter(0, cal);
			
			//神奇的下一行
			//System.out.println(cal3.get(Calendar.DATE));
			cal3.get(Calendar.DATE);
			cal3.set(Calendar.DAY_OF_WEEK, cal3.getActualMaximum(Calendar.DAY_OF_WEEK));
			cal3.add(Calendar.DATE, 1);
			System.out.println(cal3.get(Calendar.DATE));
			
			query.setParameter(1, cal3);
			
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
		//return null;
	}

	@Override
	public List<ReservVO> findByDateAndEmp(Calendar cal, Integer empNo) {
		List<ReservVO> list = null;
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(cal.getTime());
		cal1.set(Calendar.HOUR_OF_DAY,0);
		cal1.set(Calendar.MINUTE,0);
		Calendar cal2 = Calendar.getInstance();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_DATE_EMP);
			query.setParameter(0, cal1);
			cal2.setTime(cal1.getTime());
			cal2.add(Calendar.DATE, 1);
			query.setParameter(1, cal2);
			query.setParameter(2, empNo);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<Object> getAllOrderByTime(Calendar cal) {
		List<Object>list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(ALL_STMT_Time);
			query.setParameter(0, cal);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<ReservVO> findTimeByDate(Calendar cal) {
		
		List<ReservVO> list = null;
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(cal.getTime());
		cal1.set(Calendar.HOUR_OF_DAY,0);
		cal1.set(Calendar.MINUTE,0);
		Calendar cal2 = Calendar.getInstance();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_TIME_BY_DATE);
			query.setParameter(0, cal1);
			cal2.setTime(cal1.getTime());
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
