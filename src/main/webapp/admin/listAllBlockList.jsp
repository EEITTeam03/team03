<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.blocklist.model.*"%>
<%@ page import = "java.util.*" %>
<%
BlockListService blsvc = new BlockListService();
    List<BlockListVO> list = blsvc.getAllBlockList();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有黑名單</title>
</head>
<body>
	<h1>所有黑名單</h1>
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>會員編號</th>
		<th>違規規則</th>
		<th>違反日期</th>
		<th>預約編號</th>
	</tr>
	<c:if test="${list.size()!=0}">
	<c:forEach var="blkVO" items="${list}" begin="0" end="${list.size()-1}">
		<tr align='center' valign='middle'>
			<td>${blkVO.memberInfoVO.memberNo}</td>
			<td>${blkVO.memberInfoVO.memberName}</td>
			<td>${blkVO.violationDate}</td>
			<td>${blkVO.reservationNo}</td>
		</tr>
	</c:forEach>
	</c:if>
</table>
</body>
</html>