package com.membercars.controller;

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

/**
 * Servlet implementation class GetCars
 */
@WebServlet("/GetCars")
public class GetCars extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetCars() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
			String no = request.getParameter("no");
			if(no == null) {
				out.print("no input");
				return;
			}
			
			MembercarsService svc = new MembercarsService();
//			Integer no = memberInfoVO.getMemberNo();
			List<MemberCarsVO> list = svc.getListByMember(Integer.parseInt(no));
			
			List<Map<String,Object>> carList = new ArrayList<>();
//			Map<String,Map<String,Object>> carMap = new HashMap<>();
			
			for(MemberCarsVO aVO:list){
				Map<String,Object> cars = new HashMap<>();
				cars.put("license",aVO.getCarLicense());
				cars.put("modelNo", aVO.getCarTypeVO().getModelNo());
				cars.put("brand", aVO.getCarTypeVO().getBrand());
				cars.put("model",aVO.getCarTypeVO().getCarModel());
				cars.put("carClass", aVO.getCarTypeVO().getCarClassVO().getCarClass());
				carList.add(cars);
//				carMap.put(aVO.getCarLicense(), cars);
			}
			//柏元你今天的褲子很好看
			String jsonString = JSONValue.toJSONString(carList);
			out.print(jsonString);
			
//			Gson gson = new GsonBuilder().create();
//			String json = gson.toJson(list);
//			System.out.println(json);
//			out.print(json);
//			JSONObject json = new JSONObject();
		
//			ObjectMapper objMapper = new ObjectMapper();
//			objMapper.enable(SerializationFeature.INDENT_OUTPUT);
//			
//			String json = objMapper.writeValueAsString(list);
//			out.print(json);
		
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
