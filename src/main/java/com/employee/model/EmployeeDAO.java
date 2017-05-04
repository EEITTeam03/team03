package com.employee.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class EmployeeDAO implements EmployeeDAO_interface {
	private static final String GET_ALL_STMT = "from EmployeeVO order by employeeNo";

	@Override
	public void insert(EmployeeVO employeeVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException rx) {
			session.getTransaction().rollback();
			throw rx;
		}
	}

	@Override
	public void update(EmployeeVO employeeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException rx) {
			session.getTransaction().rollback();
			throw rx;
		}
	}

	@Override
	public List<EmployeeVO> getAll() {
		List<EmployeeVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException rx) {
			session.getTransaction().rollback();
		}
		return list;
	}

	@Override
	public EmployeeVO findByPrimaryKey(Integer employeeNo) {
		// TODO Auto-generated method stub
		EmployeeVO empVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			empVO = (EmployeeVO) session.get(EmployeeVO.class, employeeNo);
			session.getTransaction().commit();
		} catch (RuntimeException rx) {
			session.getTransaction().rollback();
		}
		return empVO;
	}

	@Override
	public void delete(Integer employeeNo) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		EmployeeVO empVO = null;
		try {
			session.beginTransaction();
			empVO = (EmployeeVO) session.get(EmployeeVO.class, employeeNo);
			session.delete(empVO);
			session.getTransaction().commit();
		} catch (RuntimeException rx) {
			session.getTransaction().rollback();
		}
	}

	public static void main(String[] args) {
		// 新增
		EmployeeDAO dao = new EmployeeDAO();
		EmployeeVO emp = new EmployeeVO();
		// emp.setEmployeeNo(4);
		// emp.setEmployeeName("詹創凱");
		// dao.insert(emp);

		// 修改
		// EmployeeDAO dao = new EmployeeDAO();
		// EmployeeVO emp = new EmployeeVO();
		// emp.setEmployeeNo(1);
		// emp.setEmployeeName("周伯通");
		// dao.update(emp);

		// delete
		// dao.delete(4);

		// 查全部
		// List<EmployeeVO>list = dao.getAll();
		// for(EmployeeVO emp2:list){
		// System.out.println(emp2.getEmployeeNo());
		// System.out.println(emp2.getEmployeeName());
		// }

		// 查一個
//		emp = dao.findByPrimaryKey(2);
//		System.out.println(emp.getEmployeeNo());
//		System.out.println(emp.getEmployeeName());

	}

}
