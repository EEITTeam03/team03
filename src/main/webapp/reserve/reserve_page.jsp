<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<form action="ReserveService">
	車牌: <input type="text" name="license"><br>
	選擇日期: <input type="Date" name="selectedDate"><br>
	選擇服務: 
	<select name="service">
	<option value="2001">2001</option>
	<option value="2002">2002</option>
	<option value="2003">2003</option>
	<option value="2004">2004</option>
	<option value="2005">2005</option>
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
	<hr>
	${paramValues.plus[0]}
	${paramValues.plus[1]}
	${paramValues.plus[2]}
	${paramValues.plus[3]}
	
</body>
</html>