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

<title>觀看愛車</title>

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
        .btn-node-undone{
        	width:80px;
			
			height:80px; 
			
			border-radius:99em;			
         
			border:0px;
            
            background:#999;                     
        } 
        .btn-node-completed{
        	width:80px;
			
			height:80px; 
			
			border-radius:99em;			
         
			border:0px;
            
            background:green;                     
        }        
        .btn-line-undone{
        	width:80px;
			
			height:10px;
			
			border:0px;
			
			background:#999;
        }
        .btn-line-completed{
        	width:80px;
			
			height:10px;
			
			border:0px;
			
			background:green;
        }
       td{ 
        width:80px; 
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
			//結束  
			
			var reservNo=$("#no").text();			
 			var stageTime = 0;
   			$.getJSON('ProgressServlet',{"reservNo":reservNo},function(json){   				   				
   				$.each(json,function(idx,service_step){
   					
   					console.log(service_step);	
   					
   	  	    		var rdts = Date.parse(service_step.reservDateTime);//預約日期毫秒(該方法只到日期，其他的小時、分鐘、毫秒要另做計算，在加回去)
   	  	    		var rdtshr = (new Date(service_step.reservDateTime)).getHours();//預約日期取出小時
   	  	    		var rdtsmin = (new Date(service_step.reservDateTime)).getMinutes();//預約日期取出分鐘
   	  	    		var rdtssec = (new Date(service_step.reservDateTime)).getSeconds();//預約日期取出毫秒
   	  	    		rdts = rdts + (rdtshr*60*60) + (rdtsmin*60) + rdtssec;//預約日期加總換算成毫秒
   	  	    		var rets = Date.parse(service_step.reservEndTime);//結束日期毫秒(該方法只到日期，其他的小時、分鐘、毫秒要另做計算，在加回去)
   	  	    		var retshr = (new Date(service_step.reservEndTime)).getHours();//結束日期取出小時
   	  	    		var retsmin = (new Date(service_step.reservEndTime)).getMinutes();//結束日期取出分鐘
   	  	    		var retssec = (new Date(service_step.reservEndTime)).getSeconds();//結束日期取出毫秒
   	  	    		rets = rets + (retshr*60*60) + (retsmin*60) + retssec;//結束日期加總換算成毫秒
   	  	    		
   	  	    		
   	  	    		
   	  	    		
   	  	    		
   	  	    		
   	  	    		
   	  	    		
   	  	    		var cts = (+new Date());//現在時間(毫秒)
   	  	    		var servTime = service_step.servTime;//該服務的總時間
   					
   					var operatingTime = cts - rdts ;//已經工作多少時間
   					
   					console.log("現在秒數:"+cts);
   					console.log("開始秒數:"+rdts);
   					
   					//每個步驟產生一個節點圓與一個階段線
   					for( i=0 ; i < service_step.servStep.length ; i++ ){
   						stageTime = stageTime + servTime/3*60*1000;//該服務總時間依步驟數平均分配時間並換算成毫秒(除3，代表3步驟)，得到階段時間
   						//已經工作的時間若大於該階段時間，代表完成這個階段，節點圓與階段線就為完成顏色。反之，為未完成顏色
	   					if(operatingTime > stageTime){
	   						
	   						var sec = Math.floor(operatingTime/1000);	   						
	   						var whr = Math.floor(sec/60/60);
	   						var wmin = Math.floor((sec - ( whr*60*60 )) /60);
	   						var wsec = Math.floor(sec - ( whr*60 *60 ) - ( wmin*60 ));
	   						
	   						console.log("已經工作多少時間:"+whr+"小時"+wmin+"分"+wsec+"秒");
	   						console.log("已工作秒數"+Math.floor(operatingTime/1000)+">該階段秒數"+Math.floor(stageTime/1000));
	   							   				
		 					var td1 =  $("<td></td>");
		   		   			var bline = $("<button></button>").addClass("btn-line-completed").attr({"value":stageTime,"disabled":"disabled"});
		   		   			var td2 =  $("<td></td>");
		   		   			var bball =$("<button></button>").addClass("btn-node-completed").attr({"value":stageTime,"disabled":"disabled"}); 
	   			   		   			

	   					}else{
	   						var sec = Math.floor(operatingTime/1000);	   						
	   						var whr = Math.floor(sec/60/60);
	   						var wmin = Math.floor((sec - ( whr*60*60 )) /60);
	   						var wsec = Math.floor(sec - ( whr*60 *60 ) - ( wmin*60 ));
	   						
	   						console.log("已經工作多少時間:"+whr+"小時"+wmin+"分"+wsec+"秒");
	   						console.log("已工作秒數"+Math.floor(operatingTime/1000)+"<該階段秒數"+Math.floor(stageTime/1000));	   						
	   						
	   						
	   						
	   	 					var td1 =  $("<td></td>");
	   	   		   			var bline = $("<button></button>").addClass("btn-line-undone").attr({"value":stageTime,"disabled":"disabled"});
	   	   		   			var td2 =  $("<td></td>");
	   	   		   			var bball =$("<button></button>").addClass("btn-node-undone").attr({"value":stageTime,"disabled":"disabled"}); 
		   			   		 
	   	   		   			
	   	   		   			var countSec = ((Math.floor(stageTime/1000))-(Math.floor(operatingTime/1000)))*1000;//多久毫秒後，刷新進度條
							var cutdTimer = setTimeout("colorUpdate("+stageTime+")",countSec);//自動更新進度條
							console.log("計時器"+Math.floor(countSec/1000)+"秒後啟動");
	   					}
   						var decTd1 =  $("<td>"+service_step.servStep[i].descp+"</td>");
   						var decTd2 =  $("<td></td>");
	   					$("table tr:nth-child(1)").append([decTd1,decTd2]);
   						
   						
	   		   			td1.append(bline); 
	   		   			td2.append(bball); 
	   		   			$("table tr:nth-child(2)").append([td1,td2]);   						
   						
   					}
   		   			//結束
   					
   				   				  					
   				})
   				
   			})			
   			 
   				 	
			
} );
  
  function colorUpdate(stageTime){
// 	  $("button[value="+stageTime+"]").attr("value");
	  $("button[value="+stageTime+"]:eq(0)").removeClass("btn-line-undone");
	  $("button[value="+stageTime+"]:eq(1)").removeClass("btn-node-undone");
	  $("button[value="+stageTime+"]:eq(0)").addClass("btn-line-completed");
	  $("button[value="+stageTime+"]:eq(1)").addClass("btn-node-completed");
  }
  
  
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
						    <li class="divider"></li>
						    <li><a href="#">登出</a></li>
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
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
					

				</div>
				
			</div>
		</div>
	</section>

	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					
					<table>
						<tr>
							<td></td>
							
						</tr>
						<tr>
							<td>
								<button class="btn-node-completed" disabled="disabled"></button>
							</td>  				          
						</tr>				      				      				      
					</table>
						
						
						
											

					

				</div>
				
			</div>
		</div>
		
	</section>
	
	<span hidden="hide" id="no">${param.reservNo}</span>



</body>
</html>