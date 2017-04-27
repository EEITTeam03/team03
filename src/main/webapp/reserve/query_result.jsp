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
<tr>
	<th>預約編號</th>
	<th>預約日期</th>
	<th>預約狀態</th>
	<th>預約人</th>
	<th>車牌</th>
	<th>汽車品牌</th>
	<th>汽車型號</th>
	<th>車型大小</th>
<tr>
<c:forEach var="aVO" items="${reservList}">
<tr>
	<td>${aVO.reservNo}</td> 
	<td>${aVO.reservDateTime.time}</td>
	<td>${aVO.status}</td>
	<td>${aVO.membercarsVO.memberInfoVO.memberName}</td>
	<td>${aVO.membercarsVO.carLicense}</td>
	<td>${aVO.membercarsVO.carTypeVO.brand}</td>
	<td>${aVO.membercarsVO.carTypeVO.carModel}</td>
	<td>${aVO.membercarsVO.carTypeVO.carClassVO.className}</td>
</tr>	
</c:forEach>
</table>

<hr>

<h2>剩下時段</h2>


</body>
</html>