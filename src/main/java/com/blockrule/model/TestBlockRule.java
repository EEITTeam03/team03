package com.blockrule.model;

import java.util.List;
import java.util.Set;

import com.blocklist.model.BlockListVO;

public class TestBlockRule {

	public static void main(String[] args) {
		BlockRuleHibernateDAO dao = new BlockRuleHibernateDAO();
		
		/*新增黑單規則*/
		BlockRuleVO blockRuleVO = new BlockRuleVO();
		blockRuleVO.setBlockRuleNo((short)3);
		blockRuleVO.setBlockRule("太奧客0");
		blockRuleVO.setBlockLimitTimes(5);
		blockRuleVO.setBlockTime(60);
		dao.insert(blockRuleVO);
		
		/*修改黑單規則*/
		BlockRuleVO blockRuleVO2 = new BlockRuleVO();
		blockRuleVO2.setBlockRuleNo((short)3);
		blockRuleVO2.setBlockRule("太奧客2");
		blockRuleVO2.setBlockLimitTimes(5);
		blockRuleVO2.setBlockTime(60);
		dao.update(blockRuleVO2);
		
		/*刪除黑單規則*/
		//dao.delete((short)3);
		
		/*主鍵搜尋黑單規則*/
		BlockRuleVO blockRuleVO3 = new BlockRuleVO();
		blockRuleVO3 = dao.findByPrimaryKey((short)2);
		if(blockRuleVO3 !=null){
			System.out.print(blockRuleVO3.getBlockRuleNo()+",");
			System.out.print(blockRuleVO3.getBlockRule()+",");
			System.out.print(blockRuleVO3.getBlockLimitTimes()+",");
			System.out.println(blockRuleVO3.getBlockTime());
		}else{System.out.println("----無------");}
		
		/*搜尋全部黑單規則*/
		List<BlockRuleVO> list1 = dao.getAll();
		for(BlockRuleVO aRule : list1){
			System.out.print(aRule.getBlockRuleNo()+",");
			System.out.print(aRule.getBlockRule()+",");
			System.out.print(aRule.getBlockLimitTimes()+",");
			System.out.println(aRule.getBlockTime());
		}
		
		/*搜尋"全部違反規則2"的黑單清單---blockrule.hbm.xml需改lazy="false"*/
//		Set<BlockListVO> set = dao.getListsByBlockRuleNo((short)2);
//		for(BlockListVO aList : set){
//			System.out.print(aList.getReservationNo()+",");
//			System.out.print(aList.getViolationDate()+",");
//			System.out.print(aList.getBlockRuleVO().getBlockRuleNo()+" ");
//			System.out.print(aList.getBlockRuleVO().getBlockRule()+",");
//			System.out.print(aList.getMemberInfoVO().getMemberNo()+" ");
//			System.out.print(aList.getMemberInfoVO().getMemberName()+",");
//			System.out.println(aList.getBlockState());
//		}
		
	}
}
