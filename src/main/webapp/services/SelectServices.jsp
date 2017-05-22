<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.servicestep.model.*"%>
<%@ page import="com.services.model.*"%>
<%@ page import="java.util.*"%>
<%
	ServiceStepService sss = new ServiceStepService();
	List<Integer> list = sss.getDist();
	List<ServiceStepVO> sslist = new ArrayList<ServiceStepVO>();
	for (Integer servNO : list) {
		sslist.add(sss.getMoreServiceStepbyFK(servNO).get(0));
	}
	pageContext.setAttribute("list", sslist);

	ServicesService ss = new ServicesService();
	List<ServicesVO> svo = ss.getAll();
	pageContext.setAttribute("ss", svo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
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
<!-- 	感謝柏元的教導 -->
	<c:if test="${!empty insetComplete}">
		<script>
			swal("新增成功!", "服務已更新", "success");
		</script>
		
	</c:if>
<% session.removeAttribute("insetComplete"); %>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="table-responsive">
				<div class="col-lg-12">
					<h2>項目</h2>
					<table class="table">
						<tbody>

							<tr>
								<td>選擇服務編號</td>
								<%-- 								<jsp:useBean id="ss" scope="page" class="com.services.model.ServicesService" /> --%>
								<%-- 								<FORM METHOD="post" ACTION="${ctx}/services/services.do"> --%>
								<td><select size="1" name="servNo" class="form-control">
										<c:forEach var="servicesVO" items="${ss}">
											<option value="${servicesVO.servNo}">${servicesVO.servNo}-${servicesVO.servName}
										</c:forEach>
								</select></td>
								<td>
									<button type="submit" name="button1" class="btn btn-sm btn-primary">查詢</button> <!-- 										<input type="hidden" name="action" value="getOne_For_Display"> -->
								</td>
								<!-- 								</FORM> -->
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
									<button type="submit" name="button2" class="btn btn-sm btn-primary">查詢</button> <!-- 										<input type="hidden" name="action" value="getMany_ServiceStep_ByServNo"> -->

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
					<div>
						<table id="forDistinct1" class="table table-bordered table-hover">
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
			$('button[name="button1"]').click(function(){
				
				var truncate1=$('select[name="servNo"]:eq(0)').val();
				console.log("forService:"+truncate1);
				var thead=$('#forDistinct1>thead');
				var tbody=$('#forDistinct1>tbody');
				tbody.empty();
				thead.empty();
				var th1=$("<th></th>").attr("width","100").text("服務編號");
				var th2=$("<th></th>").attr("width","200").text("服務類型編號");
				var th3=$("<th></th>").attr("width","200").text("服務名稱");
				var th4=$("<th></th>").attr("width","200").text("服務有效日期");
				var th5=$("<th></th>").attr("width","200").text("服務狀態");
				var th6=$("<th></th>").attr("width","300").text("服務描述");
				var th7=$("<th></th>").attr("width","200").text("服務照片");
				var th8=$("<th></th>").attr("colspan","2").text("選項");
				var theadrow=$("<tr></tr>").attr("class","info").append([th1,th2,th3,th4,th5,th6,th7,th8])
				thead.append(theadrow);
				
				$.getJSON('${ctx}/ServiceJson',{servNo	:truncate1},function(json){
					$.each(json,function(i,v){
// 	 					console.log(v);
	 					var td_1=$('<td></td>').text(v.servNo);
	 					var td_2=$('<td></td>').text(v.servTypeNo);
	 					var td_3=$('<td></td>').text(v.servName);
	 					var td_4=$('<td></td>').text(v.servEffectiveDate);
	 					var td_5=$('<td></td>').text(v.servStatus);
	 					var td_6=$('<td></td>').text(v.servDesc);
	 					var td_7=$('<td></td>');
	 					var img1=$('<img></img>').attr("width","200").attr("src","data:image/jpeg;base64,"+v.servPhoto);
	 					var tdimg=td_7.append(img1);
	 					var td_8=$('<td></td>')
	 					
	 					var btn=$('<button>修改</button>').attr("type","submit").attr("class","btn btn-sm btn-warning");
	 					var form=$('<form></form>').attr("method","post").attr("action","${ctx}/services/services.do");
	 					var input =$("<input />").attr("type","hidden").attr("name","action").attr("value","getOne_For_Update");
	 					var input1 =$("<input />").attr("type","hidden").attr("name","servNo").attr("value",v.servNo);
	 					td_8.append(form.append([btn,input,input1]));
	 					
	 					var td_9=$('<td></td>');
	 					var btn=$('<button>下架</button>').attr("type","submit").attr("class","btn btn-sm btn-danger");
	 					var form=$('<form></form>').attr("method","post").attr("action","${ctx}/services/services.do");
	 					var inputforoff =$("<input />").attr("type","hidden").attr("name","action").attr("value","offshelf");
	 					var inputforservNo =$("<input />").attr("type","hidden").attr("name","servNo").attr("value",v.servNo);
	 					td_9.append(form.append([btn,inputforoff,inputforservNo]));
	 					
	 					var td_10=$('<td></td>').text(v.servNo);
	 					var row=$('<tr></tr>').append([td_1,td_2,td_3,td_4,td_5,td_6,tdimg,td_8,td_9]);
	 					tbody.append(row);
					});
				});
			//抓蟲用
// 			$.ajax({
// 				type:'POST',
// 				data:{'servNo':truncate1},
// 				url:'${ctx}/ServiceJson',
// 				dataType:'json'
// 			}).done(function(hello){
// 				alert('in');
// 			}).fail(function(xhr,status,errorThrown){
// 				console.log(xhr);
// 				alert(status);
// 				alert(errorThrown);
// 			})
			
			})
		})
		</script>
		<script>
		$(function(){
			$('button[name="button2"]').click(function(){
				var truncate=$('select[name="servNo"]:eq(1)').val();
				console.log("forStep:"+truncate);
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
				var theadrow=$("<tr></tr>").attr("class","info").append([th1,th2,th3,th4,th5,th6])
				thead1.append(theadrow);	
				
				$.getJSON('${ctx}/ServiceStepJson',{servNo	:truncate},function(json){
					$.each(json,function(key,value){
// 	 					console.log("forStep:"+key);
//	 					console.log(value);
						var td1=$('<td></td>').text(value.servNo);
						var td2=$('<td></td>').text(value.servStep);
						var td3=$('<td></td>').text(value.stepName);
						var td4=$('<td></td>').text(value.stepDescp);
						var td5=$('<td></td>');
						var img1=$('<img></img>').attr("width","200").attr("src","data:image/jpeg;base64,"+value.stepPic);
						var tdimg=td5.append(img1);
						var td6=$('<td></td>')
						var btn=$('<button>查詢</button>').attr("type","submit").attr("class","btn btn-sm btn-primary");
						
// 						var form=$('<form></form>').attr("enctype","multipart/form-data").attr("method","post").attr("action","${ctx}/services/servicestep.do");
						var form=$('<form></form>').attr("method","post").attr("action","${ctx}/services/servicestep.do");
						
						
						var input =$("<input />").attr("type","hidden").attr("name","action").attr("value","getOne_For_Update");
						var input1 =$("<input />").attr("type","hidden").attr("name","servStepNo").attr("value",value.servStepNo);
// 						var input2 =$("<input />").attr("type","hidden").attr("name","servStep").attr("value",value.servStep);
// 						var input3 =$("<input />").attr("type","hidden").attr("name","stepName").attr("value",value.stepName);
// 						var input4 =$("<input />").attr("type","hidden").attr("name","stepDescp").attr("value",value.stepDescp);
// 						td6.append(form.append([btn,input,input1,input2,input3,input4]));
						td6.append(form.append([btn,input,input1]));
						var row=$('<tr></tr>').append([td1,td2,td3,td4,tdimg,td6]);
// 						form.append([row,input,input1]);
						tbody1.append(row);
					});
				})
			})
		})
		</script>

</body>

</html>