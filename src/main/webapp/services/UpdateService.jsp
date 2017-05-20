<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.services.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 	ServicesVO servicesVO = (ServicesVO) request.getAttribute("servicesVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script type="text/javascript" src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
   <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
  <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 	
 	<!-- SweetAlert -->
    <script src="../admin/SweetAlert/js/sweetalert.min.js"></script> 
	<link href="../admin/SweetAlert/css/sweetalert.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
<FORM METHOD="post" ACTION="services.do" enctype="multipart/form-data" name="form1" id="form1">
	<h2>更新服務</h2>
	<table class="table table-bordered table-hover">
		<tr>
			<td>服務編號:<font color=red><b>*</b></font></td>
			<td>${servicesVO.servNo}</td>
		</tr>
		<tr>
			<td>服務類型編號:</td>
			<td>
			<input type="TEXT" name="servTypeNo" size="45" value="${servicesVO.servTypeNo}" /></td>
		</tr>
		<tr>
			<td>服務名稱:</td>
			<td>
			<input type="TEXT" name="servName" size="45" value="${servicesVO.servName}" /></td>
		</tr>
		<tr>
			<td>服務有效日期:</td>
			<td bgcolor="#5EC1E5">
				<input type="date" name="servEffectiveDate" value="${servicesVO.servEffectiveDate}">
			</td>
		</tr>
		<tr>
		<jsp:useBean id="SS" scope="page" class="com.services.model.ServicesService" />
			<td>服務狀態:</td>
			<td>
			<input type="TEXT" name="servStatus" size="45" value="${servicesVO.servStatus}" />
				
			</td>
		</tr>
		<tr>
			<td>服務描述:</td>
			<td>
				<textarea style="resize:none" rows="5" cols="49" name="servDesc" form="form1">${servicesVO.servDesc}</textarea>
			</td>
		</tr>

		<tr>
			<td>服務照片:</td>
			<td><input type="file" name="servPhoto" size="45" value="${servicesVO.servDesc}" />
			<font size="-1" color="#FF0000">${MsgMap.errorservPhoto}</font></td>
		</tr>
		
		</table>
		<br> 
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="servNo" value="${servicesVO.servNo}"> 
		<button type="submit" class="btn btn-sm btn-primary">送出修改</button>
	</FORM>
	</div>
	</div>
	</div>
</body>
</html>