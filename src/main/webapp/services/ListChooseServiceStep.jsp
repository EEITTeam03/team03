<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.servicestep.model.*"%>
<%@ page import="java.util.*"%>
<%
// 	List<ServiceStepVO> list = (List<ServiceStepVO>) request.getAttribute("serviceStepList");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服務步驟單筆</title>
</head>
<body bgcolor='white'>
	<table border='1' width='800'>
		<thead align='center' valign='middle'>
			<tr>
				<td>服務步驟單筆</td>
			</tr>
		</thead>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><a href="SelectServices.jsp">回搜尋服務頁</a></td>
		</tr>
	</table>
	<table border='1' bordercolor='#CCCCFF' width='1600'>
		<tr>
			<th>服務編號</th>
			<th>服務步驟</th>
			<th>步驟名稱</th>
			<th>步驟描述</th>
			<th>服務照片</th>
			<th colspan="2">選項</th>
		</tr>

		<c:forEach var="serviceStepVO" items="${serviceStepList}">
			<tr align='center' valign='middle'>
				<td>${serviceStepVO.servicesVO.servNo}</td>
				<td>${serviceStepVO.servStep}</td>
				<td>${serviceStepVO.stepName}</td>
				<td>${serviceStepVO.stepDescp}</td>
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
				<!-- 修改了name從servNo---servStepNo 
					value從serviceStepVO.servicesVO.servNo換成serviceStepVO.servStepNo
				-->
					<FORM METHOD="post" ACTION="servicestep.do">
						<input type="submit" value="修改"> <input type="hidden"
							name="servStepNo" value="${serviceStepVO.servStepNo}"> 
							<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="services.do">
						<input type="submit" value="下架"> <input type="hidden"
							name="servNo" value="${servicesVO.servNo}"> 
							<input type="hidden" name="action" value="offshelf">
					</FORM>
				</td>
			</tr>

		</c:forEach>
	</table>

</body>
</html>