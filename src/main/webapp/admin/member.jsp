<%@page import="com.memberinfo.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	MemberService msvc = new MemberService();
	pageContext.setAttribute("list", msvc.getAll());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member</title>
</head>
<body>
	<jsp:include page="Testhead_nav.jsp" />
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="table-responsive">
				<h2 class="text-center">所有會員</h2>
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="info">
							<th>會員編號</th>
							<th>姓名</th>
							<th>電子郵件</th>
							<th>電話</th>
							<th>生日</th>
							<th>地址</th>
							<th>帳號生效日期</th>
							<th colspan="2">選項</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${list}">
							<tr>
								<td>${member.memberNo}</td>
								<td>${member.memberName}</td>
								<td>${member.email}</td>
								<td>${member.phone}</td>
								<td>${member.birthday}</td>
								<td>${member.address}</td>
								<td>${member.effectiveDate}</td>
								<td><input type="button" value="查看車輛" class="btn btn-sm btn-primary"></td>
								<td><input type="button" value="修改" class="btn btn-sm btn-danger"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>