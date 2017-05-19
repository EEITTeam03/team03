<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.servicestep.model.*"%>
<%@ page import="java.util.*"%>
<%
	ServiceStepService sss = new ServiceStepService();
	List<Integer> list = sss.getDist();
	List<ServiceStepVO> sslist = new ArrayList<ServiceStepVO>();
	for (Integer servNO : list) {
		sslist.add(sss.getMoreServiceStepbyFK(servNO).get(0));
	}
	pageContext.setAttribute("list", sslist);
%>
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
	<jsp:include page="/admin/Testhead_nav.jsp" />
	<c:if test="${!empty path}">
		<script>
			swal("修改成功!", "服務已更新", "success");
		</script>
	</c:if>

	<div id="wrapper">
		<div id="page-wrapper">
			<div class="table-responsive">
				<div class="col-lg-4">
					<h2>項目</h2>
					<table class="table">
						<tbody>

							<tr>
								<td>選擇服務編號</td>
								<jsp:useBean id="ss" scope="page" class="com.services.model.ServicesService" />
								<FORM METHOD="post" ACTION="${ctx}/services/services.do">
									<td><select size="1" name="servNo" class="form-control">
											<c:forEach var="servicesVO" items="${ss.all}">
												<option value="${servicesVO.servNo}">${servicesVO.servNo}-${servicesVO.servName}
											</c:forEach>
									</select></td>
									<td>
										<button type="submit" class="btn btn-sm btn-primary">查詢</button> <input type="hidden" name="action" value="getOne_For_Display">
									</td>
								</FORM>
							</tr>

							<tr>
								<td>服務編號的所有步驟</td>
								<FORM METHOD="post" ACTION="${ctx}/services/servicestep.do">
									<td><select size="1" name="servNo" class="form-control">
											<c:forEach var="distlist" items="${list}">
												<option value="${distlist.servicesVO.servNo}">${distlist.servicesVO.servNo}-${distlist.stepName}
											</c:forEach>
									</select></td>
									<td>
										<button type="submit" class="btn btn-sm btn-primary">查詢</button> <input type="hidden" name="action" value="getMany_ServiceStep_ByServNo">
									</td>
								</FORM>
							</tr>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
</body>

</html>