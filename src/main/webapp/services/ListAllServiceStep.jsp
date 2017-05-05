<%-- <%@page import="com.servicestep.model.ServiceStepVO"%> --%>
<%-- <%@page import="com.servicestep.model.ServiceStepService"%> --%>
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
<title>服務工法程序</title>
</head>
<body>
	<table border='1' bordercolor='#CCCCFF' width='1600'>
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
						<input type="submit" value="修改"> 
						<input type="hidden" name="servNo" value="${serviceStepVO.servStepNo}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<!-- 				<td> -->
				<!-- 					<FORM METHOD="post" ACTION="services.do"> -->
				<!-- 						<input type="submit" value="下架">  -->
				<%-- 						<input type="hidden" name="servNo" value="${serviceStepVO.servicesVO.servNo}">  --%>
				<!-- 						<input type="hidden" name="action" value="offshelf"> -->
				<!-- 					</FORM> -->
				<!-- 				</td> -->
			</tr>
		</c:forEach>
	</table>
</body>
</html>