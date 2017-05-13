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

<title>註冊會員</title>

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

  <script>
  $( function() {
	  
    $( "#datepicker" ).datepicker({
      	changeMonth: true,
      	changeYear: true,
      	dateFormat: 'yy-mm-dd',
    	yearRange: '-90:+0'
    });
    
    $("#cmxform").validate();
    
    
    //chrome瀏覽器的 User agent stylesheet，設定當input自動載入記憶的文字時，backgound的顏色會改變，導致整體版面顏色不協調
    //為解決該問題，嘗試了1.關閉元素的記憶功能(元素加上該屬性autocomplete)。2.強制更改User agent stylesheet的設定顏色。兩者都都無效
    //3.替input增加一個陰影顏色(-webkit-box-shadow)，來掩蓋過原本的顏色(原本顏色依然存在)。有效，但無法使用透明色
    //4.input的name屬性刪除，則關閉元素的記憶功能，但會導致輸入值送出去後端時，無KEY值可以抓，因此新增一個隱藏input來把值送去後端 
    //使用方法4，執行資料送出行為前，把使用者輸入的資料，轉移到隱藏要輸出的input元素
    $("form button").on('click', function(event){
    	//以下用HTML DOM方式來實作
    	
    	//使用創建屬性節點方式    	
    	//轉移name
    	var userInputName = document.getElementById("name").getAttribute("value");//找到ID為Name的元素，並讀出value值
    	var nameValue = document.createAttribute("value");//創建一個屬性節點，屬性為value
    	nameValue.nodeValue = userInputName;//設定該屬性節點的值
    	var userOutputName = document.getElementsByName("name");//找到name為name的元素
    	userOutputName.setAttribute(nameValue);//給予設定好的屬性節點
    	
    	//使用直接設定屬性值的方式
    	//轉移email
    	var userInputEmail = document.getElementById("email").getAttribute("value");//找到ID為email的元素，並讀出value值
    	var userOutputEmail = document.getElementsByName("email");//找到name為email的元素
    	userOutputEmail.setAttribute("value",userInputEmail);//設定該元素的value屬性值
    	
    	//轉移password
    	var userInputPassword = document.getElementById("password").getAttribute("value");//找到ID為password的元素，並讀出value值
    	var userOutputPassword = document.getElementsByName("password");//找到name為password的元素
    	userOutputPassword.setAttribute("value",userInputPassword);//設定該元素的value屬性值    	
    	
    	//轉移phone
    	var userInputPhone = document.getElementById("phone").getAttribute("value");//找到ID為phone的元素，並讀出value值
    	var userOutputPhone = document.getElementsByName("phone");//找到name為phone的元素
    	userOutputPhone.setAttribute("value",userInputPhone);//設定該元素的value屬性值        	

    	//轉移address
    	var userInputAddress = document.getElementById("address").getAttribute("value");//找到ID為address元素，並讀出value值
    	var userOutputAddress = document.getElementsByName("address");//找到name為address的元素
    	userOutputAddress.setAttribute("value",userInputAddress);//設定該元素的value屬性值        	
    	       	
    	
	});
	
  } );   
  </script>


<style>
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
	.input-group{
		width:300px;	
	}
	
	
	.form-control{
	    padding-top: 15px;
	    background: rgba(0, 0, 0, 0.5);	    
	    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
	    border: none;
	    color: white;
	    padding: 10px 15px;
	    border-radius: 50px;
	    font-size: 16px;
	}
/* 	input:-webkit-autofill { */
/* /* 	  -webkit-box-shadow:0 0 0 50px black inset; */ */
/* 	  -webkit-box-shadow:0 0 0 50px rgba(0,0,0,0.75) inset; */
/* 	  -webkit-text-fill-color: red; */
/* 	  font-color:red; */
/* 	} */
	
/* 	input:-webkit-autofill:focus { */
/* /* 	  -webkit-box-shadow:0 0 0 50px black inset; */ */
/* 	  -webkit-box-shadow:0 0 0 50px rgba(0,0,0,0.75) inset; */
/* 	  -webkit-text-fill-color: red; */
/* 	  font-color:red; */
/* 	} */

input:focus {
    background-position: 0 0;
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
				<a class="navbar-brand page-scroll" href="index.jsp">Car
					Detailing</a>
			</div>
	
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll ff-word btn btn-primary btn-xs"
						style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px"
						href="#"> 基本資料
					</a></li>
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
				<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2"></div>
	
				<div class="col-xs-10 col-sm-8 col-md-8 col-lg-8">
				
					<form id="cmxform" class="form-signin" role="form" action="MemberNext" method="post" autocomplete="off">													
																		
						<br>												
						<c:if test="${!empty FBName}">												
							<input id="name" type="hidden" name="name" value='${FBName}'>											
						</c:if>
																		
						<c:if test="${empty FBName}">												
							<div class="input-group">	
								<input id="name" type="text" class="form-control required" placeholder="輸入您的姓名" value='${param.name}'>																													
							  	<input type="hidden" name="name">											
								<small><Font color='red' >${ErrorMsgKey.NameEmptyError}</Font></small><br>											
							</div>
							<br>																												
						</c:if>
																		
						<c:if test="${!empty FBAccount}">												
						  	<input id="email" type="hidden" name="email" value='${FBAccount}'>											
						</c:if>	
																	
						<c:if test="${empty FBAccount}">												
							<div class="input-group">
								<input id="email" type="text" class="form-control required email" placeholder="輸入您的電子郵件" value='${param.email}'>												
							  	<input type="hidden" name="email">				
								<small><Font color='red' >${ErrorMsgKey.EmailEmptyError}</Font></small><br>											
							</div>												
							<br>												
						</c:if>												
																		
						<c:if test="${!empty FBId}">												
						  	<input id="password" type="hidden" name="password" value='${FBId}'>											
						</c:if>
																		
						<c:if test="${empty FBId}">												
							<div class="input-group">
								<input id="password" type="password" class="form-control required" placeholder="輸入您的密碼" value='${param.password}'>	
							    <input type="hidden" name="password">												
							    <small><Font color='red' >${ErrorMsgKey.PasswordEmptyError}</Font></small><br>												
							</div>												
							<br>												
						</c:if>												
																		
																		
						<div class="input-group">												
						   											
							<input id="phone" type="text" class="form-control required" placeholder="輸入您的電話" value='${param.phone}'>												
						    <input type="hidden" name="phone">												
						    <small><Font color='red' >${ErrorMsgKey.PhoneEmptyError}</Font></small><br>												
																		
						</div>												
																		
						<br>												
																		
						<div class="input-group">												
					    	<input id="datepicker" class="form-control required dateISO" name="datepicker" placeholder="輸入您的出生年月日" value='${param.birthday}'>												
						    <small><Font color='red' >${ErrorMsgKey.BirthdayEmptyError}</Font></small><br>												
						</div>												
																		
						<br>												
																		
						<div class="input-group">												
						   	<input id="address" type="text" class="form-control required" placeholder="輸入您的地址" value='${param.address}'>										
						    <input type="hidden" name="address">												
						    <small><Font color='red' >${ErrorMsgKey.AddressEmptyError}</Font></small><br>												
						</div>												
																		
						<br>												
																		
						<input type="hidden" name="action" value="insert">												
						<button class="btn btn-lg btn-info btn-block" type="submit" style="background-color:#FFB6C1;border-color:#FFB6C1;color:white;" >下一步</button>												
						
															
																		
					</form>													
					
					
				</div>	
				
				
				<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2"></div>
				
			</div>
		</div>
	</section>
	

</body>
</html>