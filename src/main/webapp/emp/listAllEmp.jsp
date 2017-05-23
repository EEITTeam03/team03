<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.employee.model.*"%>
<%@ page import = "java.util.*" %>
<%
    EmployeeService empSvc = new EmployeeService();
    List<EmployeeVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
 <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
	<!-- 中文字型 CSS -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanstc.css" rel="stylesheet">	
<style type="text/css">
</style>
<title>全部員工</title>
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
<div class="row">
<div class="col-lg-12">
<h1 style='text-align:center'>所有員工資料</h1>
<table class="table table-bordered table-hover">
	<thead>
		<tr class="info">
			<th style='text-align:center' width='200'>員工編號</th>
			<th style='text-align:center' width='200'>員工姓名</th>
			<th style='text-align:center' width='200'>員工描述</th>
			<th style='text-align:center' width='200'>照片</th>
			<th style='text-align:center' width='200'>修改</th>
		</tr>
	</thead>
	
	<c:forEach var="empVO" items="${list}" begin="0" end="${list.size()-1}">
		<tr align='center' valign='middle'>
			<td>${empVO.employeeNo}</td>
			<td>${empVO.employeeName}</td>
			<td>${empVO.employeeDesc}</td>
			<c:if test="${empVO.employeePhoto==null}"><td></td></c:if>
			<c:if test="${empVO.employeePhoto!=null}"><td><img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(empVO.employeePhoto)}" width="150"/></td></c:if>
							<td><FORM METHOD="get" ACTION="updateEmp.jsp">
									<button type="submit" class="btn btn-sm btn-primary">修改</button> 
									<input type="hidden" name="empno" value="${empVO.employeeNo}">
									<input type="hidden"  name="ename" value="${empVO.employeeName}">
									<input type="hidden"  name="eDesc" value="${empVO.employeeDesc}">
								</FORM></td>
						</tr>
	</c:forEach>
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
<script type="text/javascript" src="${ctx}/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript">
	$(function(){
		loadingBlock();
	})
	$(window).load(function(){
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