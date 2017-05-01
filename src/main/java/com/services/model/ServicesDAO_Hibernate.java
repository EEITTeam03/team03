package com.services.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.hibernate.Query;
import org.hibernate.Session;

import com.servicecarclass.model.ServiceCarClassVO;
import com.servicestep.model.ServiceStepVO;

import hibernate.util.HibernateUtil;

public class ServicesDAO_Hibernate implements ServicesDAO_interface {
	// 照servNo去選全部
	private static final String GET_ALL_STMT = "FROM ServicesVO order by servNo";
	// 照去選全部
	private static final String GET_ALL_servTypeNo_STMT = "FROM ServicesVO order by servTypeNo";
	// 選取所有日期去排序的
	private static final String GET_ALL_servEffectiveDate_STMT = "FROM ServicesVO order by servEffectiveDate";
	// 照servTypeNo選單個的
	private static final String GET_ONE_servTypeNo_STMT = "FROM ServicesVO where servTypeNo=?";
	// 依servDate選單一年分
	private static final String GET_ONE_servEffectiveDate_STMT = "FROM ServicesVO where DATEPART(yyyy,servEffectiveDate)=?";
	// 依servDate選單月分
	private static final String GET_ONE_MonthDate_STMT = "FROM ServicesVO where DATEPART(mm,servEffectiveDate)=?";

	private static final String DELETE = "DELETE FROM ServicesVO where servNo =?";

	@Override
	public void insert(ServicesVO servo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(servo);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void update(ServicesVO servo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(servo);
			session.getTransaction().commit();

		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void delete(Integer servNo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {

			session.beginTransaction();
			ServicesVO serVO = (ServicesVO) session.get(ServicesVO.class, servNo);
			// Query query = session.createQuery(DELETE);
			// query.setParameter(0, servNo);
			session.delete(serVO);
			// serVO.setServNo(servNo);

			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public ServicesVO findByPrimaryKey(Integer servNo) {
		ServicesVO serVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			serVO = (ServicesVO) session.get(ServicesVO.class, servNo);
			session.getTransaction().commit();

		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return serVO;
	}

	@Override
	public List<ServicesVO> findType(String servTypeNo) {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ONE_servTypeNo_STMT).setParameter(0, servTypeNo);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> findYear(String servEffectiveDate) {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ONE_servEffectiveDate_STMT).setParameter(0,
					servEffectiveDate);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> findMonth(String servEffectiveDate) {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ONE_MonthDate_STMT).setParameter(0, servEffectiveDate);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> getAll() {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> getAllType() {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ALL_servTypeNo_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public List<ServicesVO> getAllDate() {
		List<ServicesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = (Query) session.createQuery(GET_ALL_servEffectiveDate_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

	@Override
	public Set<ServiceCarClassVO> getCarClassByServNo(Integer servNo) {
		Set<ServiceCarClassVO> set = findByPrimaryKey(servNo).getServiceCarClassVO();
		return set;
	}

	@Override
	public Set<ServiceStepVO> getservStepByServNo(Integer servNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 本方法調整fileName的長度小於或等於maxLength。
	// 如果fileName的長度小於或等於maxLength，直接傳回fileName
	// 否則保留最後一個句點與其後的附檔名，縮短主檔名使得fileName的總長度
	// 等於maxLength。
	public String adjustFileName(String fileName, int maxLength) {
		int length = fileName.length();
		if (length <= maxLength) {
			return fileName;
		}
		int n = fileName.lastIndexOf(".");
		int sub = fileName.length() - n - 1;
		fileName = fileName.substring(0, maxLength - 1 - sub) + "." + fileName.substring(n + 1);
		return fileName;
	}

	public String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	// 此方法可檢視上傳資料的每個欄位與每個檔案，
	public Collection<Part> exploreParts(Collection<Part> parts, HttpServletRequest req) {
		try {
			for (Part part : parts) {
				String name = part.getName();
				String contentType = part.getContentType();
				String value = "";
				long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
				InputStream is = part.getInputStream();
				if (contentType != null) { // 表示該part為檔案
					// 取出上傳檔案的檔名
					ServicesDAO_Hibernate sdao = new ServicesDAO_Hibernate();
					String filename = sdao.getFileName(part);
					// 將上傳的檔案寫入到location屬性所指定的資料夾
					if (filename != null && filename.trim().length() > 0) {
						part.write(filename);
						System.out.println(part.getClass().getName());
					}
				} else { // 表示該part為一般的欄位
					// 將上傳的欄位資料寫入到location屬性所指定的資料夾，檔名為"part_"+ name
					part.write("part_" + name);
					value = req.getParameter(name);
				}
				System.out.printf("%-15s %-15s %8d  %-20s \n", name, contentType, size, value);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return parts;
	}

}
