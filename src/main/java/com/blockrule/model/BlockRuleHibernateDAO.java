package com.blockrule.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import com.blocklist.model.BlockListVO;
import hibernate.util.HibernateUtil;

public class BlockRuleHibernateDAO implements BlockRuleDAO_interface {
	
	private static final String GET_ALL_STMT = "FROM BlockRuleVO ORDER BY blockRuleNo";
	
	
	@Override
	public void insert(BlockRuleVO blockRuleVO){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(blockRuleVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(BlockRuleVO blockRuleVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(blockRuleVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Short blockRuleNo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			BlockRuleVO blockRuleVO = (BlockRuleVO) session.get(BlockRuleVO.class, blockRuleNo);
			session.delete(blockRuleVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
	}

	@Override
	public BlockRuleVO findByPrimaryKey(Short blockRuleNo) {
		BlockRuleVO blockRuleVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			blockRuleVO = (BlockRuleVO) session.get(BlockRuleVO.class, blockRuleNo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return blockRuleVO;
	}

	@Override
	public List<BlockRuleVO> getAll() {
		List<BlockRuleVO> list = new ArrayList<BlockRuleVO>();
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
	public Set<BlockListVO> getListsByBlockRuleNo(Short blockRuleNo) {
			
		Set<BlockListVO> set = findByPrimaryKey(blockRuleNo).getBlockLists();
		return set;
	}

}