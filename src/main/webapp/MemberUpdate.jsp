<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>修改會員</title>
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
<!-- <link rel="stylesheet" href="ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" /> -->
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/blitzer/theme.css" id="THEME_CSS"/>
<!-- jQuery -->
<script src="js/jquery.js"></script>
<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script> 
<!--[if lt IE 9]>
	<script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" /> 	

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>







  <script>
//   $(function(){
// 	  		var no=$("#no").text();
// 			$.getJSON("GetCars",{"no":no},function(json){
// 				$.each(json,function(idx,aa){
					
// 					console.log(aa);
					
					
		    				    		
// 				});				
// 			}); 			
//   	});	

  
  
  </script>



	
	
	
	
	
</head>
<body id="page-top" class="index">
	<!-- Navigation -->
	<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top affix">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="index.jsp">Car
					Detailing</a>
			</div>
	
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll ff-word btn btn-primary btn-xs"
						style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px"
						href="login.jsp"> <span class="glyphicon glyphicon-log-in"></span> 登入
					</a></li>
					<li><a class="page-scroll ff-word btn btn-primary btn-xs"
						style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;"
						href="#"> <span class="glyphicon glyphicon-user"></span> 免費註冊
					</a></li>
				</ul>
			</div>
	
		</div>
	</nav>

	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2"></div>
	
				<div class="col-xs-10 col-sm-8 col-md-8 col-lg-8">
					<div class="panel panel-danger" style="border-color:salmon">
						<div class="panel-heading" style="background-color:salmon;border-color:salmon;color:white;">
							<h3 class="panel-title">修改會員資料</h3>
						</div>
						
						<div class="panel-body">
							<div class="flot-chart">
								<div class="flot-chart-content" id="flot-bar-chart">
									<form class="form-signin" role="form" action="MemberServlet" method="post">
									
										<br>
									
										<div class="input-group" style="border:1px solid #FFB6C1">
										  	<span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-user"></i></span>
										  	<input id="name" type="text" class="form-control" name="name" placeholder="輸入您的姓名" value='${memberInfo.memberName}' readonly>
											<small><Font color='red' >${ErrorMsgKey.NameEmptyError}</Font></small><br>
										</div>										
										
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										  	<span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-envelope"></i></span>
										  	<input id="email" type="text" class="form-control" name="email" placeholder="輸入您的電子郵件" value='${memberInfo.email}' readonly>
											<small><Font color='red' >${ErrorMsgKey.EmailEmptyError}</Font></small><br>
										</div>
										
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										    <span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-lock"></i></span>
										    <input id="password" type="password" class="form-control" name="password" placeholder="輸入您的密碼" value='${memberInfo.password}'>
											<small><Font color='red' >${ErrorMsgKey.PasswordEmptyError}</Font></small><br>
										</div>
										
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										    <span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-phone"></i></span>
										    <input id="phone" type="phone" class="form-control" name="phone" placeholder="輸入您的電話" value='${memberInfo.phone}' readonly>
											<small><Font color='red' >${ErrorMsgKey.PhoneEmptyError}</Font></small><br>
										</div>
										
										<br>										

										<div class="input-group" style="border:1px solid #FFB6C1">
										    <span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-time"></i></span>
										    <input id="datepicker" type="datepicker" class="form-control" name="datepicker" placeholder="輸入您的出生年月日" value='${memberInfo.birthday}' readonly>
											<small><Font color='red' >${ErrorMsgKey.BirthdayEmptyError}</Font></small><br>
										</div>
										
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										    <span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-time"></i></span>
										    <input id="address" type="text" class="form-control" name="address" placeholder="輸入您的地址" value='${memberInfo.address}'>
											<small><Font color='red' >${ErrorMsgKey.AddressEmptyError}</Font></small><br>
										</div>
									
										<br>																													
										
										<input type="hidden" name="action" value="update">
										<input type="hidden" name="memberNo" value="${param.memberNo}">
										<input type="hidden" name="effectiveDate" value="${param.effectiveDate}">
										<button class="btn btn-lg btn-info btn-block" type="submit" style="background-color:#FFB6C1;border-color:#FFB6C1;color:white;" >下一步</button>
										
									</form>	
								</div>
							</div>
						</div>
						
					</div>	
				</div>
				
				<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2"></div>
	
			</div>
		</div>
	</section>
	


</body>
</html>