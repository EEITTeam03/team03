<%@page import="com.memberinfo.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty list}">
	<% 
		MemberService msvc = new MemberService();
		pageContext.setAttribute("list", msvc.getAll());
	%>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有會員</title>
    <!--美美的icon-->
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
 	<!-- SweetAlert -->
<script src="SweetAlert/js/sweetalert.min.js"></script> 
<link href="SweetAlert/css/sweetalert.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="Testhead_nav.jsp" />
	<c:if test="${!empty notFound}">
	<script type="text/javascript">
		swal('查無資料','所查詢的會員不存在\n或輸入錯誤','error');
	</script>
	<%session.removeAttribute("notFound"); %>
	</c:if>   
	<div id="wrapper">
		<div id="page-wrapper">
			
			<div class="col-lg-4">
				<form action="${ctx}/FindMember">
					<h3>電話:</h3> 
					<input type="text" name="phone" >
					<input type="hidden" name="mode" value="phone">
					<input type="submit" value="查詢" class="btn btn-primary"> 
				</form>
			</div>
			
				<form action="${ctx}/FindMember">
					<h3>email:</h3> 
					<input type="text" name="email" >
					<input type="hidden" name="mode" value="email">
					<input type="submit" value="查詢" class="btn btn-primary"> 
				</form>
			
			<div class="table-responsive">
				<h2 class="text-center"><a href="${ctx}/admin/member.jsp">所有會員</a></h2>
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="info">
							<th>會員編號</th>
							<th>姓名</th>
							<th>電子郵件</th>
							<th>電話</th>
							<th>生日</th>
							<th>地址</th>
							<th>帳號生效日期</th>
							<th colspan="2">選項</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${list}">
							<tr>
								<td>${member.memberNo}</td>
								<td>${member.memberName}</td>
								<td>${member.email}</td>
								<td>${member.phone}</td>
								<td>${member.birthday}</td>
								<td>${member.address}</td>
								<td>${member.effectiveDate}</td>
								<td><input name="checkcar" type="button" value="查看車輛" class="btn btn-sm btn-primary" onclick="location.href='${ctx}/admin/listMemberCars.jsp?memberNo=${member.memberNo}'"></td>
								<td>
								<form action="${ctx}/MemberServlet" method="post">
									<input type="hidden" name="action" value="getOne_For_Update">
									<input type="hidden" value="${member.memberNo}" name="memberNo">
									<input type="submit" value="修改" class="btn btn-sm btn-warning">
								</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="blockUI" style="display: none">
				<img src="${ctx}/img/loading/loading_gearwheal.gif" width="85px" height="85px"/>
			</div>
		</div>
	</div>
	<script src="${ctx}/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/blockUI/jquery.blockUI.js"></script>
	<script type="text/javascript">
	
		$(function() {
			loadingBlock();
			if("${OKalert}"=="updateOK") {
				//swal("修改成功!", "會員資料已更新", "success");
				swal({
				  title: "修改成功!",
				  text: "會員資料已更新",
				  imageUrl: "${ctx}/img/loading/check.png",
				  type: "",
				  timer: 700,
				  //animation: "slide-from-top",
				  showConfirmButton: false,
				  allowOutsideClick: true
			});
				<% session.removeAttribute("OKalert"); %>
			}
			
			
			$("input[name='checkcar']").click(function() {
				console.log($(this).parent().parent().children("td:first-child").text());
				var id = $(this).parent().parent().children("td:first-child").text();
				var root = "${ctx}"+"/GetCars";
				$.getJSON(root,{"no":id},function(data){
					console.log(data);
					
				});
			});
			loadingUnblock();
			
		});
		function loadingBlock(){
		 	 $.blockUI({ 
		 		message: $('div.blockUI'),
	  		 	css: { 
	  				border: 'none',
	               left: ($(window).width() - 133) /2 + 'px', 
					'-webkit-border-radius': '10px', 
	          		'-moz-border-radius': '10px', 
	           	padding: '25px',
	               opacity: 0.7,
	           	width: '133px',
	           	height: '133px'
	           },
	  		 	fadeIn: 0
	  		 }); 
		 }
		 function loadingUnblock(){
		 	$.unblockUI();
		 	//alert("close block");
		 }
	</script>
</body>
</html>