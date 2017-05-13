<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<title>會員登入</title>

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

<!-- 驗證 -->
<script src="js/jquery.validate.js" type="text/javascript"></script>


<script>
  $(function(){
    
    $("#cmxform").validate();
    
  });
</script>

<style>
.error {
	color: red;
}
</style>



<!--[if lt IE 9]>
	<script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->


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
						<h3 class="panel-title">會員登入</h3>
					</div>

					<div class="panel-body">
						<div class="flot-chart-content" id="flot-bar-chart">

							<form id="cmxform" class="form-signin" role="form"
								action='login.do'>

								<br>

								<div class="input-group" style="border: 1px solid #5bc0de">
									<span class="input-group-addon"
										style="border-right: 1px solid #5bc0de"><i
										class="glyphicon glyphicon-envelope"></i></span> <input id="email"
										type="text" class="form-control required email" name="email"
										placeholder="輸入您的電子郵件" value='${param.email}'> <small><Font
										color='red'>${ErrorMsgKey.AccountEmptyError}</Font></small>

								</div>

								<br>

								<div class="input-group" style="border: 1px solid #5bc0de">
									<span class="input-group-addon"
										style="border-right: 1px solid #5bc0de"><i
										class="glyphicon glyphicon-lock"></i></span> <input id="password"
										type="password" class="form-control required" name="password"
										placeholder="輸入您的密碼" value='${param.password}'> <small><Font
										color='red'>${ErrorMsgKey.PasswordEmptyError}</Font></small>

								</div>

								<div class="checkbox">
									<label> <input type="checkbox" value="remember-me">記住密碼
									</label>
								</div>

								<button class="btn btn-lg btn-info btn-block" type="submit">登入</button>
								<small><Font color='red'>${ErrorMsgKey.LoginError}</Font></small>
							</form>
							<div style="padding-top: 15px" align="center">
								<fb:login-button scope="public_profile,email"
									onlogin="checkLoginState();" size="xlarge">使用FB帳號登入
								</fb:login-button>
								 	<div id="status"></div>
							</div>
							<div style="padding-top: 15px" align="center">
								<a href="forgetPassWord.jsp" class="btn btn-danger"
									role="button">忘記密碼</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2"></div>

	</div>
	</section>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Facebook登入 -->
	<script>
		// This is called with the results from from FB.getLoginStatus().

		// 		function statusChangeCallback(response) {
// 			console.log('statusChangeCallback');
// 			console.log(response);
// 			// The response object is returned with a status field that lets the
// 			// app know the current login status of the person.
// 			// Full docs on the response object can be found in the documentation
// 			// for FB.getLoginStatus().
// 			if (response.status === 'connected') {
// 				// Logged into your app and Facebook.

// 			} else {
// 				// The person is not logged into your app or we are unable to tell.
// 				document.getElementById('status').innerHTML = 'Please log '
// 						+ 'into this app.';
// 			}
// 		}

		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				//statusChangeCallback(response);
				testAPI(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '1787564341572824',
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.8' // use graph api version 2.8
			});

			// Now that we've initialized the JavaScript SDK, we call 
			// FB.getLoginStatus().  This function gets the state of the
			// person visiting this page and can return one of three states to
			// the callback you provide.  They can be:
			//
			// 1. Logged into your app ('connected')
			// 2. Logged into Facebook, but not your app ('not_authorized')
			// 3. Not logged into Facebook and can't tell if they are logged into
			//    your app or not.
			//
			// These three cases are handled in the callback function.

// 			FB.getLoginStatus(function(response) {
// 				statusChangeCallback(response);
// 			});

		};

		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/zh_TW/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		// Here we run a very simple test of the Graph API after login is
		// successful.  See statusChangeCallback() for when this call is made.
		function testAPI(response) {
			if(response.status==='connected'){
			FB.api('/me', function(response) {
				console.log(JSON.stringify(response));
				var myJSONText = JSON.stringify(response);
				var xx = JSON.parse(myJSONText)
				console.log(xx.id);
				$.ajax({
					url : 'CheckFBLogin',
					type : 'POST',
					data : {
						'id' : xx.id,
						'name' : xx.name,
						'email' : xx.email
					},
					dataType:'text',
					success : function(data) {
//							var account = '${FBAccount}';
//							alert('${FBAccount}');
//							console.log(data);							
						if(data=="Account Not found"){
							window.top.location.href = "register.jsp"
						}else{
							var mytarget= '${target}';
							console.log(mytarget);
							if(mytarget==''){
							window.top.location.href ="index.jsp"
							}else
								window.top.location.href= mytarget;
						}							
					},
					error : function(data) {
						alert("ERROR");
					}
				});
			},{
				fields : 'id,name,email'
			});

			}
		}
	</script>

	<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->
</body>
</html>