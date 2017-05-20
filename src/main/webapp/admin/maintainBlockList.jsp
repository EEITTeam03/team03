<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.blockrule.model.*"%>
<%@ page import = "java.util.*" %>
<%
	BlockRuleService brSvc = new BlockRuleService();
	List<BlockRuleVO> list = brSvc.getAllRule();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--美美的icon-->
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">

	<h2>新增黑名單</h2>
	
		<form action="maintain.do" method="post">
		<table class="table table-bordered table-hover">
					<tr>
			<td>預約編號:</td>
			<td>
			<input type="text" name="reservationNo" size='13'value='${param.reservationNo}' /> <small><Font color='red'>${ErrorMsgKey.ReservationNoError}</Font></small> <br /> 
				</td>
				</tr>
				<br>
		<tr>
			<td>違反規則:</td>
			<td>
			<select size="1" name="blockRuleNo">
				<c:forEach var="blockRuleVO" items="${list}">
					<option value="${blockRuleVO.blockRuleNo}">${blockRuleVO.blockRule}
				</c:forEach>
			</select> <small><Font color='red'>${ErrorMsgKey.BlockRuleNoError}</Font></small>
			</td>
			</tr>
			<br> 
			<tr>
			<td>違反日期:
			<td><input type="date" name="violationDate" size='40'
				value='${param.violationDate}' />  <small><Font
				color='red'>${ErrorMsgKey.ViolationDateError}</Font></small> <br />
			</td>
			</tr>

				</table>
				<input type="hidden" name="action" value="insert">
				<button type="submit" class="btn btn-sm btn-primary">送出</button>
		</form>
		
	</div>
	</div>
	</div>
</body>
</html>