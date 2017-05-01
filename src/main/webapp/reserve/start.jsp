<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>選擇會員</title>
<style>
table, th, td {
   border: 1px solid black;
}
</style>
</head>
<body>
<form action="ShowCars">
會員編號: <input type="text" name="memberNo">
<br>
<input type="submit" value="GO">
</form>


<table>
<tr>
<th>品牌</th>
<th>型號</th>
<th>車牌</th>
</tr>
<c:forEach var="car" items="${cars}">
<tr>
<td>${car.carTypeVO.brand}</td>
<td>${car.carTypeVO.carModel}</td>
<td>${car.carLicense}</td>
<td><form action="reserve_page.jsp">
<input type="hidden" name="carlicense" value="${car.carLicense}">
<input type="submit" value="select">
</form></td>
</tr>
</c:forEach>
</table>
</body>
</html>