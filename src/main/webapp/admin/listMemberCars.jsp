<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.memberinfo.model.*" %>
<%@ page import = "com.membercars.model.* "%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
MembercarsService msvc = new MembercarsService();
Integer memberNo = Integer.valueOf(request.getParameter("memberNo"));
MemberService memsvc = new MemberService();
String memberName = memsvc.getOneMem(memberNo).getMemberName();
List<MemberCarsVO> list= msvc.getListByMember(memberNo);
 pageContext.setAttribute("list", list);
 pageContext.setAttribute("memberName", memberName);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List member's cars</title>
</head>
<body>
	<jsp:include page="Testhead_nav.jsp" />
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="table-responsive">
				<h2 class="text-center">${memberName}的車</h2>
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="info">
							<th>車牌</th>
							<th>品牌</th>
							<th>車系</th>
							<th>車型</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cars" items="${list}">
							<tr>
								<td>${cars.carLicense}</td>
								<td>${cars.carTypeVO.brand}</td>
								<td>${cars.carTypeVO.carModel}</td>
								<td>${cars.carTypeVO.carClassVO.carClass}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>