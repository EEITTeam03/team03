package myutil;

import java.util.Calendar;
import java.util.List;

import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;

public class CheckConflict {

	public boolean checkDateAndEmp(Calendar cal, Calendar calEnd, Integer emp) {

		ReservService rsvc = new ReservService();
		List<ReservVO> list = rsvc.getAllReservByDateAndEmp(cal, emp);
		for (ReservVO aReserve : list) {
			Calendar acal = aReserve.getReservDateTime();
			Calendar acalEnd = aReserve.getReservEndTime();
			long tstart = cal.getTimeInMillis();
			long tend = calEnd.getTimeInMillis();
			long xstart = acal.getTimeInMillis();
			long xend = acalEnd.getTimeInMillis();

			if (xstart < tstart && xend <= tstart) {
				// System.out.println("前OK");
			} else if (xstart > tstart && xstart >= tend) {
				// System.out.println("後OK");
			} else {
				return true;
			}

		}
		return false;
	}
	
	public boolean checkDateAndEmpUpdate(Calendar cal, Calendar calEnd, Integer emp,Integer reservNo) {

		ReservService rsvc = new ReservService();
		List<ReservVO> list = rsvc.getAllReservByDateAndEmp(cal, emp);
		for (ReservVO aReserve : list) {
			Calendar acal = aReserve.getReservDateTime();
			Calendar acalEnd = aReserve.getReservEndTime();
			long tstart = cal.getTimeInMillis();
			long tend = calEnd.getTimeInMillis();
			long xstart = acal.getTimeInMillis();
			long xend = acalEnd.getTimeInMillis();
			if (aReserve.getReservNo() == reservNo) {
				if (xstart < tstart && xend <= tstart) {
					// System.out.println("前OK");
				} else if (xstart > tstart && xstart >= tend) {
					// System.out.println("後OK");
				} else if (xstart == tstart && xend == tend) {

				} else {
					return true;
				}
			} else {
				if (xstart < tstart && xend <= tstart) {
					// System.out.println("前OK");
				} else if (xstart > tstart && xstart >= tend) {
					// System.out.println("後OK");
				} else {
					return true;
				}
			}
		}
		return false;
	}
//	for(ReservVO aReserve :list){
//	Calendar acal = aReserve.getReservDateTime();
//	Calendar acalEnd = aReserve.getReservEndTime();
//	//long et = acalEnd.getTimeInMillis()-1;
//	
//	if(acal.before(cal) && acalEnd.before(cal)){
//		//System.out.println("OK前");
//	}else if (acal.after(cal) && acal.after(calEnd)){
//		//System.out.println("OK後");
//	}else {
//		errmsg.add("所選的時段重複!");
//	}
	
}
