<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.feedback.model.*"%>
<%@ page import = "java.util.*" %>
<%
FeedbackService fsvc = new FeedbackService();
    List<FeedbackVO> list = fsvc.getTop3();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<!--美美的icon-->
<link rel="icon" href="favicon.ico" type="image/x-icon" />
	
<!-- Bootstrap Core CSS -->
<link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<%-- <link href="${ctx}/admin/css/plugins/morris.css" rel="stylesheet"> --%>

<!-- Custom Fonts -->
<link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
	
	<!-- 中文字型 CSS -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanstc.css" rel="stylesheet">

<!-- SweetAlert -->
<script src="${ctx}/admin/SweetAlert/js/sweetalert.min.js"></script> 
<link href="${ctx}/admin/SweetAlert/css/sweetalert.css" rel="stylesheet" type="text/css">

 

<style>
.fa {
	font-size: 200%;
}

ul[class*="nav navbar-nav side-nav"] {
	font-size: 125%;
}
body,button,h1{
 font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	    text-transform: uppercase;
	    font-weight: 400;
	    font-size:16px;
	    letter-spacing: 1px;
	    color: black;
}
</style>
</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${ctx}/admin/scheduler.jsp">WASH ME後台管理</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
						class="caret"></b></a>
					<ul class="dropdown-menu message-dropdown">
                        <c:if test="${list.size()>0}">
                        <c:forEach var="fVO" items="${list}" begin="0" end="${list.size()-1}">
                        <li class="message-preview">
                            <a href="${ctx}/admin/ListOneFeedback.jsp?feedbackNO=${fVO.feedbackNo}">
                                <div class="media">
<!--                                     <span class="pull-left"> -->
<!--                                         <img class="media-object" src="http://placehold.it/50x50" alt=""> -->
<!--                                     </span> -->
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>${fVO.memberName}</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i>${fVO.feedbackDateStr}</p>
                                        <p>${fVO.feedback}</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        </c:forEach>
                        <li class="message-footer">
                            <a href="${ctx}/admin/ListAllfeedback.jsp">Read All New Messages</a>
                        </li>
                        </c:if>
                    </ul>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-bell"></i> <b
						class="caret"></b></a>
					<ul class="dropdown-menu alert-dropdown">
						<!--上方BAR提醒欄位 -->
						<li class="divider"></li>
						<li><a href="#">View All</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i> ${admin.name}
						<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
						</li>
						<li><a href="${ctx}/admin/ListAllfeedback.jsp"><i class="fa fa-fw fa-envelope"></i>
								Inbox</a></li>
						<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="AdminLogout"><i
								class="fa fa-fw fa-power-off"></i> Log Out</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->

			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li><a href="${ctx}/admin/scheduler.jsp"><i class="fa fa-car"></i> 管理工作排程</a></li>
					<li>
						<a href="#" data-toggle="collapse" data-target="#servicelist">
							<i class="fa fa-fw fa-table"></i>
							維護服務<i class="fa fa-fw fa-caret-down"></i>
						</a>
							<ul id="servicelist" class="collapse nav navbar-nav">
								<li><a href="${ctx}/services/ListAllServices.jsp">查看所有服務</a></li>
								<li><a href="${ctx}/services/ListAllServicesPriceAndTime.jsp">查看服務價格</a></li>
								<li><a href="${ctx}/services/ListAllServiceStep.jsp">所有服務步驟</a></li>
								<li><a href="${ctx}/services/SelectServices.jsp">選擇單筆服務步驟</a></li>
							</ul>
					
					</li>
					<li><a href="${ctx}/admin/chart.jsp" id="a_test"><i
							class="fa fa-fw fa-bar-chart-o"></i> 報表查詢</a></li>
					<li><a href="#" data-toggle="collapse" data-target="#blocklist">
							<i class="fa fa-fw fa-edit"></i> 
								黑名單<i class="fa fa-fw fa-caret-down"></i>
						</a>
							<ul id="blocklist" class="collapse nav navbar-nav">
								<li><a href="${ctx}/admin/maintainBlockList.jsp">新增黑名單</a></li>
								<li><a href="${ctx}/admin/listAllBlockList.jsp">列出黑名單</a></li>
<!-- 								<li><a href="">c</a></li> -->
							</ul>
						
					</li>

					<li>
						<a href="javascript:;" data-toggle="collapse" data-target="#demo">
							<i class="fa fa-fw fa-arrows-v"></i> 
								維護名單<i class="fa fa-fw fa-caret-down"></i>
						</a>
						<ul id="demo" class="collapse">
							<li>
								<a href="${ctx}/admin/member.jsp">會員</a>
							</li>
							<li>
							<a href="#" data-toggle="collapse" data-target="#demoemp">
									員工
								<i class="fa fa-fw fa-caret-down"></i>
							</a>
								<ul id="demoemp" class="collapse nav navbar-nav">
									<li><a href="${ctx}/emp/listAllEmp.jsp">員工清單</a></li>
<%-- 									<li><a href="${ctx}/emp/updateEmp.jsp">名單維護</a></li> --%>
									<li><a href="${ctx}/emp/insertEmp.jsp">新增名單</a></li>
								</ul>
							</li>
						</ul></li>
					<li><a href="${ctx}/admin/ListAllfeedback.jsp"><i class="fa fa-comments-o"></i> 查看意見</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
		<!-- 		整頁開始		 -->
		<div id="page-wrapper">
			<!-- *******內容開始 ********-->
			<div class="container-fluid">

				<!--         每行資料  class="row"     -->

				<div class="row">
					<div class="col-lg-12">
					<div id="contentDiv"></div>
					</div>
					<!-- /.row -->

				</div>
				<!-- /.container-fluid -->
				<!-- *******內容結束********-->

			</div>
			<!-- /#page-wrapper -->

		</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="${ctx}/admin/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="${ctx}/admin/js/bootstrap.min.js"></script>
	<!-- 偷用瑋倫的js來做表單驗證 -->
	<script src="${ctx}/js/jquery.validate.js"></script>
	<script src="${ctx}/js/messages_zh_TW.js"></script>
	
	<!-- Morris Charts JavaScript -->
<%-- 	<script src="${ctx}/admin/js/plugins/morris/raphael.min.js"></script> --%>
<%-- 	<script src="${ctx}/admin/js/plugins/morris/morris.min.js"></script> --%>
<%-- 	<script src="${ctx}/admin/js/plugins/morris/morris-data.js"></script> --%>


