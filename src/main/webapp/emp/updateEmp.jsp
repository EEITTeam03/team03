<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>員工資料修改 </title>
</head>
<body>
	<h1>修改員工資料</h1>
	<c:if test = "${not empty errorMsgs}">
	<font color = 'red'>請修正以下錯誤:
	<ul>
		<c:forEach var = "message" items = "${errorMsgs}">
		<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
	</c:if>
	<FORM METHOD="post" ACTION="emp.do" name="form2" enctype="multipart/form-data">
<table border="0">
	<tr>
		<td>員工編號:<font color=red><b>*</b></font></td>
		<td>${param.empno}</td>
	</tr>
	<tr>
		<td>員工姓名:</td>
		<td><input type="TEXT" name="ename" size="45" 
			value="${param.ename}" /></td>
	</tr>
	<tr>
		<td>經驗:</td>
		<td><textarea cols="50" rows="5" name="exp"></textarea>
		</td>
	</tr>
	<tr>
		<td>照片:</td>
		<td>
		   <input type="file" name="upfile1"><br>
		</td>
	</tr>
</table>
<br>
<input type="hidden" name="empno" value="${param.empno}">
<input type="hidden" name="action" value="update">
<input type="submit" value="送出修改"></FORM>
</body>
</html>