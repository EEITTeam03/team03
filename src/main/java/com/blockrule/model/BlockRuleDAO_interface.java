package com.blockrule.model;

import java.util.List;
import java.util.Set;

import com.bocklist.model.BlockListVO;

public interface BlockRuleDAO_interface {
	public void insert(BlockRuleVO blockRuleVO);
	public void update(BlockRuleVO blockRuleVO);
	public void delete(Short blockRuleNo);
	public BlockRuleVO findByPrimaryKey(Short blockRuleNo);
    public List<BlockRuleVO> getAll();
    
    //查詢某黑單規則編號下的黑單會員清單(一對多)
    public Set<BlockListVO> getListsByBlockRuleNo(Short blockRuleNo);
	
}
