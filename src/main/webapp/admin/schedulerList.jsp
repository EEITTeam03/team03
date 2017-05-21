<%-- <%@page import="myutil.MyUtil"%> --%>
<%-- <%@page import="java.util.Calendar"%> --%>
<%@page import="com.employee.model.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	//pageContext.setAttribute("todayDate", MyUtil.formatCalender(Calendar.getInstance()));

	EmployeeService es = new EmployeeService();
	pageContext.setAttribute("empList",es.getAll());
	pageContext.setAttribute("empList2",es.getAll());	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>預約清單</title>  
<!--美美的icon-->
<link rel="icon" href="favicon.ico" type="image/x-icon" />

</head>
<body>
	<jsp:include page="Testhead_nav.jsp" />
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="table-responsive">
				<h2 class="text-center">預約清單</h2>
			<div class="row">
			<div class="col-lg-6">
				<center>
				<form action="SchedulerListServlet" method="post">
						<div class="alert alert-success" role="alert">日檢視</div>
						<label>日期: </label><input type="text" id="searchDate" name="searchDate" value="${param.searchDate}"/><br>
							<p><Font color='red' >${ErrorMsgKey.DateEmptyError}</Font></p>
							
							<!-- <div class="btn-group" data-toggle="buttons"> -->
							<label class="btn btn-success">
						    	<input type="radio" name="emps" value="0" autocomplete="off" checked> 所有師傅
						  	</label>
							<c:forEach var="empList" items="${empList}">
								<label class="btn btn-success">
									<input type="radio" name="emps" value="${empList.employeeNo }" autocomplete="off"> ${empList.employeeName }
								</label>
							</c:forEach>
						<br><br>
						<input type="hidden" name="action" value="searchDate">
						<button type="submit" id="btn_searchDate" class="btn btn-success">送出</button><br>
				</form></center>
			</div>
				
			<div class="col-lg-6">
				<center>
				<form action="SchedulerListServlet" method="post">
						<div class="alert alert-warning" role="alert">週檢視</div>
						<label>日期: </label><input type="text" id="searchWeek" name="searchWeek" value="${param.searchWeek}"/><br>
							<p><Font color='red' >${ErrorMsgKey.DateEmptyError}</Font></p>
							
							<!-- <div class="btn-group" data-toggle="buttons"> -->
							<label class="btn btn-warning">
						    	<input type="radio" name="emps" value="0" autocomplete="off" checked> 所有師傅
						  	</label>
							<c:forEach var="empList" items="${empList2}">
								<label class="btn btn-warning">
									<input type="radio" name="emps" value="${empList.employeeNo }" autocomplete="off"> ${empList.employeeName }
								</label>
							</c:forEach>
						<br><br>
						<input type="hidden" name="action" value="searchWeek">
						<button type="submit" id="btn_searchWeek" class="btn btn-warning">送出</button><br>
				</form></center>
			</div>
			</div>
			<div class="row">
			<div class="col-lg-12">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="info">
							<th>師傅</th>
							<th>訂單編號</th>
							<th>姓名</th>
							<th>車牌</th>
							<th>起始時間</th>
							<th>結束時間</th>
							<th>預約項目</th>
							<th>客戶備註</th>
							<th>員工備註</th>
<!-- 							<th colspan="2">選項</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reserv" items="${rservOuterList}">
							<tr>
								<td>${reserv.employeeVO.employeeName}</td>
								<td>${reserv.reservNo}</td>
								<td>${reserv.membercarsVO.memberInfoVO.memberName}</td>
								<td>${reserv.membercarsVO.carLicense}</td>
								<td>${reserv.reservDateTimeFormat}</td>
								<td>${reserv.reservEndTimeFormat}</td>

								<td>
									<c:forEach var="rservInnerList" items="${reserv.reservlists}">
										${rservInnerList.servicesVO.servName}; <br>
									</c:forEach>
								</td>
								<%-- <td>${reserv.reservlists.servicesVO.servName}</td> --%>
								<%-- <td>${reserv.reservlists.servicesVO.servName}</td> --%>
								<td>${reserv.noteC}</td>
								<td>${reserv.notesE}</td>
<%-- 								<td><input name="checkcar" type="button" value="查看車輛" class="btn btn-sm btn-primary" onclick="location.href='listMemberCars.jsp?memberNo=${member.memberNo}'"></td> --%>
<!-- 								<td> -->
<%-- 								<form action="${ctx}/MemberServlet" method="post"> --%>
<!-- 									<input type="hidden" name="action" value="getOne_For_Update"> -->
<%-- 									<input type="hidden" value="${member.memberNo}" name="memberNo"> --%>
<!-- 									<input type="submit" value="修改" class="btn btn-sm btn-warning"> -->
<!-- 								</form> -->
<!-- 								</td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
		</div>
			<div class="blockUI" style="display: none">
				<img src="${ctx}/img/loading/loading_gearwheal.gif" width="85px" height="85px"/>
			</div>
		</div>
	</div>
	<script src="${ctx}/js/jquery.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript" src="${ctx}/blockUI/jquery.blockUI.js"></script>
	<script type="text/javascript">
	
		$(function() {
			loadingBlock();
			$("#searchDate").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : 'yy-mm-dd',
				yearRange : '-10:+10',
				monthNamesShort: [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ]
				//maxDate: "+3m",
				//minDate :new Date()
			});
			$("#searchWeek").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : 'yy-mm-dd',
				yearRange : '-10:+10',
				monthNamesShort: [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ]
				//maxDate: "+3m",
				//minDate :new Date()
			});
			loadingUnblock();
			
		});
		function loadingBlock(){
		 	 $.blockUI({ 
		 		message: $('div.blockUI'),
	  		 	css: { 
	  				border: 'none',
	            	left: ($(window).width() - 133) /2 + 'px', 
					'-webkit-border-radius': '10px', 
	          		'-moz-border-radius': '10px', 
	           		padding: '25px',
	            	opacity: 0.7,
	           		width: '133px',
	           		height: '133px'
	           },
	  		 	fadeIn: 0
	  		 }); 
		 }
		 function loadingUnblock(){
		 	$.unblockUI();
		 	//alert("close block");
		 }
	</script>
</body>
</html>