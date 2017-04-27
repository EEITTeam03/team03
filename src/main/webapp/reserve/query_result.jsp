<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result</title>
<style>
table, th, td {
   border: 1px solid black;
}
</style>
</head>
<body>

<h2>查詢結果</h2>
<table>
<c:forEach var="aVO" items="${reservList}">
<tr>
	<td>${aVO.reservNo}</td> 
	<td>${aVO.reservDateTime.time}</td>
	<td>${aVO.status}</td>
	<td>${aVO.membercarsVO.carLicense}</td>
	<td>${aVO.membercarsVO.memberInfoVO.memberName}</td>
</tr>	
</c:forEach>
</table>
</body>
</html>