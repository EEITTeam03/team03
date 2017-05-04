<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.services.model.*"%>
<%
	ServicesVO servicesVO = (ServicesVO) request.getAttribute("servicesVO");
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
	<FORM METHOD="post" ACTION="services.do" enctype="multipart/form-data" name="form1">
	<table border="0">
		<tr>
			<td>服務編號:<font color=red><b>*</b></font></td>
			<td><%=servicesVO.getServNo()%></td>
		</tr>
		<tr>
			<td>服務類型編號:</td>
			<td>
			<input type="TEXT" name="servTypeNo" size="45" value="<%=servicesVO.getServTypeNo()%>" /></td>
		</tr>
		<tr>
			<td>服務名稱:</td>
			<td>
			<input type="TEXT" name="servName" size="45" value="<%=servicesVO.getServName()%>" /></td>
		</tr>
		<tr>
			<td>服務有效日期:</td>
			<td bgcolor="#5EC1E5">
				<input type="date" name="servEffectiveDate" value="<%=servicesVO.getServEffectiveDate()%>">
			</td>
		</tr>
		<tr>
		<jsp:useBean id="SS" scope="page" class="com.services.model.ServicesService" />
			<td>服務狀態:</td>
			<td>
			<input type="TEXT" name="servStatus" size="45" value="<%=servicesVO.getServStatus()%>" />
				
			</td>
		</tr>
		<tr>
			<td>服務描述:</td>
			<td>
			<input type="TEXT" name="servDesc" size="45"value="<%=servicesVO.getServDesc()%>" /></td>
		</tr>

		<tr>
			<td>服務照片:</td>
			<td><input type="file" name="servPhoto" size="45" value="<%=servicesVO.getServDesc()%>" />
			<font size="-1" color="#FF0000">${MsgMap.errorservPhoto}</font></td>
		</tr>
		
		</table>
		<br> 
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="servNo" value="<%=servicesVO.getServNo()%>"> 
		<input type="submit" value="送出修改">
	</FORM>
</body>
</html>