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
<link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
</style>
<title>全部員工</title>
</head>
<body>
<div class="row">
<div class="col-lg-6">
<div class="table-responsive">
<h1 style='text-align:center'>所有員工資料</h1>
<table border='1'class="table table-bordered table-hover">
	<thead>
		<tr>
			<td style='text-align:center' width='200'>員工編號</td>
			<td style='text-align:center' width='200'>員工姓名</td>
			<td style='text-align:center' width='200'>員工描述</td>
			<td style='text-align:center' width='200'>照片</td>
		</tr>
	</thead>
	
	<c:forEach var="empVO" items="${list}" begin="0" end="${list.size()-1}">
		<tr align='center' valign='middle'>
			<td>${empVO.employeeNo}</td>
			<td>${empVO.employeeName}</td>
			<td>${empVO.employeeDesc}</td>
			<c:if test="${empVO.employeePhoto==null}"><td></td></c:if>
			<c:if test="${empVO.employeePhoto!=null}"><td><img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(empVO.employeePhoto)}" width="150"/></td></c:if>
		</tr>
	</c:forEach>
</table>
</div>
</div>
</div>


</body>
</html>