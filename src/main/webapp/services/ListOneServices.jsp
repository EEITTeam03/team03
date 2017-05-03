<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.services.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服務單筆資料</title>
</head>
<body bgcolor='white'>

	<table border='1' bordercolor='#CCCCFF' width='1600'>
		<tr>
			<th>服務編號</th>
			<th>服務類型編號</th>
			<th>服務名稱</th>
			<th>服務有效日期</th>
			<th>服務狀態</th>
			<th>服務照片</th>
		</tr>
		<tr align='center' valign='middle'>
			<td>${servicesVO.servNo}</td>
			<td>${servicesVO.servTypeNo}</td>
			<td>${servicesVO.servName}</td>
			<td>${servicesVO.servEffectiveDate}</td>
			<td>${servicesVO.servStatus}</td>
			<%-- <td>${servicesVO.servDesc}</td> --%>
			<td>${servicesVO.servPhoto}</td>

		</tr>
	</table>

</body>
</html>