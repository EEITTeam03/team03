package com.blockrule.model;

import java.util.List;

import com.blocklist.model.BlockListVO;

public class BlockRuleService {
	private BlockRuleDAO_interface dao;
	public BlockRuleService(){
		dao=new BlockRuleHibernateDAO();
	}
	public List<BlockRuleVO> getAllRule(){
		return dao.getAll();
	}
}
