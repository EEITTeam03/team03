<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.services.model.*"%>
<%@ page import="java.util.*"%>

<%
	ServicesService ssjsp = new ServicesService();
	List<ServicesVO> list = ssjsp.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有服務資料</title>
</head>
<body>

	<table border='1' width='800'>
		<thead align='center' valign='middle'>
			<tr>
				<td>所有服務資料</td>
			</tr>
		</thead>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><a href="SelectServices.jsp">回搜尋服務頁</a></td>
		</tr>
	</table>
	<table border='1' bordercolor='#CCCCFF' width='1600'>
		<tr>
			<th>服務編號</th>
			<th>服務類型編號</th>
			<th>服務名稱</th>
			<th>服務有效日期</th>
			<th>服務狀態</th>
			<th>服務描述</th>
			<th>服務照片</th>
			<th colspan="2">選項</th>
		</tr>
		<c:forEach var="servicesVO" items="${list}">
			<tr align='center' valign='middle'>
				<td width="300">${servicesVO.servNo}</td>
				<td width="300">${servicesVO.servTypeNo}</td>
				<td width="300">${servicesVO.servName}</td>
				<td width="300">${servicesVO.servEffectiveDate}</td>
				<td width="300">${servicesVO.servStatus}</td>
				<td width="300">${servicesVO.servDesc}</td>
				<td><c:choose>
						<c:when test="${servicesVO.servPhoto !=null}">
							<img
								src='data:image/jpeg;base64,${Base64.getEncoder().encodeToString(servicesVO.servPhoto)}'
								width="150" />
						</c:when>
						<c:when test="${servicesVO.servPhoto==null}">
						沒有服務照片
					</c:when>
					</c:choose></td>

				<td>
					<FORM METHOD="post" ACTION="services.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="servNo" value="${servicesVO.servNo}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="services.do">
						<input type="submit" value="下架"> 
						<input type="hidden" name="servNo" value="${servicesVO.servNo}"> 
						<input type="hidden" name="action" value="offshelf">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>