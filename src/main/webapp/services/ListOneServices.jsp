<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.services.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服務單筆資料</title>
</head>
<body bgcolor='white'>
<table border='1' width='800'>
		<thead align='center' valign='middle'>
			<tr>
				<td>所有服務資料</td>
			</tr>
		</thead>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><a href="SelectServices.jsp">回搜尋服務頁</a></td>
		</tr>
	</table>
	<table border='1' bordercolor='#CCCCFF' width='1600'>
		<tr>
			<th>服務編號</th>
			<th>服務類型編號</th>
			<th>服務名稱</th>
			<th>服務有效日期</th>
			<th>服務狀態</th>
			<th>服務描述</th>
			<th>服務照片</th>
		</tr>
		<tr align='center' valign='middle'>
			<td>${servicesVO.servNo}</td>
			<td>${servicesVO.servTypeNo}</td>
			<td>${servicesVO.servName}</td>
			<td>${servicesVO.servEffectiveDate}</td>
			<td>${servicesVO.servStatus}</td>
			<td>${servicesVO.servDesc}</td>
			<td>
			<c:choose>
				<c:when test="${servicesVO.servPhoto !=null}">
					<img src='data:image/jpeg;base64,${Base64.getEncoder().encodeToString(servicesVO.servPhoto)}' width="150"/>
				</c:when>
				<c:when test="${servicesVO.servPhoto==null}">
					沒有服務照片
				</c:when>
			</c:choose>
			</td>

		</tr>
	</table>

</body>
</html>