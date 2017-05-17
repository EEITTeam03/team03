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
	.input-group .btn:hover, .btn:focus{
	    outline: none;
	    color:#fff;
	}
	.input-group .btn{
	    text-transform: capitalize;
	    color:#fff;
	    padding: 14px 20px;
	    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	.input-group .btn[class*='seldiv']{
	    text-transform: capitalize;
	    color:#bcbcbc;
	    padding: 14px 20px;
	    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	.input-group .btn[class*='seldiv']:hover{
		background: #f9df85;
		color:white;
	}			
	.input-group .btn-lg{
	    font-size: 20px;
	} 	
	.input-group .blue,.light-brown,.light-green,.light-orange{
	    background: #0088cc;
	    box-shadow:0 4px 0 #006394;
	    transition:all 0.1s ease-in-out 0s;
	    position: relative;
	    top:0;
	}
	.input-group .light-brown{
	    background: #cec2ab;
	    box-shadow: 0 4px 0 #b9a888;
	}
	.input-group .light-green{
	    background: #75d69c;
	    box-shadow:0 4px 0 #4ac97d;
	    border-radius: 25px;
	}
	.input-group .light-orange{
	    background: #fed136;
	    box-shadow:0 4px 0 rgb(228, 183, 54);
	} 
	
	.input-group .blue:hover,.light-brown:hover,.light-green:hover,.light-orange:hover{
	    top:2px;
	    box-shadow:0 2px 0 #006394;
	}
	.input-group .light-brown:hover{
	    box-shadow: 0 2px 0 #b9a888;
	}
	.input-group .light-green:hover{
	    box-shadow:0 2px 0 #4ac97d;
	}
	.input-group .light-orange:hover{
	    box-shadow: 0 2px 0 #fed136;
	}	

	.input-group input:-webkit-autofill {
	  -webkit-box-shadow:0 0 0 50px white inset; /* Change the color to your own background color */
	  -webkit-text-fill-color: #333;
	}
	
	.input-group input:-webkit-autofill:focus {
	  -webkit-box-shadow:0 0 0 50px white inset;
	  -webkit-text-fill-color: #333;
	}		
		
					
	.dropdown:hover .dropdown-menu {		
		display: block;
	}
	#liesel{
		width:75%;
		display:inline;
	}			
	#liesel span:nth-child(1){
		margin-left:5%;
		margin-right:5%;		
	}
	#liesel span:nth-child(2){
		margin-left:5%;
		margin-right:5%;			
	}
	#liesel span:nth-child(3){
		margin-left:5%;
		margin-right:5%;		
	}
	#continue{
		display:none;
		-moz-box-shadow:inset 0px 1px 0px 0px #fff6af;
		-webkit-box-shadow:inset 0px 1px 0px 0px #fff6af;
		box-shadow:inset 0px 1px 0px 0px #fff6af;
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffec64), color-stop(1, #ffab23));
		background:-moz-linear-gradient(top, #ffec64 5%, #ffab23 100%);
		background:-webkit-linear-gradient(top, #ffec64 5%, #ffab23 100%);
		background:-o-linear-gradient(top, #ffec64 5%, #ffab23 100%);
		background:-ms-linear-gradient(top, #ffec64 5%, #ffab23 100%);
		background:linear-gradient(to bottom, #ffec64 5%, #ffab23 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffec64', endColorstr='#ffab23',GradientType=0);
		background-color:#ffec64;
		-moz-border-radius:30px;
		-webkit-border-radius:30px;
		border-radius:30px;
		border:1px solid #ffaa22;
		display:inline-block;
		cursor:pointer;
		color:white;
		font-family:Arial;
		font-size:20px;
		font-weight:bold;
		padding:10px;
		text-decoration:none;
		text-shadow:0px 1px 0px #ffee66;
		margin:10px;		
	}
	#continue:hover{
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffab23), color-stop(1, #ffec64));
		background:-moz-linear-gradient(top, #ffab23 5%, #ffec64 100%);
		background:-webkit-linear-gradient(top, #ffab23 5%, #ffec64 100%);
		background:-o-linear-gradient(top, #ffab23 5%, #ffec64 100%);
		background:-ms-linear-gradient(top, #ffab23 5%, #ffec64 100%);
		background:linear-gradient(to bottom, #ffab23 5%, #ffec64 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffab23', endColorstr='#ffec64',GradientType=0);
		background-color:#ffab23;
	}
	#continue:active {
		position:relative;
		top:1px;
	}	
	
	#continue span{
		font-size:40px;
		width:40px;
		height:40px;
	}						
	.seldiv{
		display:none;
		background:rgba(255, 248, 223, 0.91);
		margin-top:10px;
		font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		width:75%;
		height:60px;
		box-shadow:0 3px 20px rgba(246, 255, 251, 0.59);
		border-radius:6px;
		border:0px;
	}
	i{
		margin-right:20%;	
	}
	h1{
		font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;	
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
 			
		$("#liesel").click(function(){
			
			//下拉DIV開關
			$(".seldiv").slideToggle("slow");
			//結束
					
			//按鈕箭頭符號改變
			var mark = $("#liesel span:last-child").attr("class");
			if( mark == "glyphicon glyphicon-chevron-down" ){
				$("#liesel span:last-child").removeClass("glyphicon glyphicon-chevron-down");
				$("#liesel span:last-child").addClass("glyphicon glyphicon-chevron-up");
			}else{
				$("#liesel span:last-child").removeClass("glyphicon glyphicon-chevron-up");
				$("#liesel span:last-child").addClass("glyphicon glyphicon-chevron-down");				
			}
			//結束
			
		});
 			
 			
		//讀取會員的車種資料
  		var no=$("#no").text();
		$.getJSON("GetCars",{"no":no},function(json){
			$.each(json,function(idx,GetCars){
				var bt = $("<button></button>").addClass("btn seldiv").attr({"type":"button"});
				var i = $("<i></i>").addClass("fa fa-car fa-2x");
				var sp = $("<span></span>").text(GetCars.license);
			
				bt.append([i,sp]);
				$("#continue").after(bt);
				
//  				console.log(json);				
			});				
		}); 			
		//結束   		
 		
		$(document).on('click', '.seldiv', function(event){
			
			$("#liesel span:first-child").text($(this).text());
			
			//下拉DIV開關
			$(".seldiv").slideToggle("slow");
			//結束

			//下一步按扭打開			
			$("#continue").slideDown();
			//結束			
			
			//按鈕箭頭符號改變
			var mark = $("#liesel span:last-child").attr("class");
			if( mark == "glyphicon glyphicon-chevron-down" ){
				$("#liesel span:last-child").removeClass("glyphicon glyphicon-chevron-down");
				$("#liesel span:last-child").addClass("glyphicon glyphicon-chevron-up");
			}else{
				$("#liesel span:last-child").removeClass("glyphicon glyphicon-chevron-up");
				$("#liesel span:last-child").addClass("glyphicon glyphicon-chevron-down");				
			}
			//結束			
		}); 
		
		//點擊後換下一頁
	    $("#continue").on('click', function(event){
			//第二頁打開
			$(".page2").slideToggle("slow");
			//第一頁關閉
			$(".page1").slideToggle("slow");			
			//結束					     	
	    });  		
// 		//離開下一步按紐時觸發事件，改變樣式
// 	    $("#continue").on('mouseleave', function(event){
// 	        $(this).css("background","rgba(247, 57, 125, 0.51)");
// 	     	$("#continue span").css("color","white");
// 	    });		
				
   		
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
			<a class="navbar-brand page-scroll" href="index.jsp">Car
				Detailing</a>
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
                        <a class="page-scroll ff-word" href="#services">各類服務</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="#portfolio">美容項目</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="#about">關於我們</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="#team">團隊成員</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="#contact">聯絡我們</a>
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
						    <li>訂單狀態</li>
						    <li><a href="#">修改資料</a></li>
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

	<section id="services" class="page1">
		<div class="container">
			<div class="row">
				<div class="col-xs-1 col-sm-2 col-md-3 col-lg-3 ">
	
				</div>
				<div class="col-xs-10 col-sm-8 col-md-6 col-lg-6 " >
					<br>
					<br>
					<h1>第一步：選擇您的汽車</h1>	
					<br>
					
					<div class="input-group" style="width:100%; ">
																	
						<button id="liesel" class="btn btn-lg light-orange btn-block" type="button">
							<span>車牌號碼</span><span>│</span><span class="glyphicon glyphicon-chevron-down"></span>
						</button>
						<button id="continue" class="btn btn-lg" type="button" style="display:none;">
							<span class="glyphicon glyphicon-circle-arrow-right"></span>
						</button>
																					
					</div>
											
				</div>
				
				<div class="col-xs-1 col-sm-2 col-md-3 col-lg-3 ">

				</div>							
			</div>
		</div>
	</section>
	
	<section id="services" class="page2" style="display:none;">
		<div class="container">
			<div class="row">
				<div class="col-xs-1 col-sm-2 col-md-3 col-lg-3 ">
	
				</div>
				<div class="col-xs-10 col-sm-8 col-md-6 col-lg-6 " >
					<br>
					<br>
					<h1>第二步：選擇ef您的美容00服務</h1>	
					<br>																
				</div>
				
				<div class="col-xs-1 col-sm-2 col-md-3 col-lg-3 ">

				</div>							
			</div>
			
			<div class="row">
				<div class="col-xs-1 col-sm-2 col-md-1">
	
				</div>
				<div class="col-xs-10 col-sm-8 col-md-10 col-lg-12" >
																
				</div>
				
				<div class="col-xs-1 col-sm-2 col-md-1">

				</div>							
			</div>			
		</div>
	</section>	
	
	
	<span id="no" hidden="hide">${memberInfo.memberNo}</span>
		
		<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>


</body>
</html>