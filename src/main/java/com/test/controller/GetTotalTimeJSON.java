package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;
import com.servicecarclass.model.ServiceCarClassService;
import com.servicecarclass.model.ServiceCarClassVO;

/**
 * Servlet implementation class GetTotalTimeJSON
 */
@WebServlet("/GetTotalTimeJSON")
public class GetTotalTimeJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTotalTimeJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out =response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String license = request.getParameter("license"); //取得車牌
		String serviceS = request.getParameter("serviceS"); //取得單選的服務
		String serviceM = request.getParameter("serviceM");//取得多選服務
		
		if(license == null||serviceS==null) {
			out.print("no input");
			return;
		}
		
		
		Integer SS = Integer.valueOf(serviceS);
		
		List<Map<String,Object>> JSONlist = new ArrayList<>();
		
		
		
		MembercarsService mcs = new MembercarsService();
		MemberCarsVO mcv = mcs.getOneByPK(license);
		String carSize= mcv.getCarTypeVO().getCarClassVO().getCarClass();
		ServiceCarClassService sccs = new ServiceCarClassService();
		ServiceCarClassVO sccVO = sccs.getOneServiceCarClass(SS, carSize);
		
		Integer sTime=0;
		if(sccVO.getServTime()!=null) 
			sTime = sccVO.getServTime(); //得到單選服務的時間了
		
		List<Integer> list = new ArrayList<Integer>();
		Integer mTime=0;
		Integer MM=null;
		if(serviceM!=null){
			String[] M= serviceM.split(",");
			//計算多選服務的時間
			for(int i=0;i<M.length;i++){
				MM = Integer.valueOf(M[i]);
				ServiceCarClassVO mmVO = sccs.getOneServiceCarClass(MM,carSize );
				mTime += mmVO.getServTime(); 
				list.add(MM);
			}
		}
		
		Integer TTime = sTime + mTime; //單選和多選總共需要的時間
		Map<String,Object> map = new HashMap<>();
		map.put("total", TTime);
		map.put("buttons", TTime/30+1);
		JSONlist.add(map);
		String jsonString = JSONValue.toJSONString(JSONlist);
		out.print(jsonString);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
