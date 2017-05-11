<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.servicestep.model.*"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
    <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${ctx}/admin/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- ***排程表引用開始*** -->
   	<link rel="stylesheet" href="${ctx}/scheduleJS/jqwidgets/styles/jqx.base.css" type="text/css" />
	<script type="text/javascript" src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
	<!-- ***排程表引用結束*** -->
	<script type="text/javascript">
		$(document).ready(function () {
			init();
		});	
	
		function init(){
			initClick();
		}
		
		function initClick(){
			$('#a_scheduler').click(function(){
				$('#contentDiv').load('${ctx}/scheduleTest3.jsp');
			});
			$('#services').click(function(){
				//超連結連到xxx.jsp,顯示在contentDiv,如此jQuery.boostrap框架只需載入一次
				//程式跟框架可分開修改
				//引用的link.script使用絕對路徑.若資料夾不同servlet的urlpattrens也要注意
				$('#contentDiv').load('${ctx}/services/SelectServices.jsp');
			});
			$('#XXX').click(function(){
				//超連結連到xxx.jsp,顯示在contentDiv,如此jQuery.boostrap框架只需載入一次
				//程式跟框架可分開修改
				//引用的link.script使用絕對路徑.若資料夾不同servlet的urlpattrens也要注意
				$('#contentDiv').load('${ctx}/XXX.jsp');
			});
		}
	</script>

<style>
.fa {
    font-size: 200%;
}
ul[class*="nav navbar-nav side-nav"] {
	font-size: 125%;
}

</style>
</head>
<body>
 <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="admin.jsp">汽車美容後台管理</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
			<!-- 上方BAR的訊息 -->
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
			<!--上方BAR提醒欄位 -->
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${admin.name} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="AdminLogout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="#" id="a_scheduler" ><i class="fa fa-car"></i> 管理工作排程</a>
                    </li>
                    <li>
                        <a href="#" id="services"><i class="fa fa-fw fa-table"></i> 維護服務項目</a>
                    </li>
                    <li>
                        <a href="#" id="a_test"><i class="fa fa-fw fa-bar-chart-o"></i> 報表查詢</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-edit"></i> 管理黑名單</a>
                    </li>

                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> 維護名單<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">會員</a>
                            </li>
                            <li>
                                <a href="#">員工</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-comments-o"></i> 查看意見</a>
                    </li>
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
                        <h1 class="page-header">
                             	這是空殼子  	<small>空空如也</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> 什麼都沒有
                            </li>
                            <li class="active">
                                <i class="fa fa-info-circle"></i> 真的什麼都沒有
                            </li>
                        </ol>
                    </div>
                </div>
			<div class="row">
          		<div class="col-lg-12">
          			<div id="contentDiv">
<div>
	<table border='1' bordercolor='#CCCCFF' width='1600'>
		<tr>
			<th>服務編號</th>
			<th>服務步驟</th>
			<th>步驟名稱</th>
			<th>步驟描述</th>
			<th>服務照片</th>
			<th colspan="2">選項</th>
		</tr>

		<c:forEach var="serviceStepVO" items="${serviceStepList}">
			<tr align='center' valign='middle'>
				<td>${serviceStepVO.servicesVO.servNo}</td>
				<td>${serviceStepVO.servStep}</td>
				<td>${serviceStepVO.stepName}</td>
				<td>${serviceStepVO.stepDescp}</td>
				<td><c:choose>
						<c:when test="${serviceStepVO.stepPic !=null}">
							<img
								src='data:image/jpeg;base64,${Base64.getEncoder().encodeToString(serviceStepVO.stepPic)}'
								width="150" />
						</c:when>
						<c:when test="${serviceStepVO.stepPic==null}">
					沒有服務照片
				</c:when>
					</c:choose></td>
				<td>
				<!-- 修改了name從servNo---servStepNo 
					value從serviceStepVO.servicesVO.servNo換成serviceStepVO.servStepNo
				-->
					<FORM METHOD="post" ACTION="servicestep.do">
						<input type="submit" value="修改"> <input type="hidden"
							name="servStepNo" value="${serviceStepVO.servStepNo}"> 
							<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="services.do">
						<input type="submit" value="下架"> <input type="hidden"
							name="servNo" value="${servicesVO.servNo}"> 
							<input type="hidden" name="action" value="offshelf">
					</FORM>
				</td>
			</tr>

		</c:forEach>
	</table>
	</div>
            		</div>
          		
          		
          		</div>
          </div>
                <!-- /.row -->
                
                
            </div>
            <!-- /.container-fluid -->
	<!-- *******內容結束********-->
	
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="${ctx}/admin/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${ctx}/admin/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${ctx}/admin/js/plugins/morris/raphael.min.js"></script>
    <script src="${ctx}/admin/js/plugins/morris/morris.min.js"></script>
    <script src="${ctx}/admin/js/plugins/morris/morris-data.js"></script>


</body>
</html>