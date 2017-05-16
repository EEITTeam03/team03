<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="java.util.*"%>
<%
	EmployeeService empSvc = new EmployeeService();
	List<EmployeeVO> list = empSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">
<title>員工資料修改</title>
 <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<style type="text/css">
textarea { /* Text Area 固定大小*/
	max-width: 300px;
	max-height: 100px;
	width: 300px;
	height: 100px;
}
</style>
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
<div class="col-lg-6 text-center">
				<h1 style='text-align: center'>修改員工資料</h1>

<!-- 				<h4 style='text-align: center'>選一個員工</h4> -->
<!-- 				<FORM METHOD="get" ACTION="updateEmp.jsp" name="chooseEmp"> -->
<!-- 					<select size="1" name="empno" class="form-control"> -->
<%-- 						<c:forEach var="empVO" items="${list}"> --%>
<%-- 							<option value="${empVO.employeeNo}" --%>
<%-- 								${(empVO.employeeNo == param.empno)? 'selected':''}>${empVO.employeeName} --%>
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
<!-- 				<div align="center"> -->
<!-- 					<button type="submit" class="btn btn-sm btn-primary">確定</button> -->
<!-- 				</div> -->
<!-- 				</FORM> -->
<!-- 				<br> -->
				
<!-- 				<br> -->
				<div>
					<c:if test="${not empty errorMsgs}">
						<font color='red'>請修正以下錯誤:
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li>${message}</li>
								</c:forEach>
							</ul>
						</font>
					</c:if>
				</div>
 				<FORM METHOD="post" ACTION="emp.do" name="form2" enctype="multipart/form-data"> 
				<table class="table table-bordered table-hover">
					<tr>
						<td>員工編號:<font color=red><b>*</b></font></td>
						<td>${param.empno}</td>
					</tr>
				
					<tr>
						<td>
							員工姓名:
						</td>
						<td>
							<input type="TEXT" name="ename" size="45" value="${param.ename}" class="form-control" />
						</td>
					</tr>
				
					<tr>
						<td>
							經驗:
						</td>
						
						<td>
							<textarea cols="60" rows="5" name="exp" class="form-control"></textarea>
						</td>
					</tr>
					
					<tr>
						<td>
							照片: 
						</td>
						<td>
							<input type="file" name="upfile1">
						</td>
					</tr>
					</table>
						<input type="hidden" name="empno" value="${param.empno}">
						<input type="hidden" name="action" value="update">
						<button type="submit" class="btn btn-sm btn-primary">送出修改</button>
				</FORM>
</div>
</div>
</div>
</div>
</body>
</html>