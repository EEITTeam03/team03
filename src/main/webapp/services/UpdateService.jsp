<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.services.model.*"%>
<%
	ServicesVO servicesVO = (ServicesVO) request.getAttribute("servicesVO");
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
                    </li>
<!--                     <li> -->
<!--                         <a href="#"><i class="fa fa-fw fa-table"></i> 維護服務項目</a> -->
<!--                     </li> -->
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
                             	修改服務  	
<!--                              	<small>空空如也</small> -->
                        </h1>
                        <ol class="breadcrumb">
<!--                             <li class="active"> -->
<!--                                 <i class="fa fa-dashboard"></i> 什麼都沒有 -->
<!--                             </li> -->
<!--                             <li class="active"> -->
<!--                                 <i class="fa fa-info-circle"></i> 真的什麼都沒有 -->
<!--                             </li> -->
                        </ol>
                    </div>
<FORM METHOD="post" ACTION="services.do" enctype="multipart/form-data" name="form1">
	<table border="0">
		<tr>
			<td>服務編號:<font color=red><b>*</b></font></td>
			<td><%=servicesVO.getServNo()%></td>
		</tr>
		<tr>
			<td>服務類型編號:</td>
			<td>
			<input type="TEXT" name="servTypeNo" size="45" value="<%=servicesVO.getServTypeNo()%>" /></td>
		</tr>
		<tr>
			<td>服務名稱:</td>
			<td>
			<input type="TEXT" name="servName" size="45" value="<%=servicesVO.getServName()%>" /></td>
		</tr>
		<tr>
			<td>服務有效日期:</td>
			<td bgcolor="#5EC1E5">
				<input type="date" name="servEffectiveDate" value="<%=servicesVO.getServEffectiveDate()%>">
			</td>
		</tr>
		<tr>
		<jsp:useBean id="SS" scope="page" class="com.services.model.ServicesService" />
			<td>服務狀態:</td>
			<td>
			<input type="TEXT" name="servStatus" size="45" value="<%=servicesVO.getServStatus()%>" />
				
			</td>
		</tr>
		<tr>
			<td>服務描述:</td>
			<td>
			<input type="TEXT" name="servDesc" size="45"value="<%=servicesVO.getServDesc()%>" /></td>
		</tr>

		<tr>
			<td>服務照片:</td>
			<td><input type="file" name="servPhoto" size="45" value="<%=servicesVO.getServDesc()%>" />
			<font size="-1" color="#FF0000">${MsgMap.errorservPhoto}</font></td>
		</tr>
		
		</table>
		<br> 
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="servNo" value="<%=servicesVO.getServNo()%>"> 
		<input type="submit" value="送出修改">
	</FORM>
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