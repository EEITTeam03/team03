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
<script type="text/javascript"
	src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
	 <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
<!-- Bootstrap Core CSS -->
<link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ctx}/admin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
	

</head>
<body>
<jsp:include page="/admin/Testhead_nav.jsp"/>
<script>
swal("修改成功!","服務已更新","success");
</script>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
<div class="row">
<div class="col-lg-12">
<h2>修改成功</h2>
<table class="table table-bordered table-hover">
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
</div>
</div>
</div>
</div>
</div>
</body>
</html>