<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
		$(document).ready(function () {
			init();
		});	
	
		function init(){
			initClick();
		}
		
		function initClick(){
			$('#a_searchAllService').click(function(){
				$('#contentDiv').load('${ctx}/services/ListAllServices.jsp');
			});
		}
	</script>
</head>
<body>
	<ul>
		<li><a href='#' id="a_searchAllService">查看</a>所有服務 (後台)</li>
		<br>
		<li><a href='${ctx}/services/ServicesInsert.jsp'>新增</a>服務 (後台)</li>
		<br>
		<li><a href='${ctx}/services/ListAllServiceStep.jsp'>查看</a>所有服務步驟 (後台)</li>
		<br>
		<li><a href='${ctx}/services/ListAllServiceStepForUser.jsp'>查看</a>所有服務 (前台)</li>
		<br>
		<li><a href='${ctx}/services/ListAllServicesForUser.jsp'>查看</a>所有服務 (前台)</li>
		<br>
		<jsp:useBean id="ss" scope="page"
			class="com.services.model.ServicesService" />
		<li>
			<FORM METHOD="post" ACTION="${ctx}/services/services.do">
				<b>選擇服務編號(後台):</b> 
				<select size="1" name="servNo" class="form-control">
					<c:forEach var="servicesVO" items="${ss.all}">
						<option value="${servicesVO.servNo}">${servicesVO.servNo}
					</c:forEach>
				</select>
	
				<button type="submit" class="btn btn-lg btn-primary">送出</button>
				<input type="hidden" name="action" value="getOne_For_Display">
				
			</FORM>
		</li>
		<li>
			<FORM METHOD="post" ACTION="${ctx}/services/services.do">
				<b>選擇服務編號(前台):</b> 
				<select size="1" name="servNo" class="form-control">
					<c:forEach var="servicesVO" items="${ss.allForUser}">
						<option value="${servicesVO.servNo}">${servicesVO.servNo}
					</c:forEach>
				</select> 
				<button type="submit" class="btn btn-lg btn-primary">送出</button>
				<input type="hidden" name="action" value="getOne_For_Display">
			</FORM>
		</li>
	</ul>
	<jsp:useBean id="sss" scope="page"
		class="com.servicestep.model.ServiceStepService" />
	<ul>
		<li>
			<FORM METHOD="post" ACTION="${ctx}/services/servicestep.do">
				<b>選擇服務編號(後台):</b> 
				<select size="1" name="servNo" class="form-control">
					<c:forEach var="distInt" items="${sss.dist}">
						<option value="${distInt}">${distInt}
					</c:forEach>
				</select> 
				<button type="submit" class="btn btn-lg btn-primary">送出</button>
				<input type="hidden"name="action" value="getMany_ServiceStep_ByServNo">
			</FORM>
		</li>
	</ul>
</body>
</html>