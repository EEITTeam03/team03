package com.test.model;

import java.util.List;

import com.servicecarclass.model.ServiceCarClassDAO_Hibernate;
import com.servicecarclass.model.ServiceCarClassVO;

public class Test {

	public static void main(String[] args) {
		
//		ServiceCarClassDAO_Hibernate dao = new ServiceCarClassDAO_Hibernate();
//		ServiceCarClassVO vo = dao.findByServAndClass(1002, "S");
//		System.out.println(vo.getServPrice());
//		System.out.println(vo.getServTime());
//		
//		Calendar cal1 = Calendar.getInstance();
//		Calendar cal2 = Calendar.getInstance();
//		
//		Date date = new Date();
//		System.out.println(date);
//		cal1.setTime(date);
//		System.out.println(cal1);
//		
//		cal2.setTimeInMillis(date.getTime()+4*60*60*1000);
//		System.out.println(cal2);
		
//		//借我測serviceService
//		ServicesService ss= new ServicesService();
//		ss.addService(Integer.valueOf(4001), "m", "123", "你好", null,Date.valueOf("2016-04-01"), "1");
//		
//		
//		System.out.println(cal1.before(cal2));
//		System.out.println(cal2.before(cal1));
//		System.out.println(cal1.after(cal2));
//		System.out.println(cal2.after(cal1));
//		
//		System.out.println("-------------");
//		if(cal1.getTimeInMillis() < cal2.getTimeInMillis())
//			System.out.println("QQ");
//		if(cal1.before(cal2) && cal2.before(cal1))
//			System.out.println("go");
		
//		ServiceStepDAO_Hibernate sdao=new ServiceStepDAO_Hibernate();
//		ServicesVO ssvo=new ServicesVO();
//		ssvo.setServNo(1001);
//		ServiceStepVO svo=new ServiceStepVO();
//		svo.setStepName("aa");
//		svo.setStepPic(null);
//		svo.setServStep(2);
//		svo.setStepDescp("bb");
//		svo.setServicesVO(ssvo);
//		ServiceStepService sss=new ServiceStepService();
//		sss.addServiceStep();
//		sdao.insert(svo);
//		System.out.println("完成");
//		ServiceStepService sss= new ServiceStepService();
//		sss.getDist();
//		System.out.println(sss.getDist());
		
//		ServicesService svc = new ServicesService();
//		List<Map> list = svc.getServicesJsonPriceTime("M");
//		for (Map map:list) {
//			
//		}
//		ServicesDAO_interface dao = new ServicesDAO_Hibernate();
//		List<ServicesVO> list = dao.getAllPriceTime("M");
//		
//		for (ServicesVO vo: list) {
//			System.out.println(vo.getServName());
//			ServiceCarClassVO cc = vo.getServiceCarClassVO().iterator().next();
//			System.out.println(cc.getServPrice());
//			System.out.println(cc.getServTime());
//		}
		ServiceCarClassDAO_Hibernate dao = new ServiceCarClassDAO_Hibernate();
		List<ServiceCarClassVO> list = dao.fnidBySize("M");
		
		for (ServiceCarClassVO vo:list) {
			System.out.println(vo.getServicesVO().getServNo());
			System.out.println(vo.getServicesVO().getServName());
			System.out.println(vo.getServPrice());
			System.out.println(vo.getServTime());
			System.out.println();
			
		}
		
	}

}
