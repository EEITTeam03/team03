<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!--[if IE 6]>
<html id="ie6" dir="ltr" lang="zh-TW">
<![endif]-->
<!--[if IE 7]>
<html id="ie7" dir="ltr" lang="zh-TW">
<![endif]-->
<!--[if IE 8]>
<html id="ie8" dir="ltr" lang="zh-TW">
<![endif]-->
<!--[if !(IE 6) | !(IE 7) | !(IE 8)  ]><!-->
<html dir="ltr" lang="zh-TW">
<!--<![endif]-->
<head>

<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>訂單狀態</title>

<!--美美的icon-->
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<!-- 中文字型 CSS -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanstc.css"
	rel="stylesheet">

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Theme CSS -->
<link href="css/agency.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->

<link href="css/revision.css" rel="stylesheet">
 
<!-- jQuery -->
<script src="js/jquery.js"></script>


<style type="text/css">	
		.nav-fut-li{
			width: 114px;
			height: 50px;
			text-align: center;
			margin:0px 0px 0px 15px ;
		}
		.menu-fut-li{
			width: 114px;
			height: 50px;
			text-align: center;
			margin:10px 0px 0px 5px ;
		}		
		.fun-btn{
			width: 100%;
			height: 100%;
			padding:0px;
			margin:0px auto;
		    color: white;
		    background-color: #fed136;
		    border-color: #fed136;
		    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		    text-transform: uppercase;
		    font-weight: 700;					
		}		
		.fun-btn:hover{
			width: 100%;
			height: 100%;
			padding:0px;
			margin:0px auto;
		    color: #fed136;
		    background-color: transparent;
		    border-color: #fed136;
		    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		    text-transform: uppercase;
		    font-weight: 700;						
		}
		.mem-btn{
			width: 100%;
			height: 100%;
			padding:0px;
			margin:0px auto;
		    color: #fed136;
		    background-color: transparent;
		    border:0px;
		    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		    text-transform: uppercase;
		    font-weight: 700;					
		}
		.mem-btn:hover{
			width: 100%;
			height: 100%;
			padding:0px;
			margin:0px auto;
		    color: #fed136;
		    background-color: transparent;
		    border-color: #fed136;
		    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		    text-transform: uppercase;
		    font-weight: 700;						
		}	
		.dropdown-menu {
		    color: #fed136;
		    background-color: #222222;
			text-align: center;
 		    min-width: 114px; 
		}				
		.dropdown:hover .dropdown-menu {
			
			display: block;
		}
		label {
	font-size: 150%;
}
table, th, td {
	font-size: 120%;
	text-align: center;
}
.table{
	color: white;
	font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	text-align: center;
	
}
#totle{
	color: black;
	font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	
}
/* .video{ */
/* 	z-index:-1; */
	
/* } */
.col-sm-offset-5{
	font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	color: #131109;
}
.divOver{
 	background:#fed136;
	
}
thead{
	background: rgba(80, 128, 190, 0.7);
	
}
tbody tr:nth-child(2n-1) { 
 	background: rgba(208, 215, 231, 0.7); 
 } 
tr:nth-child(2n) {
	background: rgba(234, 239, 243, 0.7);
}
/* 調整滑入table資料時，所顯示的顏色 */
.table-hover tbody tr:hover th,tr:hover td{
	background: rgba(254, 209, 54, 0.3);
}
tbody tr th{
	color: black;
}
tbody tr td{
	color: black;
}
	</style>



  <script>
  
  
  $( function() {
		
		
	  	//進入網頁後，判斷螢幕大小，設定登入按鈕及註冊按鈕樣式
		var wdth = $(window).width();
		if(wdth<975){					
 		        $("#nav-log-in").addClass("menu-fut-li");
 		  		$("#nav-register").addClass("menu-fut-li");
		}
		if(wdth>=975){
 		        $("#nav-log-in").addClass("nav-fut-li");
 		  		$("#nav-register").addClass("nav-fut-li"); 
		}
		//結束
		
		//不斷監控(監聽)螢幕大小，藉此判斷登入、註冊按鈕是在nav上或者在menu內，來設定不同的樣式
 		$(window).resize(function() {
			var wdth = $(window).width();
			var logIn = $("#nav-log-in").attr("class");//先加空的class
			var regst = $("#nav-register").attr("class");//先加空的class
			var numln = null;
			var numrn = null;
			var numlm = null;
			var numrm =	null;

// 			console.log(logIn);
// 			console.log(regst);				
			
			if(logIn != undefined){
				numln =	logIn.indexOf("nav-fut-li");
				numlm =	logIn.indexOf("menu-fut-li");
			}				
			
			//當會員登入後，註冊按鈕會不存在，所以不用去比對註冊按鈕的class
			if(regst != undefined){
				numrn =	regst.indexOf("nav-fut-li");
				numrm =	regst.indexOf("menu-fut-li");
			}

			if( (wdth < 975) && (numln > -1) && (numrn > -1) ){
	   		        $("#nav-log-in").removeClass("nav-fut-li");
	   		  		$("#nav-register").removeClass("nav-fut-li");					
	   		        $("#nav-log-in").addClass("menu-fut-li");
	   		  		$("#nav-register").addClass("menu-fut-li");   		  		
	   		  		
			}
			if( (wdth >= 975) && (numlm > -1) && (numrm > -1) ){
	   		        $("#nav-log-in").removeClass("menu-fut-li");
	   		  		$("#nav-register").removeClass("menu-fut-li");
	   		        $("#nav-log-in").addClass("nav-fut-li");
	   		  		$("#nav-register").addClass("nav-fut-li"); 
			}
 		});
 			//結束  	
 	
   		
  } );
  

  </script>
	
		
</head>
<body id="page-top" class="index">
	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top affix">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top">Wash Me</a>
		</div>
	
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
                   <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="start_reserve.jsp">進行預約</a>                    	
                    </li>                    
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#services">各類服務</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#portfolio">美容項目</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#about">關於我們</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#team">團隊成員</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#contact">聯絡我們</a>
                    </li>
                    
						<!--	未登入	-->
				<c:if test="${empty Code}">                    
                    <li id="nav-log-in" class="">                    
	                    <button class="page-scroll ff-word btn btn-xs fun-btn" onclick="location.href='login.jsp'">
	   		
							<span class="glyphicon glyphicon-log-in"></span> 登入														
	                        
	                    </button>
	                </li>
                    <li id="nav-register" class="">
                    	<button class="page-scroll ff-word btn btn-xs fun-btn" onclick="location.href='register.jsp'">
   		
							<span class="glyphicon glyphicon-user"></span> 免費註冊															
                        
                        </button>                    
                    </li>	                 
				</c:if>

						<!--	已登入	-->
				<c:if test="${!empty Code}"> 
					<li id="nav-log-in" class="dropdown">     
						<button class="page-scroll ff-word dropdown-toggle mem-btn" data-toggle="dropdown">
							<li class="glyphicon glyphicon-user"></li>&nbsp;&nbsp;&nbsp;${memberInfo.memberName}
						</button>
						
						<ul class="dropdown-menu" role="menu">
						    <li><a href="orderStatus.jsp">訂單狀態</a></li>
						    <li><a href="member_update.jsp">修改資料</a></li>
						    <li><a href="feedback.jsp">意見回饋</a></li>
						    <li class="divider"></li>
						    <li><a href="LogOut">登出</a></li>
						</ul>				              
	 				</li>
				</c:if>                    
                    										
				</ul>
			</div>
	
		</div>
	</nav>

	<!-- Header -->
	<header>
		<div style="position: absolute;opacity:0.3">
			<video autoplay loop muted class="fillWidth" style="width: 100%;">

				<source src="video/file.mp4" type="video/mp4" />
				Your browser does not support the video tag. I suggest you upgrade
				your browser.
				<source src="video/video_preview_h264.wmv" type="video/wmv" />
				Your browser does not support the video tag. I suggest you upgrade
				your browser.
				<!-- object標籤內解決 -->
				<object>
					<embed src="video/video_preview_h264.mp4"
						type="application/x-shockwave-flash" allowfullscreen="false"
						allowscriptaccess="always"
						style="width: 100%; height: 100%; z-index: -1" loop="true" />
				</object>
			</video>
		</div>

	</header>


	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 table-responsive">
						<div class="container" style="width: 80%;">
		<div class="row">
			
		</div>
		<div class="row col-sm-8 col-sm-offset-2">
			<h2 class="col-sm-offset-5">預約成功</h2>
			<table class="table table-hover" >
				<thead>
					<tr>
						<th>項目</th>
						<th>內容</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">預約人</th>
						<td>${reserve.membercarsVO.memberInfoVO.memberName}</td>
					</tr>
					<tr>
						<th scope="row">預約編號</th>
						<td>${reserve.reservNo}</td>
					</tr>
					<tr>
						<th scope="row">開始時間</th>
						<td>${reserve.reservDateTimeFormat}</td>
					</tr>
					<tr>
						<th scope="row">結束時間</th>
						<td>${reserve.reservEndTimeFormat}</td>
					</tr>
					<tr>
						<th scope="row">品牌</th>
						<td>${reserve.membercarsVO.carTypeVO.brand}</td>
					</tr>
					<tr>
						<th scope="row">型號</th>
						<td>${reserve.membercarsVO.carTypeVO.carModel}</td>
					</tr>
					<tr>
						<th scope="row">服務技師</th>
						<td>${reserve.employeeVO.employeeName}</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="row">
			
		</div>
		<div class="row col-sm-8 col-sm-offset-2">
			<h2 class="col-sm-offset-5">服務明細</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>服務編號</th>
						<th>服務名稱</th>
						<th>服務價格</th>
						<th>服務時間</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="aitem" items="${reserve.reservlists}">
						<tr>
							<td>${aitem.servicesVO.servNo}</td>
							<td>${aitem.servicesVO.servName}</td>
							<td>${aitem.servPrice}元</td>
							<td>${aitem.servTime}分鐘</td>
						</tr>
						<c:set var="total" value="${total+aitem.servPrice}"></c:set>
						<c:set var="range" value="${range+aitem.servTime}"></c:set>
					</c:forEach>

				</tbody>
				
			</table>
			<div class="col-sm-offset-7" id="totle">
				<table  class="table table-hover">
				<thead>
					<tr>
						<th>總金額</th>
						<th>總時間</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${total} 元 </td>
						<td>${range/60} 小時</td>
					</tr>
				</tbody>
<%-- 				<h3>總金額: ${total} 元 ,總時間: ${range/60} 小時</h3> --%>
				</table>
			</div>
		</div>
	</div>
				</div>
			</div>
		</div>
	</section>
		
		<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>


</body>
</html>