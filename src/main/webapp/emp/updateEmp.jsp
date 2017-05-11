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
	<div class="row">
		<div class="col-lg-2">
			<div>
				<h1 style='text-align: center'>修改員工資料</h1>

				<h4 style='text-align: center'>選一個員工</h4>
				<FORM METHOD="get" ACTION="updateEmp.jsp" name="chooseEmp">
					<select size="1" name="empno" class="form-control">
						<c:forEach var="empVO" items="${list}">
							<option value="${empVO.employeeNo}"
								${(empVO.employeeNo == param.empno)? 'selected':''}>${empVO.employeeName}
						</c:forEach>
					</select>
				<div align="center">
					<button type="submit" class="btn btn-sm btn-primary">確定</button>
				</div>
				</FORM>
				<br>
				
				<br>
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

					<div>
						員工編號:<font color=red><b>*</b></font> ${param.empno}
					</div>
					<br>
					<div>
						員工姓名: 
						<input type="TEXT" name="ename" size="45" value="${param.ename}" class="form-control" />
					</div>
					<br>
					<div>
						經驗:
						<textarea cols="60" rows="5" name="exp" class="form-control"></textarea>
					</div>
					<br>
					<div>
						照片: 
						<input type="file" name="upfile1"> 
						<input type="hidden" name="empno" value="${param.empno}"> 
						<input type="hidden" name="action" value="update">
					</div>
					<br>
					<div align="center">
						<button type="submit" class="btn btn-sm btn-primary" >送出修改</button>
					</div>
				</FORM>

			</div>
		</div>
	</div>
</body>
</html>