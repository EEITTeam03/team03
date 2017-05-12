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

<title>水膜汽車美容</title>

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

<link href="css/video.css" rel="stylesheet">
<link href="css/revision.css" rel="stylesheet">

<!-- jQuery -->
<script src="js/jquery.js"></script>



<!--[if lt IE 9]>
	<script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />

<style>
.img-services{
			width:360px;
			height:260px;
		}
		.big-img-services{
			width:700px;
			height:500px;
		}
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
	background: #3C3C3C;
	border-radius:15px;
	text-align: center;
	
}
#totle{
	color: black;
	font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	
}
.video{
	z-index:-1;
	
}
.col-sm-offset-5{
	font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	color: #FFD306;
}
.divOver{
 	background:#fed136;
	
	} 
</style>

<script type="text/javascript">
	$(function(){
		
		$("table > tbody > tr").hover(function(){
			$(this).addClass("divOver");
		},function(){
			$(this).removeClass("divOver");
		})
	});


</script>
</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="index.jsp">Car
					Detailing</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll ff-word" href="#">進行預約</a></li>
					<li><a class="page-scroll ff-word" href="#services">各類服務</a></li>
					<li><a class="page-scroll ff-word" href="#portfolio">美容項目</a>
					</li>
					<li><a class="page-scroll ff-word" href="#about">關於我們</a></li>
					<li><a class="page-scroll ff-word" href="#team">團隊成員</a></li>
					<li><a class="page-scroll ff-word" href="#contact">聯絡我們</a></li>
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
						    <li><a href="#">修改資料</a></li>
						    <li class="divider"></li>
						    <li><a href="LogOut">登出</a></li>
						</ul>				              
	 				</li>
				</c:if>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Header -->
	<header>
		<div class="video" style="position: absolute; opacity:0.8">
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


		<div class="container">
			<div style="height: 10em"></div>
		</div>


	</header>



	<div class="container" style="width: 80%;">
		<div class="row">
			<h2 class="col-sm-offset-5">預約成功</h2>
		</div>
		<div class="row col-sm-8 col-sm-offset-2">
			<table class="table ">
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
						<th scope="row">預約日期</th>
						<td>${reserve.reservDateTime.time}</td>
					</tr>
					<tr>
						<th scope="row">結束時間</th>
						<td>${reserve.reservEndTime.time}</td>
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
		<div class="row">
			<h2 class="col-sm-offset-5">服務明細</h2>
			<table class="table">
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
				<table  class="table">
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

	Services Section
		<section id="services">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2 class="section-heading">各類服務</h2>
						<h3 class="section-subheading text-muted">讓您可依照自身需求，選擇自己最適合的服務種類。</h3>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4">
						<span class="fa-stack fa-4x"> <i
							class="fa fa-circle fa-stack-2x text-primary"></i> <i
							class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
						</span>
						<h4 class="service-heading">現場服務</h4>
						<p class="text-muted">服務員現場為您安排，讓您聽美好音樂，品嚐美味甜點，悠閒等待您的愛車煥然一新。</p>
					</div>
					<div class="col-md-4">
						<span class="fa-stack fa-4x"> <i
							class="fa fa-circle fa-stack-2x text-primary"></i> <i
							class="fa fa-laptop fa-stack-1x fa-inverse"></i>
						</span>
						<h4 class="service-heading">預約服務</h4>
						<p class="text-muted">時間就是金錢，透過網路預約美容服務，讓愛車在指定時間內抵達，給予專業團隊立即為您服務。</p>
					</div>
					<div class="col-md-4">
						<span class="fa-stack fa-4x"> <i
							class="fa fa-circle fa-stack-2x text-primary"></i> <i
							class="fa fa-lock fa-stack-1x fa-inverse"></i>
						</span>
						<h4 class="service-heading">取還車服務</h4>
						<p class="text-muted">讓生活忙碌的您，無需為愛車美容奔波，本公司專業人員，將會前往您指定的地點取車，並在指定時間內完成美容服務送回指定地點。</p>
					</div>
				</div>
			</div>
		</section>




	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; Your Website 2016</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					</ul>
				</div>

				<div class="col-md-4">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>



	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"
		integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb"
		crossorigin="anonymous"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/agency.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : 'yy-mm-dd',
				yearRange : '-90:+0'
			});
		});
	</script>



</body>

</html>
