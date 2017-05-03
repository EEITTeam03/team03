<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>success page</title>
<style>
table, th, td {
   border: 1px solid black;
}
</style>
</head>
<body>
<h1>預約成功</h1>

預約人: ${reserve.membercarsVO.memberInfoVO.memberName}<br>
<br>
預約編號: ${reserve.reservNo}<br>
預約日期: ${reserve.reservDateTime.time}<br>
預約結束時間: ${reserve.reservEndTime.time}<br>
車牌: ${reserve.membercarsVO.carLicense}<br>
品牌: ${reserve.membercarsVO.carTypeVO.brand}<br>
型號: ${reserve.membercarsVO.carTypeVO.carModel}<br>
服務的技師: ${reserve.employeeVO.employeeName}<br>

<hr>
<h2>預約細項</h2>
<table>
<tr>
	<th>服務編號</th>
	<th>服務名稱</th>
	<th>服務價格</th>
	<th>服務時間</th>
<tr>
<c:forEach var="aitem" items="${reserve.reservlists}">
<tr>
	<td>${aitem.servicesVO.servNo}</td> 
	<td>${aitem.servicesVO.servName}</td>
	<td>${aitem.servPrice} 元</td>
	<td>${aitem.servTime} 分鐘</td>
</tr>
<c:set var="total" value="${total+aitem.servPrice}"></c:set>	
<c:set var="range" value="${range+aitem.servTime}"></c:set>	
</c:forEach>
</table>
<hr>
<h3>總金額: ${total} 元 </h3>
<h3>總時間: ${range/60} 小時</h3>


<!-- <input type="button" value="確定預約"> -->
</body>
</html>