<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reserve</title>
</head>
<body>
<h2>查詢預約</h2>
<form action="QueryReservByDate">
<!-- 會員編號: <input type="text" name="memberNo"> -->
選擇日期: <input type="Date" name="selectedDate">
<br>
<input type="submit" value="查詢">
</form>

<br>
<br>
<hr>
<br>
<br>
<h2>開始預約</h2>
<form action="/ReserveService">
	車牌: ${param.license}
	<input type="hidden" name="license" value="${param.license}"><br>
	選擇日期: <input type="Date" name="selectedDate" value="${param.selectedDate}"><br>
	選擇時間: <input type="text" name="selectedTime" value="${param.selectedTime}"><br>
	選擇服務: 
	<select name="service">
	<option id="2001" value="2001">2001</option>
	<option id="2002" value="2002">2002</option>
	<option id="2003" value="2003">2003</option>
	<option id="2004" value="2004">2004</option>
	<option id="2005" value="2005">2005</option>
	</select>
	<br>
	<input type="checkbox" name="plus" value="1001">1001
	<input type="checkbox" name="plus" value="1002">1002
	<input type="checkbox" name="plus" value="1003">1003
	<input type="checkbox" name="plus" value="1004">1004
	<br>
	選擇員工:
	<br>
	<input type="radio" name="empNo" value="1">1號員工
	<input type="radio" name="empNo" value="2">2號員工
	<br>
	<input type="submit" value="預約">
	
</form>
<c:forEach var="msg" items="${errorMsg}">
<h3 style="color:red">${msg}</h3>
</c:forEach>
	
</body>
</html>