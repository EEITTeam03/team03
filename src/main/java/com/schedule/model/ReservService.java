package com.schedule.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsVO;
import com.reservlist.model.ReservListVO;


public class ReservService {
	private ReservDAO_interface dao;

	public ReservService() {
		dao = new ReservDAO();
	}

	public ReservVO addReservAndList(Calendar reservDateTime, Calendar reservEndTime, MemberCarsVO membercarsVO,
			String noteC, String notesE, EmployeeVO employeeVO, Integer status, Set<ReservListVO> reservlists) {

		ReservVO reservVO = new ReservVO();
		reservVO.setReservDateTime(reservDateTime);
		reservVO.setReservEndTime(reservEndTime);
		reservVO.setMembercarsVO(membercarsVO);
		reservVO.setNoteC(noteC);
		reservVO.setNotesE(notesE);
		reservVO.setStatus(status);
		reservVO.setEmployeeVO(employeeVO);

		reservVO.setReservlists(reservlists);

		return reservVO;
	}

	public ReservVO addReserv(Calendar reservDateTime, MemberCarsVO membercarsVO, String noteC, String notesE,
			EmployeeVO employeeVO, Integer status, Set<ReservListVO> reservlists) {

		ReservVO reservVO = new ReservVO();

		reservVO.setReservDateTime(reservDateTime);
		reservVO.setMembercarsVO(membercarsVO);
		reservVO.setNoteC(noteC);
		reservVO.setNotesE(notesE);
		reservVO.setStatus(status);
		reservVO.setEmployeeVO(employeeVO);
		reservVO.setReservlists(reservlists);
		dao.insert(reservVO);
		return reservVO;
	}

	public ReservVO updateReserv(Integer reservNo, Calendar reservDateTime, String noteC, String notesE, Integer status,
			MemberCarsVO membercarsVO, EmployeeVO employeeVO, Set<ReservListVO> reservlists) {
		ReservVO reservVO = new ReservVO();
		reservVO.setReservNo(reservNo);
		reservVO.setReservDateTime(reservDateTime);
		reservVO.setNoteC(noteC);
		reservVO.setNotesE(notesE);
		reservVO.setStatus(status);
		reservVO.setMembercarsVO(membercarsVO);
		reservVO.setEmployeeVO(employeeVO);
		reservVO.setReservlists(reservlists);
		dao.update(reservVO);
		return dao.findByPrimaryKey(reservNo);
	}

	public List<ReservVO> getAll() {
		return dao.getAll();
	}

	public List<ReservVO> AllOrderByTime(Calendar cal) {
		return dao.findTimeByDate(cal);
	}

	public ReservVO getOneReserv(Integer reservNo) {
		return dao.findByPrimaryKey(reservNo);
	}

	// public List<Map>getScheduleForJSON(){
	// List<ReservVO> list = dao.getAll();
	// List<Map> list2 = new ArrayList<Map>() ;
	// Calendar calendar = Calendar.getInstance();
	// //calendar.set(2017,Calendar.APRIL,30);
	// calendar.set(2017,4,8);
	// int week = calendar.get(Calendar.WEEK_OF_YEAR);
	// for(ReservVO reserv:list){
	// if(calendar.get(Calendar.YEAR)==reserv.getReservDateTime().get(Calendar.YEAR))
	// {
	// if(week==reserv.getReservDateTime().get(Calendar.WEEK_OF_YEAR))
	// {
	// int year=reserv.getReservDateTime().get(Calendar.YEAR);
	// int month=reserv.getReservDateTime().get(Calendar.MONTH)+1;
	// int day = reserv.getReservDateTime().get(Calendar.DATE);
	// int hour = reserv.getReservDateTime().get(Calendar.HOUR_OF_DAY);
	// int minute = reserv.getReservDateTime().get(Calendar.MINUTE);
	// int dayOfWeek = reserv.getReservDateTime().get(Calendar.DAY_OF_WEEK)-1;
	// int totalTime=0;
	// Map map = new LinkedHashMap();
	// map.put("EmpName", reserv.getEmployeeVO().getEmployeeName());
	// map.put("Year", year);
	// map.put("Month", month);
	// map.put("Day", day);
	// map.put("DayOfWeek", dayOfWeek);
	// if(minute==0)
	// map.put("Start", hour+":"+minute+'0');
	// else
	// map.put("Start", hour+":"+minute);
	//
	// List <String> service = new <String>ArrayList();
	// for(ReservListVO rl:reserv.getReservlists()){
	// totalTime+=rl.getServTime();
	// service.add(rl.getServName()+" ");
	// }
	//
	// int Endminute = (minute+totalTime)%60;
	// int EndHour =hour+ (minute+totalTime)/60;
	// if(Endminute==0)
	// map.put("End", EndHour+":"+Endminute+'0');
	// else
	// map.put("End", EndHour+":"+Endminute);
	//
	// map.put("TotalTime", totalTime);
	// map.put("Item", service);
	// map.put("License",reserv.getMembercarsVO().getCarLicense());
	// list2.add(map);
	// }
	// }
	// }
	// return list2;
	// }

	public List<Map> getScheduleForJSON(Calendar calendar) {
		// Calendar calendar = Calendar.getInstance();
		// calendar.set(2017,Calendar.APRIL,30);
		// calendar.set(2017,4,8);
		List<ReservVO> list = dao.findByWeek(calendar);
		List<Map> list2 = new ArrayList<Map>();
		// int week = calendar.get(Calendar.WEEK_OF_YEAR);
		for (ReservVO reserv : list) {
			if (reserv.getStatus() != 0) {
				int year = reserv.getReservDateTime().get(Calendar.YEAR);
				// System.out.println(reserv.getReservDateTime().get(Calendar.DATE));
				int month = reserv.getReservDateTime().get(Calendar.MONTH) + 1;
				int day = reserv.getReservDateTime().get(Calendar.DATE);
				int hour = reserv.getReservDateTime().get(Calendar.HOUR_OF_DAY);
				int minute = reserv.getReservDateTime().get(Calendar.MINUTE);
				int dayOfWeek = reserv.getReservDateTime().get(Calendar.DAY_OF_WEEK) - 1;
				int totalTime = 0;
				Map map = new LinkedHashMap();
				map.put("ReservNo", reserv.getReservNo());
				map.put("EmpName", reserv.getEmployeeVO().getEmployeeName());
				map.put("EmpNo", reserv.getEmployeeVO().getEmployeeNo());
				map.put("Year", year);
				map.put("Month", month);
				map.put("Day", day);
				map.put("DayOfWeek", dayOfWeek);
				if (minute == 0)
					map.put("Start", hour + ":" + minute + '0');
				else
					map.put("Start", hour + ":" + minute);

				List<Integer> servNolistM = new ArrayList<Integer>();
				List<Integer> servNolistS = new ArrayList<Integer>();
				List<String> service = new <String>ArrayList();
				for (ReservListVO rl : reserv.getReservlists()) {
					totalTime += rl.getServTime();
					service.add(rl.getServName() + " ");
					if (rl.getServicesVO().getServNo() < 2000) {
						servNolistM.add(rl.getServicesVO().getServNo());
					} else
						map.put("Radio", rl.getServicesVO().getServNo());
				}

				int Endminute = (minute + totalTime) % 60;
				int EndHour = hour + (minute + totalTime) / 60;
				if (Endminute == 0)
					map.put("End", EndHour + ":" + Endminute + '0');
				else
					map.put("End", EndHour + ":" + Endminute);

				map.put("TotalTime", totalTime);
				// map.put("Radio", servNolistS);
				map.put("CheckBox", servNolistM);
				map.put("Item", service);
				map.put("License", reserv.getMembercarsVO().getCarLicense());
				map.put("NoteC", reserv.getNoteC());
				map.put("NoteE", reserv.getNotesE());
				map.put("Status", reserv.getStatus());
				list2.add(map);
			}
		}
		return list2;
	}

	public List<Map> getYearScheduleForJSON(Calendar calendar) {
		// Calendar calendar = Calendar.getInstance();
		// calendar.set(2017,Calendar.APRIL,30);
		// calendar.set(2017,4,8);
		List<ReservVO> list = dao.findByYear(calendar);
		List<Map> list2 = new ArrayList<Map>();
		// int week = calendar.get(Calendar.WEEK_OF_YEAR);
		for (ReservVO reserv : list) {
			if (reserv.getStatus() != 0) {
				int year = reserv.getReservDateTime().get(Calendar.YEAR);
				// System.out.println(reserv.getReservDateTime().get(Calendar.DATE));
				int month = reserv.getReservDateTime().get(Calendar.MONTH) + 1;
				int day = reserv.getReservDateTime().get(Calendar.DATE);
				int hour = reserv.getReservDateTime().get(Calendar.HOUR_OF_DAY);
				int minute = reserv.getReservDateTime().get(Calendar.MINUTE);
				int dayOfWeek = reserv.getReservDateTime().get(Calendar.DAY_OF_WEEK) - 1;
				int totalTime = 0;
				Map map = new LinkedHashMap();
				map.put("ReservNo", reserv.getReservNo());
				map.put("EmpName", reserv.getEmployeeVO().getEmployeeName());
				map.put("EmpNo", reserv.getEmployeeVO().getEmployeeNo());
				map.put("Year", year);
				map.put("Month", month);
				map.put("Day", day);
				map.put("DayOfWeek", dayOfWeek);
				if (minute == 0)
					map.put("Start", hour + ":" + minute + '0');
				else
					map.put("Start", hour + ":" + minute);

				List<Integer> servNolistM = new ArrayList<Integer>();
				List<Integer> servNolistS = new ArrayList<Integer>();
				List<String> service = new <String>ArrayList();
				for (ReservListVO rl : reserv.getReservlists()) {
					totalTime += rl.getServTime();
					service.add(rl.getServName() + " ");
					if (rl.getServicesVO().getServNo() < 2000) {
						servNolistM.add(rl.getServicesVO().getServNo());
					} else
						map.put("Radio", rl.getServicesVO().getServNo());
				}

				int Endminute = (minute + totalTime) % 60;
				int EndHour = hour + (minute + totalTime) / 60;
				if (Endminute == 0)
					map.put("End", EndHour + ":" + Endminute + '0');
				else
					map.put("End", EndHour + ":" + Endminute);

				map.put("TotalTime", totalTime);
				// map.put("Radio", servNolistS);
				map.put("CheckBox", servNolistM);
				map.put("Item", service);
				map.put("License", reserv.getMembercarsVO().getCarLicense());
				map.put("NoteC", reserv.getNoteC());
				map.put("NoteE", reserv.getNotesE());
				if (reserv.getStatus() != 0)
					map.put("Status", reserv.getStatus());
				list2.add(map);
			}
		}
		return list2;
	}

	public List<Map> getOneDayForJSON(Calendar calendar) {
		List<ReservVO> list = dao.findByDate(calendar);
		List<Map> list2 = new ArrayList<Map>();
		for (ReservVO reserv : list) {
			if (reserv.getStatus() != 0) {
				int year = reserv.getReservDateTime().get(Calendar.YEAR);
				// System.out.println(reserv.getReservDateTime().get(Calendar.DATE));
				int month = reserv.getReservDateTime().get(Calendar.MONTH) + 1;
				int day = reserv.getReservDateTime().get(Calendar.DATE);
				int hour = reserv.getReservDateTime().get(Calendar.HOUR_OF_DAY);
				int minute = reserv.getReservDateTime().get(Calendar.MINUTE);
				int dayOfWeek = reserv.getReservDateTime().get(Calendar.DAY_OF_WEEK) - 1;
				int totalTime = 0;
				Map map = new LinkedHashMap();
				map.put("ReservNo", reserv.getReservNo());
				// map.put("servNo", reserv.getReservlists());
				map.put("EmpName", reserv.getEmployeeVO().getEmployeeName());
				map.put("EmpNo", reserv.getEmployeeVO().getEmployeeNo());
				map.put("Year", year);
				map.put("Month", month);
				map.put("Day", day);
				map.put("DayOfWeek", dayOfWeek);
				if (minute == 0)
					map.put("Start", hour + ":" + minute + '0');
				else
					map.put("Start", hour + ":" + minute);
				List<Integer> servNolistM = new ArrayList<Integer>();
				List<Integer> servNolistS = new ArrayList<Integer>();
				List<String> service = new <String>ArrayList();
				for (ReservListVO rl : reserv.getReservlists()) {
					totalTime += rl.getServTime();
					service.add(rl.getServName() + " ");
					if (rl.getServicesVO().getServNo() < 2000) {
						servNolistM.add(rl.getServicesVO().getServNo());
					} else
						map.put("Radio", rl.getServicesVO().getServNo());
					;
				}

				int Endminute = (minute + totalTime) % 60;
				int EndHour = hour + (minute + totalTime) / 60;
				if (Endminute == 0)
					map.put("End", EndHour + ":" + Endminute + '0');
				else
					map.put("End", EndHour + ":" + Endminute);

				map.put("TotalTime", totalTime);
				// map.put("Radio", servNolistS);
				map.put("CheckBox", servNolistM);
				map.put("Item", service);
				map.put("License", reserv.getMembercarsVO().getCarLicense());
				map.put("NoteC", reserv.getNoteC());
				map.put("NoteE", reserv.getNotesE());
				if (reserv.getStatus() != 0)
					map.put("Status", reserv.getStatus());
				list2.add(map);
			}
		}
		return list2;
	}

	public List<ReservVO> getAllReservByDate(Calendar cal) {
		return dao.findByDate(cal);
	}
	
	public List<ReservVO> getAllReservByWeek(Calendar cal) {
		return dao.findByWeek(cal);
	}

	public List<ReservVO> getAllReservByDateAndEmp(Calendar cal, Integer empNo) {
		return dao.findByDateAndEmp(cal, empNo);
	}
	
	public List<ReservVO> getAllReservByWeekAndEmp(Calendar cal, Integer empNo) {
		return dao.findByWeekAndEmp(cal, empNo);
	}
	
	public List<ReservVO> fingReservNoByLicense(String license) {
		return dao.fingReservNoByLicense(license);
	}
}
