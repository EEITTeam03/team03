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
<title>所有服務項目</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
   <script type="text/javascript" src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
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
<div class="row">
<div class="col-lg-12">

<h2>所有服務</h2>
<table class="table table-bordered table-hover">
<thead>
		<tr class="info">
			<th>服務編號</th>
			<th>服務類型編號</th>
			<th>服務名稱</th>
			<th>服務生效日期</th>
			<th>服務狀態</th>
			<th>服務描述</th>
			<th>服務照片</th>
			<th colspan="2">選項</th>
		</tr>
		</thead>
		<c:forEach var="servicesVO" items="${list}">
			<tr align='center' valign='middle' >
				<td width="200">${servicesVO.servNo}</td>
				<td width="200">${servicesVO.servTypeNo}</td>
				<td width="200">${servicesVO.servName}</td>
				<td width="200">${servicesVO.servEffectiveDate}</td>
				<td width="200">${servicesVO.servStatus}</td>
				<td width="600">${servicesVO.servDesc}</td>
				<td width="200">
				<c:choose>
						<c:when test="${servicesVO.servPhoto !=null}">
							<img
								src='data:image/jpeg;base64,${Base64.getEncoder().encodeToString(servicesVO.servPhoto)}'
								width="200" />
						</c:when>
						<c:when test="${servicesVO.servPhoto==null}">
						沒有服務照片
					</c:when>
					</c:choose></td>

				<td>
					<FORM METHOD="post" ACTION="${ctx}/services/services.do">
						<button type="submit" class="btn btn-sm btn-warning">修改</button>
						<input type="hidden" name="servNo" value="${servicesVO.servNo}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				
				<td>
					<FORM METHOD="post" ACTION="${ctx}/services/servicecarclass.do">
						<button type="submit" class="btn btn-sm btn-primary">修改價格</button>
						<input type="hidden" name="servNo" value="${servicesVO.servNo}"> 
						<input type="hidden" name="action" value="getMany_ServiceCarClass_ByServNo">
					</FORM>
				</td>
				
<!-- 				<td> -->
<%-- 					<FORM METHOD="post" ACTION="${ctx}/services/services.do"> --%>
<!-- 						<button type="submit" class="btn btn-sm btn-danger">下架</button> -->
<%-- 						<input type="hidden" name="servNo" value="${servicesVO.servNo}">  --%>
<!-- 						<input type="hidden" name="action" value="offshelf"> -->
<!-- 					</FORM> -->
<!-- 				</td> -->
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>