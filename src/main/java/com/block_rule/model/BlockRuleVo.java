package com.block_rule.model;

public class BlockRuleVo {
	private Short blockRuleNo;
	private String blockRule;
	private Integer blockLimitTimes;
	private Integer blockTime;
	
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
	
}
