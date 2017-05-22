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

<title>會員登入</title>
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

<!-- 驗證 -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<!-- 驗證 繁體中文包-->
<script src="js/messages_zh_TW.js" type="text/javascript"></script>

<script>
  $(function(){
    
    $("#cmxform").validate();  
    
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
	
	//進入網頁後，判斷螢幕大小，設定登入按鈕及註冊按鈕的排版
	if( wdth < 751){
  		$(".navbar-nav li").css("float","none");
	}
	if( wdth >= 751){
	  	$(".navbar-nav li").css("float","left");
	}
	//結束		
	
	//不斷監控(監聽)螢幕大小，藉此判斷登入、註冊按鈕是在nav上或者在menu內，來設定不同的樣式
	$(window).resize(function() {
		var wdth = $(window).width();
		var logIn = $("#nav-log-in").attr("class");
		var regst = $("#nav-register").attr("class");
		var numln = null;
		var numrn = null;
		var numlm = null;
		var numrm =	null;

// 		console.log(wdth);
			
		
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
		if( wdth < 751){
	  		$(".navbar-nav li").css("float","none");
		}
		if( wdth >= 751){
		  	$(".navbar-nav li").css("float","left");
		}		
		
	});
	//結束  
    
    
  });
  
				  
  
</script>

<style>
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
	.pr{
		position: relative;
	}
	#cmxform div a{ 
		font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		color:black;
		position:absolute;
		right:0;
		bottom:0;
		margin:1px;
	}
	#cmxform div a:hover{ 
		color:blue;
	}	
	#cmxform .btn:hover, .btn:focus{
	    outline: none;
	    color:#fff;
	}
	#cmxform .btn{
	    text-transform: capitalize;
	    color:#fff;
	    padding: 14px 20px;
	    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	#cmxform .btn-lg{
	    font-size: 20px;
	} 	
	#cmxform  .blue,.light-brown,.light-green,.light-orange{
	    background: #0088cc;
	    box-shadow:0 4px 0 #006394;
	    transition:all 0.1s ease-in-out 0s;
	    position: relative;
	    top:0;
	}
	#cmxform  .light-brown{
	    background: #cec2ab;
	    box-shadow: 0 4px 0 #b9a888;
	}
	#cmxform  .light-green{
	    background: #75d69c;
	    box-shadow:0 4px 0 #4ac97d;
	    border-radius: 25px;
	}
	#cmxform  .light-orange{
	    background: #fed136;
	    box-shadow:0 4px 0 rgb(228, 183, 54);
	} 
	
	#cmxform  .blue:hover,.light-brown:hover,.light-green:hover,.light-orange:hover{
	    top:2px;
	    box-shadow:0 2px 0 #006394;
	}
	#cmxform .light-brown:hover{
	    box-shadow: 0 2px 0 #b9a888;
	}
	#cmxform .light-green:hover{
	    box-shadow:0 2px 0 #4ac97d;
	}
	#cmxform .light-orange:hover{
	    box-shadow: 0 2px 0 #fed136;
	}	

	#cmxform input:-webkit-autofill {
	  -webkit-box-shadow:0 0 0 50px white inset; /* Change the color to your own background color */
	  -webkit-text-fill-color: #333;
	}
	
	#cmxform input:-webkit-autofill:focus {
	  -webkit-box-shadow:0 0 0 50px white inset;
	  -webkit-text-fill-color: #333;
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
			<a class="navbar-brand page-scroll" href="index.jsp">Wash Me</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
						
						<!--	未登入	-->
				<c:if test="${empty memberInfo}">                    
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
				<div class="col-sm-1 col-md-2 col-lg-3"></div>
	
				<div class="col-xs-12 col-sm-10 col-md-8 col-lg-6">
					<form id="cmxform" class="form-signin col-xs-12 col-sm-12 col-md-12 col-lg-12" role="form" action='login.do'>												
						<div class="row">
							<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">												
								<br>
								<br>
								<div class="input-group" style="max-width:500px;">	
									<img class="img-circle img-responsive" src="img/register/logo.png" alt="">
								</div>
								<br>										
								<div class="input-group" style="width:100%;">											
									<input id="email" type="text" class="form-control required email" name="email" placeholder="輸入您的電子郵件" value='${param.email}'> 										
									<small><Font color='red'>${ErrorMsgKey.AccountEmptyError}</Font></small>										
								</div>											
																			
								<br>											
																			
								<div class="input-group" style="width:100%;">											
									<input id="password" type="password" class="form-control required" name="password" placeholder="輸入您的密碼" value='${param.password}'>										
									<small><Font color='red'>${ErrorMsgKey.PasswordEmptyError}</Font></small>										
								</div>
																			
								<br>
																													
								
								<div class="input-group" style="width:100%;">												
									<button class="btn btn-lg light-orange btn-block" type="submit">登入</button>											
									<small><Font color='red'>${ErrorMsgKey.LoginError}</Font></small>

								</div>
								<br>
								<br>
								
								<div class="input-group pr" style="width:100%;">												
									<fb:login-button scope="public_profile,email" onlogin="checkLoginState();" size="xlarge"></fb:login-button>
									<a href="forgetPassWord.jsp" >忘記密碼?</a>
									<div id="status"></div>																																														
								</div>
								<br>																											
							</div>
						</div>												
					</form>												
	

								
									
								
								
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
				appId : '1435581133174244',
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
				var password = xx.id+'z';
				console.log(password);
				$.ajax({
					url : 'CheckFBLogin',
					type : 'POST',
					data : {
						'id' : password,
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
							//console.log(mytarget);
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