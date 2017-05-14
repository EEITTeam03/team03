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

    //chrome強制記憶密碼，導致input背景顏色被chrome的瀏覽器預設樣式，強制更換成黃色，造成整體版面顏色不和諧，解決步驟如下。
    //1.初始，密碼name設為空，可關閉強制記憶密碼
	$(document).on("focus", "body", function(event){
		$("input[type*='password']").attr({"name":""});
	});     
    //2.表單送出前，把密碼的name設定回來，否則密碼資料不會送到後端
    $("#sb").on("click",function(){
    	$("input[type*='password']").attr({"name":"password"});
    });	       	
 
    
 });


	
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
	    font-size: 16px;

	}
	#cmxform div input{
		border-radius: 50px;
		border-top-right-radius: 50px;
    	border-bottom-right-radius: 50px;
	}

/* 	.light-orange{ */
/* 		color:white; */
/* 	    transition:all 0.2s ease-in-out 0s; */
/* 	    background-color: #e65d4f; */
/* 	    box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05);	     */
/* 	} */

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
.btn-sm{
    padding: 11px 16px;
    border-radius: 5px;
}
.btn-lg{
    font-size: 15px;
}
.button-left > i{
    margin-left: 7px;
}
.button-right > i{
    margin-right: 7px;
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
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div>
	
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				
					<form id="cmxform" class="form-signin" role="form" action="MemberNext" method="post" autocomplete="off">													
																		
						<br>												
						<c:if test="${!empty FBName}">												
							<input type="hidden" name="name" value='${FBName}'>											
						</c:if>
																		
						<c:if test="${empty FBName}">												
							<div class="input-group">	
								<input type="text" name="name" class="form-control required" placeholder="輸入您的姓名" value='${param.name}'>																													
								<small><Font color='red' >${ErrorMsgKey.NameEmptyError}</Font></small><br>											
							</div>
							<br>																												
						</c:if>
																		
						<c:if test="${!empty FBAccount}">												
						  	<input type="hidden" name="email" value='${FBAccount}'>											
						</c:if>	
																	
						<c:if test="${empty FBAccount}">												
							<div class="input-group">
								<input type="text" name="email" class="form-control email required" placeholder="輸入您的電子郵件" value='${param.email}'>												
								<small><Font color='red' >${ErrorMsgKey.EmailEmptyError}</Font></small><br>											
							</div>												
							<br>												
						</c:if>												
																		
						<c:if test="${!empty FBId}">												
						  	<input type="hidden" name="password" value='${FBId}'>											
						</c:if>
																		
						<c:if test="${empty FBId}">												
							<div class="input-group">
								<input type="password" class="form-control required" placeholder="輸入您的密碼" value='${param.password}'>
							    <small><Font color='red' >${ErrorMsgKey.PasswordEmptyError}</Font></small><br>												
							</div>												
							<br>												
						</c:if>												
																		
																		
						<div class="input-group">
																			
							<input name="phone" type="text" class="form-control required" placeholder="輸入您的電話" value='${param.phone}'>												
						    <small><Font color='red' >${ErrorMsgKey.PhoneEmptyError}</Font></small><br>												
																		
						</div>												
																		
						<br>												
																		
						<div class="input-group">												
					    	<input id="datepicker" class="form-control required dateISO" name="datepicker" placeholder="輸入您的出生年月日" value='${param.birthday}'>												
						    <small><Font color='red' >${ErrorMsgKey.BirthdayEmptyError}</Font></small><br>												
						</div>												
																		
						<br>												
																		
						<div class="input-group">												
						   	<input name="address" type="text" class="form-control required" placeholder="輸入您的地址" value='${param.address}'>										
						    <small><Font color='red' >${ErrorMsgKey.AddressEmptyError}</Font></small><br>												
						</div>												
																		
						<br>												
						<div class="input-group">												
							<input type="hidden" name="action" value="insert">												
							<button id="sb" class="btn btn-lg light-orange btn-block" type="submit">下一步</button>												
						</div>
<!-- 						<button id="test" type="button">test</button>												 -->
					</form>													
					
					
				</div>	
				
				
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div>
				
			</div>
		</div>
	</section>
	

</body>
</html>