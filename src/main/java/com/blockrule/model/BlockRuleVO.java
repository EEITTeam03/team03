package com.blockrule.model;

import java.util.HashSet;
import java.util.Set;
import com.bocklist.model.BlockListVO;

public class BlockRuleVO {
	private Short blockRuleNo;
	private String blockRule;
	private Integer blockLimitTimes;
	private Integer blockTime;
	private Set<BlockListVO> blockLists = new HashSet<BlockListVO>();

	
	public Short getBlockRuleNo() {
		return blockRuleNo;
	}
	public void setBlockRuleNo(Short blockRuleNo) {
		this.blockRuleNo = blockRuleNo;
	}
	public String getBlockRule() {
		return blockRule;
	}
	public void setBlockRule(String blockRule) {
		this.blockRule = blockRule;
	}
	public Integer getBlockLimitTimes() {
		return blockLimitTimes;
	}
	public void setBlockLimitTimes(Integer blockLimitTimes) {
		this.blockLimitTimes = blockLimitTimes;
	}
	public Integer getBlockTime() {
		return blockTime;
	}
	public void setBlockTime(Integer blockTime) {
		this.blockTime = blockTime;
	}
	public Set<BlockListVO> getBlockLists() {
		return blockLists;
	}
	public void setBlockLists(Set<BlockListVO> blockLists) {
		this.blockLists = blockLists;
	}
	
}
