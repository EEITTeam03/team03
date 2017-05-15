<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服務價格和時間</title>
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

<h2>所選擇的服務編號的所有價格和時間</h2>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>服務編號</th>
				<th>車種</th>
				<th>服務價格</th>
				<th>服務時間</th>
			</tr>
		</thead>
		<c:forEach var="serviceCarClassVO" items="${serviceCarClassList}">
			<tr align='center' valign='middle'>
				<td>${serviceCarClassVO.servicesVO.servNo}</td>
				<td>${serviceCarClassVO.carClassVO.carClass}</td>
				<td>${serviceCarClassVO.servPrice}</td>
				<td>${serviceCarClassVO.servTime}</td>
			</tr>
		</c:forEach>
	</table>
	
</div>
</div>
</div>
</body>
</html>