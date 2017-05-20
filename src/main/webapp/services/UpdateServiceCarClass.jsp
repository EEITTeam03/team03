<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  
  <script type="text/javascript" src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
    <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
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
<FORM METHOD="post" ACTION="servicecarclass.do">
	<h2>更新服務車種價格與時間</h2>
	<table class="table table-bordered table-hover">
		<tr>
			<td>服務編號:</td>
			<td>${serviceCarClassVO.servicesVO.servNo}</td>
		</tr>
		<tr>
			<td>車級:</td>
			<td>
				${serviceCarClassVO.carClassVO.carClass}
			</td>
		</tr>
		<tr>
			<td>服務價格:</td>
			<td>
			<input type="TEXT" name="servPrice" size="45" value="${serviceCarClassVO.servPrice}" /></td>
		</tr>
		<tr>
			<td>服務時間:</td>
			<td>
				<input type="TEXT" name="servTime" value="${serviceCarClassVO.servTime}">
<!-- 				<select> -->
<!-- 					<option value="30">30分鐘</option> -->
<!-- 					<option value="45">45分鐘</option> -->
<!-- 					<option value="60">60分鐘</option> -->
<!-- 					<option value="75">75分鐘</option> -->
<!-- 					<option value="90">90分鐘</option> -->
<!-- 				</select> -->
			</td>
		</tr>
		</table> 
			<input type="hidden" name="action" value="updateForServiceCarClass">
		<input type="hidden" name="carClassNo" value="${serviceCarClassVO.carClassNo}"> 
		<button type="submit" class="btn btn-sm btn-primary">送出修改</button>
	</FORM>
	</div>
	</div>
	</div>
</body>
</html>