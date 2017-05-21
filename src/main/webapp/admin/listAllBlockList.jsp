<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.blocklist.model.*"%>
<%@ page import = "java.util.*" %>
<%
BlockListService blsvc = new BlockListService();
    List<BlockListVO> list = blsvc.getAllBlockList();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!--美美的icon-->
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
	
<title>所有黑名單</title>
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
	<h1>所有黑名單</h1>
	<table class="table table-bordered table-hover">
	<thead>
	<tr>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>違反日期</th>
		<th>違反原因</th>
		<th>預約編號</th>
	</tr>
	</thead>
	<c:if test="${list.size()!=0}">
	<c:forEach var="blkVO" items="${list}" begin="0" end="${list.size()-1}">
		<tr align='center' valign='middle'>
			<td>${blkVO.memberInfoVO.memberNo}</td>
			<td>${blkVO.memberInfoVO.memberName}</td>
			<td>${blkVO.violationDate}</td>
			<td>${blkVO.blockRuleVO.blockRule}</td>
			<td>${blkVO.reservationNo}</td>
		</tr>
	</c:forEach>
	</c:if>
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
	$(function(){
		loadingBlock();
		if("${OKalert}"=="updateOK"){
// 			swal("新增成功!", "已加入黑名單", "success");
			swal({
				  title: "新增成功!",
				  text: "已加入黑名單",
				  imageUrl: "${ctx}/img/loading/check.png",
				  type: "",
				  timer: 700,
				  //animation: "slide-from-top",
				  showConfirmButton: false,
				  confirmButtonText: "確定刪除",
				  cancelButtonText:"取消",
				  allowOutsideClick: true
			});
			<% session.removeAttribute("OKalert"); %>
		}
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