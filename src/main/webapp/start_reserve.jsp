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
label {
	font-size: 150%;
}
</style>
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
					<li><a class="page-scroll ff-word btn btn-primary btn-xs"
						style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px"
						href="login.jsp"> <span class="glyphicon glyphicon-log-in"></span>
							登入
					</a></li>
					<li><a class="page-scroll ff-word btn btn-primary btn-xs"
						style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;"
						href="register.jsp"> <span class="glyphicon glyphicon-user"></span>
							免費註冊
					</a></li>
					<!--                     <li> -->
					<!--                         <a class="ff-word" style="text-shadow: black 5px 3px 3px;color:#FFFF66;" href="#"> -->
					<!--   							<span class="glyphicon glyphicon-log-in"></span> 登入 -->
					<!--                         </a> -->
					<!--                     </li>                     -->
					<!--                     <li> -->
					<!--                         <a class="ff-word" style="text-shadow: black 5px 3px 3px;color:#FFFF66;" href="#"> -->
					<!--   							<span class="glyphicon glyphicon-user"></span> 免費註冊 -->
					<!--                         </a> -->
					<!--                     </li>                                          -->

				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Header -->
	<header>
		<div style="position: absolute;opacity:0.8">
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
	<div style="height:10em">
	</div>
	</div>


	</header>



	<div class="container" style="width: 80%;">
		<div class="row">
			<h2 class="col-sm-offset-5">開始預約</h2>
		</div>

		<div class="row col-sm-offset-2">

			<form class="form-horizontal" action="ReserveService">
				<div class="form-group">
					<label for="inputLicense" class="col-sm-2 control-label">車牌</label>
					<div class="col-sm-6">
						<input type="text" name="license" id="inputLicense"
							class="form-control" placeholder="請輸入車牌" value="${param.license}">
					</div>
				</div>



				<div class="form-group">
					<label for="datepicker" class="col-sm-2 control-label">預約日期</label>
					<div class="col-sm-6">
						<input type="text" name="selectedDate" id="datepicker"
							class="form-control" value="${param.selectedDate}"
							placeholder="選擇日期">
					</div>
				</div>

				<div class="form-group">
					<label for="selectedTime" class="col-sm-2 control-label">時間</label>
					<div class="col-sm-6">
						<input type="text" name="selectedTime" id="selectedTime"
							class="form-control" value="${param.selectedTime}"
							placeholder="選擇時間(HH:mm)">
					</div>
				</div>

				<div class="form-group">
					<label for="service" class="col-sm-2 control-label">主要服務</label>
					<div class="col-sm-6">
						<select name="service" id="service" class="form-control">
							<option id="2001" value="2001">2001</option>
							<option id="2002" value="2002">2002</option>
							<option id="2003" value="2003">2003</option>
							<option id="2004" value="2004">2004</option>
							<option id="2005" value="2005">2005</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="plus" class="col-sm-2 control-label">加選服務</label>
					<div class="col-sm-6">
						<select name="plus" id="plus" class="form-control"
							multiple="multiple">
							<option id="1001" value="1001">1001</option>
							<option id="1002" value="1002">1002</option>
							<option id="1003" value="1003">1003</option>
							<option id="1004" value="1004">1004</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">選擇員工</label>
					<div class="col-sm-6">
						<label class="radio-inline"><input type="radio"
							name="empNo" value="1">1號員工</label> <label class="radio-inline"><input
							type="radio" name="empNo" value="2">2號員工</label> <label
							class="radio-inline"><input type="radio" name="empNo"
							value="3">3號員工</label>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 col-sm-offset-3">
						<input type="submit" value="送出預約" class="btn btn-xl">
					</div>
				</div>
			</form>
			<c:forEach var="msg" items="${errorMsg}">
				<h3 class="col-sm-6 col-sm-offset-3" style="color: red">${msg}</h3>
			</c:forEach>
		</div>
	</div>

	<!-- Services Section -->
<!-- 	<section id="services"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-12 text-center"> -->
<!-- 					<h2 class="section-heading">各類服務</h2> -->
<!-- 					<h3 class="section-subheading text-muted">讓您可依照自身需求，選擇自己最適合的服務種類。</h3> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row text-center"> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<span class="fa-stack fa-4x"> <i -->
<!-- 						class="fa fa-circle fa-stack-2x text-primary"></i> <i -->
<!-- 						class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i> -->
<!-- 					</span> -->
<!-- 					<h4 class="service-heading">現場服務</h4> -->
<!-- 					<p class="text-muted">服務員現場為您安排，讓您聽美好音樂，品嚐美味甜點，悠閒等待您的愛車煥然一新。</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<span class="fa-stack fa-4x"> <i -->
<!-- 						class="fa fa-circle fa-stack-2x text-primary"></i> <i -->
<!-- 						class="fa fa-laptop fa-stack-1x fa-inverse"></i> -->
<!-- 					</span> -->
<!-- 					<h4 class="service-heading">預約服務</h4> -->
<!-- 					<p class="text-muted">時間就是金錢，透過網路預約美容服務，讓愛車在指定時間內抵達，給予專業團隊立即為您服務。</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<span class="fa-stack fa-4x"> <i -->
<!-- 						class="fa fa-circle fa-stack-2x text-primary"></i> <i -->
<!-- 						class="fa fa-lock fa-stack-1x fa-inverse"></i> -->
<!-- 					</span> -->
<!-- 					<h4 class="service-heading">取還車服務</h4> -->
<!-- 					<p class="text-muted">讓生活忙碌的您，無需為愛車美容奔波，本公司專業人員，將會前往您指定的地點取車，並在指定時間內完成美容服務送回指定地點。</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->




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
