package com.blocklist.model;

import java.util.List;

import com.blockrule.model.BlockRuleVO;
import com.memberinfo.model.MemberInfoVO;

public class TestBlockList {
	
	public static void main(String[] args) {
		BlockListHibernateDAO dao = new BlockListHibernateDAO();
		
		BlockRuleVO blockRuleVO = new BlockRuleVO();
		blockRuleVO.setBlockRuleNo((short)2);		//設定黑單規則編號
		MemberInfoVO memberInfoVO = new MemberInfoVO();
		memberInfoVO.setMemberNo(1);				//設定會員編號
		
		/*新增黑單清單(代入FK: memberNo.blockRuleNo)*/
		BlockListVO blockListVO1 = new BlockListVO();
		blockListVO1.setReservationNo(1);	//PK
		blockListVO1.setViolationDate("2017-04-26");
		blockListVO1.setBlockState("1");	//nvarchar(2) 0:逾期作廢 1:未懲處 2:已懲處
		blockListVO1.setMemberInfoVO(memberInfoVO);	//代入上方設定的會員編號
		blockListVO1.setBlockRuleVO(blockRuleVO);	//代入上方設定的規則編號
		dao.insert(blockListVO1);
		
		/*修改黑單清單(代入FK: memberNo.blockRuleNo)*/
		BlockListVO blockListVO2 = new BlockListVO();
		blockListVO2.setReservationNo(1);	//PK
		blockListVO2.setViolationDate("2017-04-26");
		blockListVO2.setBlockState("2");	//nvarchar(2) 0:逾期作廢 1:未懲處 2:已懲處
		blockListVO2.setMemberInfoVO(memberInfoVO);
		blockListVO2.setBlockRuleVO(blockRuleVO);
		dao.update(blockListVO2);
		
		/*刪除黑單清單*/
		//dao.delete(1);
		
		/*主鍵搜尋黑單清單*/
		BlockListVO blockListVO3 = new BlockListVO();
		blockListVO3 = dao.findByPrimaryKey(1);
		if(blockListVO3 != null){
			System.out.print(blockListVO3.getReservationNo()+",");
			System.out.print(blockListVO3.getViolationDate()+",");
			System.out.print(blockListVO3.getBlockRuleVO().getBlockRuleNo()+" ");
			System.out.print(blockListVO3.getBlockRuleVO().getBlockRule()+",");
			System.out.print(blockListVO3.getMemberInfoVO().getMemberNo()+" ");
			System.out.print(blockListVO3.getMemberInfoVO().getMemberName()+",");
			System.out.println(blockListVO3.getBlockState());
		}else{System.out.println("----無------");}
		
		/*搜尋全部黑單清單*/
		List<BlockListVO> list1 = dao.getAll();
		for(BlockListVO aList : list1){
			System.out.print(aList.getReservationNo()+",");
			System.out.print(aList.getViolationDate()+",");
			System.out.print(aList.getBlockRuleVO().getBlockRuleNo()+" ");
			System.out.print(aList.getBlockRuleVO().getBlockRule()+",");
			System.out.print(aList.getMemberInfoVO().getMemberNo()+" ");
			System.out.print(aList.getMemberInfoVO().getMemberName()+",");
			System.out.println(aList.getBlockState());
		}
		
	}
}
