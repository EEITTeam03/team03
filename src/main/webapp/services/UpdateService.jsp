<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.services.model.*"%>
<%
	ServicesVO svojsp = (ServicesVO) request.getAttribute("svojsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改服務資料</title>
</head>
<body>
	<h3>服務資料修改</h3>
	<h3>資料修改:</h3>
	<FORM METHOD="post" ACTION="service.do" name="form1">
	<tr>
		<td>服務編號:<font color=red><b>*</b></font></td>
		<td><%=svojsp.getServNo()%></td>
	</tr>
	<tr>
		<td>服務類型編號:</td>
		<td><input type="TEXT" name="servTypeNo" size="45" value="<%=svojsp.getServTypeNo()%>" /></td>
	</tr>
	<tr>
		<td>服務名稱:</td>
		<td><input type="TEXT" name="servName" size="45"	value="<%=svojsp.getServName()%>" /></td>
	</tr>
	<tr>
		<td>服務有效日期:</td>
		<td bgcolor="#CCCCFF">
		    <input type="date" name="servEffectiveDate" value="<%= svojsp.getServEffectiveDate()%>">
		</td>
	</tr>
	<tr>
		<td>服務狀態:</td>
		<td><input type="TEXT" name="servStatus" size="45"	value="<%=svojsp.getServStatus()%>" /></td>
	</tr>
	<tr>
		<td>服務描述:</td>
		<td><input type="TEXT" name="servDesc" size="45"	value="<%=svojsp.getServDesc()%>" /></td>
	</tr>
	
	<tr>
		<td>服務照片:</td>
		<td><input type="file" name="sal" size="45"	value="<%=svojsp.getServDesc()%>" /></td>
	</tr>
	</FORM>
</body>
</html>