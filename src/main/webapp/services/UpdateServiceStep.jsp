<%@page import="com.servicestep.model.ServiceStepVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.services.model.*"%>
<!DOCTYPE html>
<%
// 	ServiceStepVO serviceStepVO=(ServiceStepVO)request.getAttribute("serviceStepVO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
  <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
<FORM METHOD="post" ACTION="servicestep.do" enctype="multipart/form-data" name="form1">
	<h2>更新服務步驟</h2>
	<table class="table table-bordered table-hover">
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

		<tr>
			<td>步驟照片:</td>
			<td><input type="file" name="stepPic" size="45" value="${serviceStepVO.stepPic}" />
			<font size="-1" color="#FF0000">${MsgMap.errorservPhoto}</font></td>
		</tr>
		
		</table>
		<br> 
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="servStepNo" value="${serviceStepVO.servStepNo}"> 
		<button type="submit" class="btn btn-sm btn-primary">送出修改</button>
	</FORM>
	</div>
	</div>
	</div>
</body>
</html>