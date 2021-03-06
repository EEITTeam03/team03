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

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/blockUI/jquery.blockUI.js"></script>



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
        .div-node-undone{
        	width:40px;
			
			height:40px; 
			
			border-radius:99em;			
         
			border:0px;
            
            background:#999;                                        
        } 
        .div-node-completed{
        	width:40px;
			
			height:40px; 
			
			border-radius:99em;			
         
			border-width: 3px;
			
			border-color: #ed687c;
            
            background: #fff;			         
            
			color: #ed687c;
                         
            border-style: solid;  
            
            text-align: center;         
        }        
        .div-line-undone{
        	width:150px;
			
			height:10px;
			
			border:0px;
			
			background:#999;
			
			box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05);
        }
        .div-line-completed{
        	width:150px;
			
			height:10px;
			
			border:0px;
			
			background:#ed687c;
			
			box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05);
        }
		table tr:nth-child(1){ 
			width:40px;
			font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
			font-size:22px; 
      	}
		table tr:nth-child(2){ 
			width:40px;
			font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
			font-size:22px; 
      	}
		table tr:nth-child(3){ 
			width:40px;
			font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
			font-size:20px; 
			text-align: left;
      	}       	        	  
		.fnt-select{
	      	-webkit-user-select: none;
	      	color:transparent;
      	}
      
		.fnt-d{
			 color:#a52929;
			 text-shadow: 0 1px 0 #ffffff,
			 0 2px 0 #c9c9c9,
			 0 3px 0 #bbb,
			 0 4px 0 #b9b9b9,
			 0 5px 0 #aaa,
			 0 6px 1px rgba(0,0,0,.1),
			 0 0 5px rgba(0,0,0,.1),
			 0 1px 3px rgba(0,0,0,.3),
			 0 3px 5px rgba(0,0,0,.2),
			 0 5px 10px rgba(0,0,0,.25),
			 0 10px 10px rgba(0,0,0,.2),
			 0 20px 20px rgba(0,0,0,.15);
		}
		
		.fnt-t{
			 color:black;
			 text-shadow: 0 1px 0 #ffffff,
			 0 2px 0 #c9c9c9,
			 0 3px 0 #bbb,
			 0 4px 0 #b9b9b9,
			 0 5px 0 #aaa,
			 0 6px 1px rgba(0,0,0,.1),
			 0 0 5px rgba(0,0,0,.1),
			 0 1px 3px rgba(0,0,0,.3),
			 0 3px 5px rgba(0,0,0,.2),
			 0 5px 10px rgba(0,0,0,.25),
			 0 10px 10px rgba(0,0,0,.2),
			 0 20px 20px rgba(0,0,0,.15);
		}		      
		.glyphicon glyphicon-ok{
			color: #ed687c;
		}
		img{
			box-shadow:0 4px 10px 4px rgba(19, 35, 47, 0.3);
		}
     
	</style>



  <script>
  function loadingBlock(){
	 	 $.blockUI({ 
				message: $('div.blockUI'),
	 		 //overlayCSS: { backgroundColor: '#808080' },
	 		 css: { 
	 			 border: 'none',
	 			 //backgroundColor:'#f7f7f7',
	              left: ($(window).width() - 228) /2 + 'px', 
					'-webkit-border-radius': '10px', 
	             '-moz-border-radius': '10px', 
	             padding: '25px',
	              opacity: 0.8,
	               width: '228px',
	               height: '228px'
	          },
	 		 fadeIn: 0, 
	          onBlock: function() { 
	              //alert('Page is now blocked'); 
	          } 
	      }); 
	 }
	 function loadingUnblock(){
	 	$.unblockUI();
	 	//alert("close block");
	 }
  
  $( function() {
	  	loadingBlock();
		
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
   					
	   				//開始時間文字單獨設定	   				
	   				var gotimehr = new Date(rdts).getHours();
	   				var gotimemin = new Date(rdts).getMinutes();
	   				if(gotimemin<10){
	   					$("table tr:nth-child(3) td:first-child").text(gotimehr+":"+"0"+gotimemin).addClass("fnt-t").attr({"colspan":"2"});
	   				}else{
	   					$("table tr:nth-child(3) td:first-child").text(gotimehr+":"+gotimemin).addClass("fnt-t").attr({"colspan":"2"});
	   				}
	   				//結束
   					
   					
   					
   					//每個步驟產生一個節點圓與一個階段線
   					for( i=0 ; i < service_step.servStep.length ; i++ ){
   						
   						stageTime = stageTime + servTime/3*60*1000;//該服務總時間依步驟數平均分配時間並換算成毫秒(除3，代表3步驟)，得到階段時間
   						
   						//已經工作的時間若大於該階段時間，代表完成這個階段，節點圓與階段線就為完成顏色。反之，為未完成顏色
	   					if(operatingTime > stageTime){
	   						
	   						//已工作時間換算
	   						var sec1 = Math.floor(operatingTime/1000);	   						
	   						var whr = Math.floor(sec1/60/60);
	   						var wmin = Math.floor((sec1 - ( whr*60*60 )) /60);
	   						var wsec = Math.floor(sec1 - ( whr*60 *60 ) - ( wmin*60 ));
	   						
	   						console.log("已經工作多少時間:"+whr+"小時"+wmin+"分"+wsec+"秒");
	   						console.log("已工作秒數"+Math.floor(operatingTime/1000)+">該階段秒數"+Math.floor(stageTime/1000));
	  						//結束
	  						
	   						
	   						
		 					var td1 =  $("<td></td>");
		   		   			var dline = $("<div>"+stageTime+"</div>").addClass("div-line-completed fnt-select");
		   		   			var td2 =  $("<td></td>");
		   		   			var dball =$("<div>"+stageTime+"</div>").addClass("div-node-completed fnt-select"); 
		   		   			var ballsp = $("<span style='color:#ed687c'></span>").addClass("glyphicon glyphicon-ok");   		   			

	   					}else{
	   						//已工作時間換算
	   						var sec = Math.floor(operatingTime/1000);	   						
	   						var whr = Math.floor(sec/60/60);
	   						var wmin = Math.floor((sec - ( whr*60*60 )) /60);
	   						var wsec = Math.floor(sec - ( whr*60 *60 ) - ( wmin*60 ));
	   						
	   						console.log("已經工作多少時間:"+whr+"小時"+wmin+"分"+wsec+"秒");
	   						console.log("已工作秒數"+Math.floor(operatingTime/1000)+"<該階段秒數"+Math.floor(stageTime/1000));	   						
	   						//結束
   						
		 					var td1 =  $("<td></td>");
		   		   			var dline = $("<div>"+stageTime+"</div>").addClass("div-line-undone fnt-select");
		   		   			var td2 =  $("<td></td>");
		   		   			var dball =$("<div>"+stageTime+"</div>").addClass("div-node-undone fnt-select"); 		   		   			
		   		   			var ballsp = $("<span style='color:#ed687c'></span>");
		   		   			
		   		   			//產生計時器，讓每個未完成的階段，透過計時器去自動更新
	   	   		   			var countSec = ((Math.floor(stageTime/1000))-(Math.floor(operatingTime/1000)))*1000;//多久毫秒後，刷新進度條
							var cutdTimer = setTimeout("colorUpdate()",countSec);//N秒後，自動更新進度條
							console.log("計時器"+Math.floor(countSec/1000)+"秒後啟動");
							//結束
	   					}
   						//階段文字描述
   						var decTd1 =  $("<td>"+service_step.servStep[i].descp+"</td>").addClass("fnt-d");
   						var decTd2 =  $("<td></td>");
	   					$("table tr:nth-child(1)").append([decTd1,decTd2]);
	   					//結束	   					
	   					
	   					//階段時間文字設定	   				
		   				var stagetimehr = new Date(rdts+stageTime).getHours();
		   				var stagetimemin = new Date(rdts+stageTime).getMinutes();

		   				
   						var timeTd =  $("<td></td>").addClass("fnt-t").attr({"colspan":"2"});;
   						
		   				if(stagetimemin<10){
		   					timeTd.text(stagetimehr+":"+"0"+stagetimemin);		   					
		   				}else{
		   					timeTd.text(stagetimehr+":"+stagetimemin);		   					
		   				}
		   					   					
	   					$("table tr:nth-child(3)").append([timeTd]);	   					
	   					//結束	
	   					
	   					dball.prepend(ballsp);
	   		   			td1.append(dline); 
	   		   			td2.append(dball); 
	   		   			$("table tr:nth-child(2)").append([td1,td2]); 
	   		   			
// 	   		   			console.log($("table span[class!='glyphicon glyphicon-ok']"));//測試
   					}
   		   			//結束
   		   			
   					
   				   				  					
   				})
   				loadingUnblock();
   			})			
   			
				 	
} );
  
	function colorUpdate(){			
		$("div[class*='div-line-undone']:first").addClass("div-line-completed").removeClass("div-line-undone");
		$("div[class*='div-node-undone']:first").addClass("div-node-completed").removeClass("div-node-undone");
		$("table span[class!='glyphicon glyphicon-ok']:first").addClass("glyphicon glyphicon-ok");
  }
  
//   console.log($("div[class*='div-line-undone']").attr("class"));
//   console.log($("div").attr("class"));
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
				<a class="navbar-brand page-scroll" href="index.jsp">Wash Me</a>
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
                        <a class="page-scroll ff-word" href="${ctx}/#services">各類服務</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#portfolio">美容項目</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#about">關於我們</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#team">團隊成員</a>
                    </li>
                    <li>
                        <a class="page-scroll ff-word" href="${ctx}/#contact">聯絡我們</a>
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
						    <li><a href="member_update.jsp">修改資料</a></li>
						    <li><a href="feedback.jsp">意見回饋</a></li>
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
<!-- 	<section id="services"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"> -->
		
<!-- 				</div> -->
				
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->

	<section id="services">
		<div class="container">
			<div class="row">
				<div class="blockUI" style="display: none">
						<img src="${ctx}/img/loading/reservlist_loading.gif" width="170px" height="170px" style="box-shadow:none"/>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div style="width:100%;height:651px;">
						<img style="-webkit-user-select: none;" src="${ctx}/VideoServlet" width="100%" height="100%">
					</div>
					<div class="table-responsive">
						<table>
							<tr>
								<td></td>
								
							</tr>
							<tr>
								<td>
									<div class="div-node-completed">
										GO
									</div>
								</td>  				          
							</tr>
							<tr>
								<td></td>
								
							</tr>										      				      				      
						</table>
					</div>

				</div>
				
			</div>
		</div>
		
	</section>
	
	<span hidden="hide" id="no">${param.reservNo}</span>
	


</body>
</html>