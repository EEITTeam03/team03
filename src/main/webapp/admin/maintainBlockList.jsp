<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.blockrule.model.*"%>
<%@ page import = "java.util.*" %>
<%
	BlockRuleService brSvc = new BlockRuleService();
	List<BlockRuleVO> list = brSvc.getAllRule();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="maintain.do" method="post">
			車牌:<input type="text" name="license" size='40'
				value='${param.license}' />  <small><Font
				color='red'>${ErrorMsgKey.LicenseError}</Font></small> <br /> 
			違反規則:<select size="1" name="blockRuleNo">
				<c:forEach var="blockRuleVO" items="${list}">
					<option value="${blockRuleVO.blockRuleNo}">${blockRuleVO.blockRule}
				</c:forEach>
			</select> <small><Font color='red'>${ErrorMsgKey.BlockRuleNoError}</Font></small>
			<br /> 違反日期:<input type="date" name="violationDate" size='40'
				value='${param.violationDate}' />  <small><Font
				color='red'>${ErrorMsgKey.ViolationDateError}</Font></small> <br />
			預約編號:<input type="text" name="reservationNo" size='40'
				value='${param.reservationNo}' />  <small><Font
				color='red'>${ErrorMsgKey.ReservationNoError}</Font></small> <br /> <small><Font
				color='red'>${ErrorMsgKey.MaintainError}</Font></small> <br /> 
				<input type="hidden" name="action" value="insert">
				<input type="submit" value="送出" /> <br />
		</form>
	</div>
</body>
</html>