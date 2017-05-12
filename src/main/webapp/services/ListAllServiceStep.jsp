<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.servicestep.model.*"%>
<%@ page import="java.util.*"%>

<%
	ServiceStepService sssjsp = new ServiceStepService();
	List<ServiceStepVO> list = sssjsp.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
  <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<title>服務工法程序</title>
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
<h2>服務工法程序</h2>
	<table class="table table-bordered table-hover">
		<tr>
			<th>服務編號</th>
			<th>服務步驟</th>
			<th>步驟名稱</th>
			<!-- 			<th>服務步驟編號</th> -->
			<th>步驟描述</th>
			<th>步驟照片</th>
			<th colspan="2">選項</th>
		</tr>
		<c:forEach var="serviceStepVO" items="${list}">
			<tr align='center' valign='middle'>
				<td width="300">${serviceStepVO.servicesVO.servNo}</td>
				<td width="300">${serviceStepVO.servStep}</td>
				<td width="300">${serviceStepVO.stepName}</td>
				<td width="300">${serviceStepVO.stepDescp}</td>
				<td><c:choose>
						<c:when test="${serviceStepVO.stepPic !=null}">
							<img
								src='data:image/jpeg;base64,${Base64.getEncoder().encodeToString(serviceStepVO.stepPic)}'
								width="150" />
						</c:when>
						<c:when test="${serviceStepVO.stepPic==null}">
						沒有服務照片
					</c:when>
					</c:choose></td>

				<td>
					<FORM METHOD="post" ACTION="servicestep.do">
						<button type="submit" class="btn btn-sm btn-primary">修改</button> 
						<input type="hidden" name="servStepNo" value="${serviceStepVO.servStepNo}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
	</div>
</body>
</html>