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
<title>全部員工</title>
</head>
<body>
<h1>所有員工資料</h1>
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>員工描述</th>
		<th>照片</th>
	</tr>
	
	<c:forEach var="empVO" items="${list}" begin="0" end="${list.size()-1}">
		<tr align='center' valign='middle'>
			<td>${empVO.employeeNo}</td>
			<td>${empVO.employeeName}</td>
			<td>${empVO.employeeDesc}</td>
			<c:if test="${empVO.employeePhoto==null}"></c:if>
			<c:if test="${empVO.employeePhoto!=null}"><td><img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(empVO.employeePhoto)}" width="300"/></td></c:if>
		</tr>
	</c:forEach>
</table>
</body>
</html>