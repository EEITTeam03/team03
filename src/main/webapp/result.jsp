<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
${memberVO.memberName}<br>
${memberVO.memberCars}<br>
<c:forEach var="set" items="${memberVO.memberCars}">
	車牌:  ${set.carLicense}<br>
	車編號:  ${set.carTypeVO.modelNo}<br>
	車牌:  ${set.carTypeVO.brand}<br>
	車款:  ${set.carTypeVO.carModel}<br>
	車型:  ${set.carTypeVO.carClassVO.className}<br>
	<hr>
</c:forEach>
</body>
</html>