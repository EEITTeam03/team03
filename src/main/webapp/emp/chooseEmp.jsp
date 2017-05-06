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

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>選擇員工</title>
</head>
<body>
	<h1>選一個員工</h1>
	<div>
	<FORM METHOD="get" ACTION="updateEmp.jsp" name="chooseEmp">
	<select size="1" name="empno">
			<c:forEach var="empVO" items="${list}">
				<option value="${empVO.employeeNo}">${empVO.employeeName}
			</c:forEach>
		</select>
		
		<input type="submit" value="下一步"></FORM>
		</FORM>
	</div>
</body>
</html>