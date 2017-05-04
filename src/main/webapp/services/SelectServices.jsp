<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢會員</title>
</head>
<body>
	<ul>
	<li><a href='ListAllServices.jsp'>查看</a>所有服務 (後台)</li> <br><br>
	<li><a href='ListAllServicesForUser.jsp'>查看</a>所有服務 (前台)</li> <br><br>
		<jsp:useBean id="ss" scope="page" class="com.services.model.ServicesService" />
		<li>
			<FORM METHOD="post" ACTION="services.do">
				<b>選擇服務編號(後台):</b> <select size="1" name="servNo">
					<c:forEach var="servicesVO" items="${ss.all}">
						<option value="${servicesVO.servNo}">${servicesVO.servNo}
					</c:forEach>
				</select> 
				<input type="submit" value="送出"> 
				<input type="hidden" name="action" value="getOne_For_Display">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post" ACTION="services.do">
				<b>選擇服務編號(前台):</b> <select size="1" name="servNo">
					<c:forEach var="servicesVO" items="${ss.allForUser}">
						<option value="${servicesVO.servNo}">${servicesVO.servNo}
					</c:forEach>
				</select> 
				<input type="submit" value="送出"> 
				<input type="hidden" name="action" value="getOne_For_Display">
			</FORM>
		</li>
	</ul>
</body>
</html>