<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.servicestep.model.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" type="text/css" rel="stylesheet">

<!--     Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

<!--     Morris Charts CSS -->
    <link href="${ctx}/admin/css/plugins/morris.css" rel="stylesheet">

<!--     Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
 
   
</head>
<body>
<jsp:include page="/admin/Testhead_nav.jsp"/>
<c:if test="${!empty path}">
<script>
swal("修改成功!","服務已更新","success");
</script>
</c:if>

<div id="wrapper">

<div id="page-wrapper">
<div  class="table-responsive">
<div class="col-lg-4">
<h2>項目</h2>
	<ul>
		<li><a href='${ctx}/services/ListAllServices.jsp'>查看</a>所有服務 (後台)</li>
		<br>
		<li><a href='${ctx}/services/ServicesInsert.jsp'>新增</a>服務 (後台)</li>
		<br>
		<li><a href='${ctx}/services/ServicesInsert.jsp'>新增</a>服務 (後台)</li>
		<br>
		<li><a href='${ctx}/services/ListAllServicesPriceAndTime.jsp'>查看</a>所有服務價格與時間</li>
		<br>
		<li><a href='${ctx}/services/ListAllServiceStep.jsp'>查看</a>所有服務步驟 (後台)</li>
		<br>
		<jsp:useBean id="ss" scope="page" class="com.services.model.ServicesService" />
		<li>
			<FORM METHOD="post" ACTION="${ctx}/services/services.do">
				<b>選擇服務編號(後台):</b> 
				<select size="1" name="servNo" class="form-control">
					<c:forEach var="servicesVO" items="${ss.all}">
						<option value="${servicesVO.servNo}">${servicesVO.servNo}-${servicesVO.servName}
					</c:forEach>
				</select>
	
				<button type="submit" class="btn btn-sm btn-primary">送出</button>
				<input type="hidden" name="action" value="getOne_For_Display">
				
			</FORM>
		</li>
		<br>
	
<% 
	ServiceStepService sss = new ServiceStepService();
    List<Integer> list= sss.getDist();
    List<ServiceStepVO>sslist = new ArrayList<ServiceStepVO>();
    for(Integer servNO:list){
    	sslist.add(sss.getMoreServiceStepbyFK(servNO).get(0));
    }
    pageContext.setAttribute("list",sslist);
%>

		<li>
			<FORM METHOD="post" ACTION="${ctx}/services/servicestep.do">
				<b>選擇服務編號的所有步驟(後台):</b> 
				<select size="1" name="servNo" class="form-control">
					<c:forEach var="distlist" items="${list}">
						<option value="${distlist.servicesVO.servNo}">${distlist.servicesVO.servNo}-${distlist.stepName}
					</c:forEach>
				</select> 
				<button type="submit" class="btn btn-sm btn-primary">送出</button>
				<input type="hidden"name="action" value="getMany_ServiceStep_ByServNo">
			</FORM>
		</li>
	</ul>
	</div>
	</div>
	</div>
	</div>
</body>
 
</html>