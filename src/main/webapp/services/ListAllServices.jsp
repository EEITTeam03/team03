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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
    <!-- Bootstrap Core CSS -->
    <link href="../admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../admin/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../admin/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 管理員 <b class="caret"></b></a>
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
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li >
                        <a href="#"><i class="fa fa-car"></i> 管理工作排程</a>
                   
                    <li class="active">
                        <a href="../services/SelectServices.jsp"><i class="fa fa-fw fa-table"></i> 維護服務項目</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-bar-chart-o"></i> 報表查詢</a>
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
                             	維護服務項目  	<small>空空如也</small>
                        </h1>
                         <ol class="breadcrumb"> 
                             <li class="active"> 
                                 <i class="fa fa-dashboard"></i> <a href="SelectServices.jsp">回首頁</a>
<!--                             </li> -->
<!--                             <li class="active"> -->
<!--                                 <i class="fa fa-info-circle"></i> 真的什麼都沒有 -->
<!--                             </li> -->
                         </ol>
                    </div>
                    </div>
                    <div class="row">
	<table border='1' bordercolor='#CCCCFF' width='1600'>
		<tr>
			<th>服務編號</th>
			<th>服務類型編號</th>
			<th>服務名稱</th>
			<th>服務有效日期</th>
			<th>服務狀態</th>
			<th>服務描述</th>
			<th>服務照片</th>
			<th colspan="2">選項</th>
		</tr>
		<c:forEach var="servicesVO" items="${list}">
			<tr align='center' valign='middle'>
				<td width="300">${servicesVO.servNo}</td>
				<td width="300">${servicesVO.servTypeNo}</td>
				<td width="300">${servicesVO.servName}</td>
				<td width="300">${servicesVO.servEffectiveDate}</td>
				<td width="300">${servicesVO.servStatus}</td>
				<td width="300">${servicesVO.servDesc}</td>
				<td><c:choose>
						<c:when test="${servicesVO.servPhoto !=null}">
							<img
								src='data:image/jpeg;base64,${Base64.getEncoder().encodeToString(servicesVO.servPhoto)}'
								width="150" />
						</c:when>
						<c:when test="${servicesVO.servPhoto==null}">
						沒有服務照片
					</c:when>
					</c:choose></td>

				<td>
					<FORM METHOD="post" ACTION="services.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="servNo" value="${servicesVO.servNo}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="services.do">
						<input type="submit" value="下架"> 
						<input type="hidden" name="servNo" value="${servicesVO.servNo}"> 
						<input type="hidden" name="action" value="offshelf">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
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
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../js/plugins/morris/raphael.min.js"></script>
    <script src="../js/plugins/morris/morris.min.js"></script>
    <script src="../js/plugins/morris/morris-data.js"></script>


</body>
</html>