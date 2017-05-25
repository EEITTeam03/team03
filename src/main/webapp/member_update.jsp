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

<title>修改會員資料</title>
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
<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script> 
<!--[if lt IE 9]>
	<script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" /> 	

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/blitzer/theme.css" id="THEME_CSS"/>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 驗證 -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<!-- 驗證 繁體中文包-->
<script src="js/messages_zh_TW.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script>
  $( function() {
	  
    $( "#datepicker" ).datepicker({
      	changeMonth: true,
      	changeYear: true,
      	dateFormat: 'yy-mm-dd',
    	yearRange: '-90:+0',
    	monthNamesShort: [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ]
    });
    
    $("#cmxform").validate({
    	  rules: {
    		    password: "required",
    		    password_again: {
    		      equalTo: "#password"
    		    }
    		  }
    		});

	//進入網頁後，判斷螢幕大小，設定登入按鈕及註冊按鈕的排版
	var wdth = $(window).width();
	if( wdth < 751 ){
		$(".nav li a").css("display","inline");
		$(".nav li").css("float","left");
	}
	if( wdth >= 751 ){
		$(".nav li a").css("display","block");
		$(".nav li").removeAttr("float");
	}
	//結束		
	
	//不斷監控(監聽)螢幕大小，藉此判斷登入、註冊按鈕是在nav上或者在menu內，來設定不同的樣式
	$(window).resize(function() {
		var wdth = $(window).width();
// 		console.log(wdth);
								
		if( wdth < 751 ){
			$(".nav li a").css("display","inline");
			$(".nav li").css("float","left");
		}
		if( wdth >= 751 ){
			$(".nav li a").css("display","block");
			$(".nav li").removeAttr("float");
		}	
		
	});
	//結束      
        
    
//     //chrome強制記憶密碼，導致input背景顏色被chrome的瀏覽器預設樣式，強制更換成黃色，造成整體版面顏色不和諧，解決步驟如下。
//     //1.初始，密碼name設為空，可關閉強制記憶密碼
// 	$(document).on("focus", "body", function(event){
// 		$("input[type*='password']").attr({"name":""});
// 	});     
//     //2.表單送出前，把密碼的name設定回來，否則密碼資料不會送到後端
//     $("#sb").on("click",function(){
//     	$("input[type*='password']").attr({"name":"password"});
//     });	       	
  
    
 });


	
</script>


<style>
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



	.ui-datepicker-month{
		color:black;
	}
	.ui-datepicker-year{
		color:black;
	}
	.undone-step{
	    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	    text-transform: uppercase;
	    font-weight: 400;
	    letter-spacing: 1px;
	    color: white;
	}
	.error{
		color:red;
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
	label{
		font-size: 24px;
		font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	
</style>	
	
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
				<a class="navbar-brand page-scroll" href="index.jsp">Wash Me</a>
			</div>
	
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li class="page-scroll ff-word" >
						<a class="page-scroll ff-word btn btn-primary btn-xs" style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px" href="#"> 基本資料 </a>
					</li>
					<li class="page-scroll ff-word" style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;color:white;">
						<span class="glyphicon glyphicon-arrow-right"></span>
					</li>
					<li class="page-scroll ff-word undone-step" style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;color:white;">
					車種資料			
					</li>
					<li class="page-scroll ff-word" style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;color:white;">
						<span class="glyphicon glyphicon-arrow-right"></span>
					</li>
					<li class="page-scroll ff-word undone-step" style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;color:white;">
					完成			
					</li>										
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
				
					<form id="cmxform" class="form-horizontal form-signin col-xs-12 col-sm-12 col-md-12 col-lg-12" role="form" action="${ctx}/updateCars.jsp" method="get" autocomplete="off">													
						<div class="row">
							<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">																		
								<br>
								<br>
								<div class="input-group" style="max-width:500px;">	
									<img class="img-circle img-responsive" src="img/register/logo.png" alt="">
								</div>
								<br>														

																				
												
									<div class="input-group" style="max-width:200px;">
										<label>姓名:</label>	
										<h4>${memberInfo.memberName}</h4>
										<input type="hidden" name="name" class="form-control required" placeholder="輸入您的姓名" value='${memberInfo.memberName}'>																													
										<small><Font color='red' >${ErrorMsgKey.NameEmptyError}</Font></small><br>											
									</div>
																																								

																				

																			
										
									<div class="input-group" style="width:100%;">
										<label>e-mail(帳號):</label>
										<h4>${memberInfo.email}</h4>
										<input type="hidden" name="email" class="form-control email required" placeholder="輸入您的電子郵件" value='${memberInfo.email}'>												
										<small><Font color='red' >${ErrorMsgKey.EmailEmptyError}</Font></small><br>											
									</div>																							
									<c:if test="${!empty FBId}">		
										<input type="hidden" name='password' value='${memberInfo.password}'>
									</c:if>												
										
									<c:if test="${empty FBId}">		
									<div class="input-group"  style="width:100%;">
										<label>密碼:</label>
										<input id="password" type="password" class="form-control" placeholder="輸入您的密碼" name="password" value='${memberInfo.password}'>
									    <small><Font color='red' >${ErrorMsgKey.PasswordEmptyError}</Font></small><br>
									    <label>再次輸入密碼:</label>
										<input type="password" class="form-control" placeholder="再次輸入您的密碼" name="password_again" />												
									</div>												
									<br>												
									</c:if>		
																				
																				
								<div class="input-group"  style="max-width:250px;">
									<label>電話:</label>
									<input name="phone" type="text" class="form-control required" placeholder="輸入您的電話" value='${memberInfo.phone}'>												
								    <small><Font color='red' >${ErrorMsgKey.PhoneEmptyError}</Font></small><br>												
																				
								</div>												
																				
								<br>												
																				
								<div class="input-group" style="max-width:250px;">	
									<label>生日:</label>
									<h4>${memberInfo.birthday}</h4>											
							    	<input type="hidden" id="datepicker" class="form-control required dateISO" name="datepicker" placeholder="輸入您的出生年月日" value='${memberInfo.birthday}'>												
								    <small><Font color='red' >${ErrorMsgKey.BirthdayEmptyError}</Font></small><br>												
								</div>												
																				
																				
																				
								<div class="input-group" style="width:100%;">
									<label>地址:</label>											
								   	<input name="address" type="text" class="form-control required" placeholder="輸入您的地址" value='${memberInfo.address}'>										
								    <small><Font color='red' >${ErrorMsgKey.AddressEmptyError}</Font></small><br>												
								</div>												
																				
								<br>												
								<div class="input-group" style="width:100%;">
									<input type="hidden" name="memberNo" value="${memberInfo.memberNo}">			
									<input type="hidden" name="effectiveDate" value="${memberInfo.effectiveDate}">									
									<input type="hidden" name="action" value="update">												
									<button id="sb" class="btn btn-lg light-orange btn-block" type="submit">下一步</button>												
									<br>
									<br>
									<br>
								</div>
							</div>		
						</div>
					</form>													
					
					
				</div>	
				
				
				<div class="col-sm-1 col-md-2 col-lg-3"></div>
				
			</div>
		</div>
	</section>
	

</body>
</html>