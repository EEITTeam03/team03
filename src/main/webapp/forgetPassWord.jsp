<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘記密碼</title>
<script src='https://www.google.com/recaptcha/api.js'></script>

<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- 中文字型 CSS -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanstc.css"
	rel="stylesheet">

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
			<a class="navbar-brand page-scroll" href="index.jsp">Car
				Detailing</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<li><a class="page-scroll ff-word btn btn-primary btn-xs"
					style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px"
					href="#"> <span class="glyphicon glyphicon-log-in"></span> 登入
				</a></li>
				<li><a class="page-scroll ff-word btn btn-primary btn-xs"
					style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;"
					href="register.jsp"> <span class="glyphicon glyphicon-user"></span>
						免費註冊
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
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">忘記密碼</h3>
					</div>
					<div class="panel-body">
						<div class="flot-chart-content" id="flot-bar-chart">
							<form action="reCaptcha.do" method="post">
								<br>
								<div class="input-group" style="border: 1px solid #5bc0de">
									<span class="input-group-addon"
										style="border-right: 1px solid #5bc0de"><i
										class="glyphicon glyphicon-envelope"></i></span> <input id="email"
										type="text" class="form-control required email" name="email"
										placeholder="輸入您的電子郵件" value='${param.email}'
										aria-required="true"> <small><font color="red">${ErrorMsgKey.AccountError}</font></small>

								</div>
								<br>
								<div class="input-group" style="border: 1px solid #5bc0de">
									<span class="input-group-addon"
										style="border-right: 1px solid #5bc0de"><i
										class="glyphicon glyphicon-phone"></i></span> <input id="phone"
										type="text" class="form-control required email" name="phone"
										placeholder="輸入您的電話號碼" value='${param.phone}'
										aria-required="true"> <small><font color="red">${ErrorMsgKey.PhoneError}</font></small>
								</div>
								<br>
								<div class="g-recaptcha"
									data-sitekey="6Lejoh8UAAAAADgia1z4Q_N9Cd2TwPa9K_uMHnzH"></div>
								<br>
								<button class="btn btn-lg btn-info btn-block" type="submit">送出</button>
								<small><Font color='red'>${ErrorMsgKey.RobotFail}</Font></small>
								<br /> <small><Font color='red'>${ErrorMsgKey.Error}</Font></small>
								<br />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<script>
		function check() {
			var v = grecaptcha.getResponse();
			if (v.length == 0) {
				alert("請勾選我不是機器人");
				return false;
			} else
				return true;
		}
	</script>
</body>
</html>