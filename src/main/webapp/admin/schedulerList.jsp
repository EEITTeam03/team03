<%@page import="myutil.MyUtil"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	pageContext.setAttribute("todayDate", MyUtil.formatCalender(Calendar.getInstance()));
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>預約清單</title>  
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="Testhead_nav.jsp" />
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="table-responsive">
				<h2 class="text-center">預約清單</h2>
				<div class="col-lg-6">
				<center>
				<form action="SchedulerListServlet" method="post">
<!-- 						<span class="label label-success"><h1>日檢視</h1></span><br> -->
						<div class="alert alert-success" role="alert">日檢視</div>
						<label>日期: </label><input type="text" id="searchDate" name="searchDate" value="${param.searchDate}"/><br>
						<input type="text" id="searchView" name="searchView"/><br><small><Font color='red' >${ErrorMsgKey.NotAcurrateView}</Font></small>
						<p>view ex: dayView.weekView.monthView</p>
						<input type="hidden" name="action" value="searchDate">
						<button type="submit" id="btn_searchDate" class="btn btn-sm btn-success">送出</button><br>

				</form></center>
				</div>
				<div class="col-lg-6">
				<center>
				<form action="SchedulerListServlet" method="post">
					<div class="alert alert-warning" role="alert">週檢視</div>
					<input type="hidden" name="action" value="searchALL">
					<button type="submit" id="btn_searchAll" class="btn btn-sm btn-warning">搜尋全部</button><br>
				</form></center>
				</div>
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
								<td>${reserv.reservDateTime.time}</td>
								<td>${reserv.reservEndTime.time}</td>

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