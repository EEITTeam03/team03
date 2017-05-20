<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
   <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
  <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
	<jsp:useBean id="sss" scope="page" class="com.servicestep.model.ServiceStepService"/>
	<ul>
		<li>
		<FORM METHOD="post" ACTION="servicestep.do">
				<b>選擇服務編號(後台):</b> <select size="1" name="servNo">
					<c:forEach var="distInt" items="${sss.dist}">
						<option value="${distInt}">${distInt}
					</c:forEach>
				</select> 
				<button type="submit" class="btn btn-sm btn-primary">送出</button> 
				<input type="hidden" name="action" value="getMany_ServiceStep_ByServNo">
			</FORM>
		</li>
	</ul>
	</div>
	</div>
	</div>
</body>
</html>