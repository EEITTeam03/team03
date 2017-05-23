<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘記密碼</title>
<!--美美的icon-->
<link rel="icon" href="favicon.ico" type="image/x-icon" />

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

<style>
	.error {
		color: red;
	}

	.form-control{
	    padding-top: 15px;
	    background: rgba(0, 0, 0, 0.5);	    
	    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
	    border: none;
	    color: white;
	    padding: 10px 15px;
	    font-size: 16px;
	}
	form{
		background-repeat: no-repeat;
		width:945px;
	    background: rgba(255, 255, 255, 0.61);
	    max-width: 600px;
	    margin: 40px auto;
	    border-radius: 4px;
	    box-shadow:0 4px 10px 4px rgba(19, 35, 47, 0.3);
	}
	#cmxform input::-webkit-input-placeholder{ 	
		font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	}	
	#cmxform div input{
		font-size: 22px;
	    display: block;
	    width: 100%;
	    height: 100%;
	    padding: 5px 10px;
	    background: rgba(255, 255, 255, 0.75);
	    background-image: none;
	    border: 1px solid #a0b3b0;
	    color: black;
	    border-radius: 0;
	    -webkit-transition: border-color .25s ease, box-shadow .25s ease;
	    transition: border-color .25s ease, box-shadow .25s ease;
	}
	#cmxform div input:focus{
		outline: 0;
		border-color: #1ab188;
	}
	#cmxform div input[type='checkbox']{
		display:inline;
		width:50px;
		margin: 0 auto;
	}
	#cmxform div a{ 
		font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		color:black;
	    position: relative;
	    left:330px;
		bottom:5px;
	}
	#cmxform div a:hover{ 
		color:blue;
	}	
	.btn:hover, .btn:focus{
	    outline: none;
	    color:#fff;
	}
	.btn{
	    text-transform: capitalize;
	    color:#fff;
	    padding: 14px 20px;
	    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	.btn:hover{
	    color:#fff;
	}
	.btn-lg{
	    font-size: 20px;
	} 	
	.blue,
	.light-brown,
	.light-green,
	.light-orange{
	    background: #0088cc;
	    box-shadow:0 4px 0 #006394;
	    transition:all 0.1s ease-in-out 0s;
	    position: relative;
	    top:0;
	}
	.light-brown{
	    background: #cec2ab;
	    box-shadow: 0 4px 0 #b9a888;
	}
	.light-green{
	    background: #75d69c;
	    box-shadow:0 4px 0 #4ac97d;
	    border-radius: 25px;
	}
	.light-orange{
	    background: #fed136;
	    box-shadow:0 4px 0 rgb(228, 183, 54);
	} 
	
	.blue:hover,
	.light-brown:hover,
	.light-green:hover,
	.light-orange:hover{
	    top:2px;
	    box-shadow:0 2px 0 #006394;
	}
	.light-brown:hover{
	    box-shadow: 0 2px 0 #b9a888;
	}
	.light-green:hover{
	    box-shadow:0 2px 0 #4ac97d;
	}
	.light-orange:hover{
	    box-shadow: 0 2px 0 #fed136;
	}	

	input:-webkit-autofill {
	  -webkit-box-shadow:0 0 0 50px white inset; /* Change the color to your own background color */
	  -webkit-text-fill-color: #333;
	}
	
	input:-webkit-autofill:focus {
	  -webkit-box-shadow:0 0 0 50px white inset;
	  -webkit-text-fill-color: #333;
	}

</style>

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
			<a class="navbar-brand page-scroll" href="index.jsp">Wash Me</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<li><a class="page-scroll ff-word btn btn-primary btn-xs"
					style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px"
					href="login.jsp"> <span class="glyphicon glyphicon-log-in"></span> 登入
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
			<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2"></div>
			<div class="col-xs-10 col-sm-8 col-md-8 col-lg-8">
				<div class="flot-chart-content" id="flot-bar-chart">																	
					<form id="cmxform" class="form-signin" role="form" action="reCaptcha.do" method="post">
						<div class="row">
							<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">												
								<br>
								<br>
								<div class="input-group" style="max-width:500px;">	
									<img class="img-circle img-responsive" src="img/register/logo.png" alt="">
								</div>
								<br>																																										
								<div class="input-group">
									<input class="btn btn-secondary btn-sm" type="button" onclick="ch();" aria-invalid="false" style="width: 120px;" value="一鍵輸入">																	
									<input id="email" type="text" class="form-control required email" name="email" placeholder="輸入您的電子郵件" value='${param.email}' aria-required="true" style="width:500px;">														
									<small><font color="red">${ErrorMsgKey.AccountError}</font></small>														
								</div>															
								<br>															
								<div class="input-group">															
									<input id="phone" type="text" class="form-control required email" name="phone" placeholder="輸入您的電話號碼" value='${param.phone}' aria-required="true" style="width:500px;">														
									<small><font color="red">${ErrorMsgKey.PhoneError}</font></small>														
								</div>															
								<br>															
								<div class="g-recaptcha" data-sitekey="6Lejoh8UAAAAADgia1z4Q_N9Cd2TwPa9K_uMHnzH"></div>															
								<br>															
								<button class="btn btn-lg light-orange btn-block" type="submit">送出</button>															
								<small><Font color='red'>${ErrorMsgKey.RobotFail}</Font></small>															
								<br /> <small><Font color='red'>${ErrorMsgKey.Error}</Font></small>															
								<br />
							</div>
						</div>																		
					</form>																
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
		
		//一鍵輸入
		function ch(){
		 	document.getElementById('email').value = "BabyWashme@gmail.com";
		  	document.getElementById('phone').value = "0919871987";
		}
	</script>
</body>
</html>