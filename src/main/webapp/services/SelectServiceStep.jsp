<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="sss" scope="page" class="com.servicestep.model.ServiceStepService"/>
	<ul>
		<li>
		<FORM METHOD="post" ACTION="servicestep.do">
				<b>選擇服務編號(後台):</b> <select size="1" name="servNo">
					<c:forEach var="serviceStepVO" items="${sss.all}">
						<option value="${serviceStepVO.servicesVO.servNo}">${serviceStepVO.servicesVO.servNo}
					</c:forEach>
				</select> 
				<input type="submit" value="送出"> 
				<input type="hidden" name="action" value="getMany_ServiceStep_ByServNo">
			</FORM>
		</li>
	</ul>
	
</body>
</html>