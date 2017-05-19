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
<%-- 								<FORM METHOD="post" ACTION="${ctx}/services/servicestep.do"> --%>
									<td><select size="1" name="servNo" class="form-control">
											<c:forEach var="distlist" items="${list}">
												<option value="${distlist.servicesVO.servNo}">${distlist.servicesVO.servNo}-${distlist.stepName}
											</c:forEach>
									</select></td>
									<td>
										<button type="submit" name="button2" class="btn btn-sm btn-primary">查詢</button> 
<!-- 										<input type="hidden" name="action" value="getMany_ServiceStep_ByServNo"> -->
										
									</td>
<!-- 								</FORM> -->
							</tr>
						</tbody>
					</table>
					<div>
						<table id="forDistinct" class="table table-bordered table-hover">
							<thead>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
// 			var truncate1=$('select[name="servNo"]:eq(0)').val();
// 			console.log(truncate);
// 			console.log(truncate1);
			$('button[name="button2"]').click(function(){
				var truncate=$('select[name="servNo"]:eq(1)').val();
				var thead1=$('#forDistinct>thead');
				var tbody1=$('#forDistinct>tbody');
				tbody1.empty();
				thead1.empty();
				var th1=$("<th></th>").text("服務編號");
				var th2=$("<th></th>").text("服務步驟");
				var th3=$("<th></th>").text("步驟名稱");
				var th4=$("<th></th>").text("步驟描述");
				var th5=$("<th></th>").text("服務照片");
				var th6=$("<th></th>").text("選項");
				thead1.append([th1,th2,th3,th4,th5,th6]);	
				
				$.getJSON('${ctx}/ServiceStepJson',{servNo	:truncate},function(json){
					$.each(json,function(key,value){
//	 					console.log(key);
//	 					console.log(value);
						var td1=$('<td></td>').text(value.servNo);
						console.log(td1);
						var td2=$('<td></td>').text(value.servStep);
						var td3=$('<td></td>').text(value.stepName);
						var td4=$('<td></td>').text(value.stepDescp);
						var td5=$('<td></td>').text(value.stepPic);
						var img1=$('<img></img>').attr("src","data:image/jpeg;base64,${Base64.getEncoder().encodeToString(value.stepPic)}")
						var tdimg=td5.append(img1);
						
						var row=$('<tr></tr>').append([td1,td2,td3,td4,td5,tdimg]);
						tbody1.append(row);
					});
				})
			})
			
		})
	</script>
</body>

</html>