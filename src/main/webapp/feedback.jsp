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

<title>意見回饋</title>
<link rel="stylesheet" href="styles/Lab3.css">
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

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>


	<style type="text/css">	
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
             
	</style>



  <script>
  
  
  $( function() {
	  var txtarea = $('textarea[name*="comment"]');
	  count = false; //用來固定點擊後星星的顏色
	  goal = 0;
	  
	  $("#dialog_div").dialog({ 
	        autoOpen: false, 
	        show: "blind", 
	        hide: "explode",
	        width: 500,
	        buttons: { 
	            "Ok": function() { 
	            	//把意見送進DB
	            	$.ajax({
	            		type:'POST',
	            		url:'AddOpinions',
	            		dataType:'text',
	            		data : {
							'opinions' : txtarea.val(),
							'goal':goal
						},
	            		success : function(data) {
	            			alert("success");
					},
					error : function(data) {
						alert("error");
					}
	            	})
	            	$(this).dialog("close");
	            }, 
	            "Cancel": function() { 
	            	$(this).dialog("close"); 
	            }
	        }
	    });
	  	//宣告textarea元素
	    
	  
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
			var logIn = $("#nav-log-in").attr("class");
			var regst = $("#nav-register").attr("class");
			var numln = null;
			var numrn = null;
			var numlm = null;
			var numrm =	null;

//			console.log(logIn);
//			console.log(regst);				
			
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
			
		/*-------------夜空中最亮的星------------------*/
		 
		var imgs = document.querySelectorAll("img.s");
        var imgslen = imgs.length;
        //document.getElementById("idstar").onmouseover = mouseOver;
        //document.getElementById("idstar").onmouseout = mouseOut;
        for(var i =0;i<imgslen;i++)
        {
            imgs[i].onmouseover = function (){ mouseOver(this.id); };
            imgs[i].onmouseout = function (){ mouseOut(this.id); };
            imgs[i].onclick = function () { mouseClick(this.id); };
        }
    	 
    	
    	//滑鼠在星星上
        function mouseOver(imgid) {
            var len = imgid.length;
            var lastchar = imgid.charAt(len - 1); //id名稱的最後一個字元,得知第幾個星,再轉成整數
            var lastnum = parseInt(lastchar);
//             document.getElementById("div1").innerHTML = lastnum + "星級"; 

	switch (lastnum) {
		case 1:
			document.getElementById("div1").innerHTML = "差"; 
			break;
		case 2:
			document.getElementById("div1").innerHTML = "尚可"; 
			break;
		case 3:
			document.getElementById("div1").innerHTML = "好"; 
			break;
		case 4:
			document.getElementById("div1").innerHTML = "很好"; 
			break;
		default:
			document.getElementById("div1").innerHTML = "極佳"; 
		}
		if (count == false) {
			for (var i = lastnum; i > 0; i--)
				document.getElementById("id" + imgid.substring(2, 6) + i).className = "n";
			//count = true;
		}
		if (count == true) {
			for (var i = lastnum; i > 0; i--)
				document.getElementById("id" + imgid.substring(2, 6) + i).className = "n";
			//count = true;
			if (lastnum < goal)
				for (var i = goal; i > lastnum; i--)
					document.getElementById("id" + imgid.substring(2, 6) + i).className = "s";
		}
	}

	//滑鼠移開星星
	function mouseOut(imgid) {

		var len = imgid.length;
		var lastchar = imgid.charAt(len - 1);//id名稱的最後一個字元,得知第幾個星,再轉成整數
		var lastnum = parseInt(lastchar);
		if (count == false) {
			for (var i = lastnum; i > 0; i--) {
				document.getElementById("id" + imgid.substring(2, 6) + i).className = "s";
			}
		}
		if (count == true) {
			for (var i = goal; i > 0; i--)
				document.getElementById("id" + imgid.substring(2, 6) + i).className = "n";
			if (lastnum > goal) {
				for (var i = lastnum; i > goal; i--)
					document.getElementById("id" + imgid.substring(2, 6) + i).className = "s";
			}
			//count = true;
		}
		if (goal == 0)
			document.getElementById("div1").innerHTML = "請評分";
		else{
			switch (goal) {
			case 1:
				document.getElementById("div1").innerHTML = "差"; 
				break;
			case 2:
				document.getElementById("div1").innerHTML = "尚可"; 
				break;
			case 3:
				document.getElementById("div1").innerHTML = "好"; 
				break;
			case 4:
				document.getElementById("div1").innerHTML = "很好"; 
				break;
			default:
				document.getElementById("div1").innerHTML = "極佳"; 
			}
		}
	}

	function mouseClick(imgid) {
		var len = imgid.length;
		var lastchar = imgid.charAt(len - 1);
		var lastnum = parseInt(lastchar);
		if (count == false) {
			goal = lastnum;
			count = true;
		}
		if (count == true) {
			//document.getElementById("div1").innerHTML = "打分數中...";
			goal = lastnum;
		}
		
		$("#dialog_div").dialog("open");
	}
			
} );
  
  </script>

<style>
	
	
	
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
						    <li><a href="orderStatus.jsp">訂單狀態</a></li>
						    <li><a href="#">修改資料</a></li>
						    <li>意見回饋</li>
						    <li class="divider"></li>
						    <li><a href="LogOut">登出</a></li>
						</ul>				              
	 				</li>
				</c:if>                    
                    										
				</ul>
			</div>
	
		</div>
		
<!-- 		<button type="button" onclick="colorUpdate(12600000)">14444</button> -->
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
				<div id="div2" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div style="text-align: center;margin:auto;"><h2>告訴我們您的想法</h2></div>
				
					<div id="star">
						<img id="idstar1" class="s" src="img/star.png" width="40" />
						<img id="idstar2" class="s" src="img/star.png" width="40" />
						<img id="idstar3" class="s" src="img/star.png" width="40" />
						<img id="idstar4" class="s" src="img/star.png" width="40" />
						<img id="idstar5" class="s" src="img/star.png" width="40" />
					</div>
					<div id="div1">請評分</div>
					<br>
					<div id="dialog_div" title="Your opinions">
  						<textarea rows="10" cols="48" placeholder="告訴我們你對水膜汽車美容的想法，最多輸入200字" name="comment" style="resize:none"></textarea>
					</div>
					<br>
					<br>
					<br>
					<div style="text-align: center;margin:auto;"><input type="button" value="回首頁" onclick="location.href='index.jsp'" class="btn btn-lg btn-info">
					</div>
				</div>
				
			</div>
		</div>
	</section>

	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					
					<table>
					
				      				      				      
					</table>
						
						
						
											
					

				</div>
				
			</div>
		</div>
		
	</section>	

</body>
</html>