<%@page import="com.servicestep.model.ServiceStepVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.services.model.*"%>
<!DOCTYPE html>
<%
	ServiceStepVO serviceStepVO=(ServiceStepVO)request.getAttribute("serviceStepVO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<FORM METHOD="post" ACTION="servicestep.do" enctype="multipart/form-data" name="form1">
	<table border="0">
		<tr>
			<td>服務編號:<font color=red><b>*</b></font></td>
			<td>${serviceStepVO.servicesVO.servNo}</td>
		</tr>
		<tr>
			<td>服務步驟:</td>
			<td>
			<input type="TEXT" name="servStep" size="45" value="${serviceStepVO.servStep}" /></td>
		</tr>
		<tr>
			<td>步驟名稱:</td>
			<td>
			<input type="TEXT" name="stepName" size="45" value="${serviceStepVO.stepName}" /></td>
		</tr>
		<tr>
			<td>步驟描述:</td>
			<td>
				<input type="TEXT" name="stepDescp" value="${serviceStepVO.stepDescp}">
			</td>
		</tr>
<!-- 		<tr> -->
<%-- 		<jsp:useBean id="SSS" scope="page" class="com.servicestep.model.ServiceStepService" /> --%>
<!-- 			<td>服務狀態:</td> -->
<!-- 			<td> -->
<%-- 			<input type="TEXT" name="servStatus" size="45" value="<%=serviceStepVO.getServStatus()%>" /> --%>
				
<!-- 			</td> -->
<!-- 		</tr> -->

		<tr>
			<td>步驟照片:</td>
			<td><input type="file" name="stepPic" size="45" value="${serviceStepVO.stepPic}" />
			<font size="-1" color="#FF0000">${MsgMap.errorservPhoto}</font></td>
		</tr>
		
		</table>
		<br> 
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="servNo" value="${serviceStepVO.getServicesVO().getServNo}"> 
		<input type="submit" value="送出修改">
	</FORM>
</body>
</html>