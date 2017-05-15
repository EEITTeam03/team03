<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.feedback.model.*"%>
<%@ page import = "java.util.*" %>
<%
FeedbackService fsvc = new FeedbackService();
    List<FeedbackVO> list = fsvc.getAll();
    pageContext.setAttribute("list",list);
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
<title>List all opinions</title>
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
	<h1>所有意見</h1>
	<table class="table table-bordered table-hover">
	<thead>
	<tr>
	<th>意見編號</th>
	<th>發表日期</th>
	<th>會員名稱</th>
	<th>意見</th>
	<th>評價</th>
	<th>回覆意見</th>
	<th>回覆狀態</th>
	</tr>
	</thead>
	<tbody>
	<c:if test="${list.size()!=0}">
	<c:forEach var="fVO" items="${list}" begin="0" end="${list.size()-1}">
		<tr >
			<td>${fVO.feedbackNo}</td>
			<td>${fVO.feedbackDate.time}</td>
			<td>${fVO.memberName}</td>
			<td>${fVO.feedback}</td>
			<td>
			<c:choose>
				<c:when test="${fVO.readState==5}">極佳</c:when>
				<c:when test="${fVO.readState==4}">很好</c:when>
				<c:when test="${fVO.readState==3}">好</c:when>
				<c:when test="${fVO.readState==2}">尚可</c:when>
				<c:when test="${fVO.readState==1}">差</c:when>
			</c:choose>
			</td>
			<td><FORM METHOD="get" ACTION="replyFeedback.jsp">
									<input type="submit" value="回覆"> 
									<input type="hidden" name="feedbackNo" value="${fVO.feedbackNo}">
									<input type="hidden"  name="memberName" value="${fVO.memberName}">
									<input type="hidden"  name="reply" value="${fVO.reply}">
								</FORM></td>
			<c:if test="${fVO.reply!=null}"><td>已讀</td></c:if>
			<c:if test="${fVO.reply==null}"><td>未讀</td></c:if>
		</tr>
	</c:forEach>
	</c:if>
	</tbody>
	</table>
	</div>
</div>
</div>
</body>
</html>