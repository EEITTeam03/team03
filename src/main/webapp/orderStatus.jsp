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
		/* 調整滑入table資料時，所顯示的顏色 */
		.table-hover tbody tr:hover td {
		    background-color: rgba(245,152,157,.25);
		}				
		/* Table Head */
		table thead th {
			background-color: #9E0039;
			color: #fff;
			border-bottom-width: 0;
			background-image: linear-gradient(to bottom, rgba(0,0,0,0) 0%, rgba(0,0,0,.25) 100%);
		}
		
		/* Column Style */
		table td {
			color: #000;
		}
		/* Heading and Column Style */
		table tr, table th {
			border-width: 0px;
			text-align: center;
			vertical-align:middle;			
		}
		
		/* Padding and font style */
		table td, table th {
			font-size: 15px;
			font-family: Noto Sans TC;
			font-weight: bold;			
		}		
		
		tbody tr:nth-child(2n-1) { 
 			background: #fff; 
 		} 
		table tr:nth-child(2n) {
			background: #eee;
		}
		.my-popover {
			max-width: 600px;
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
   		//ReservListJSON
		$.getJSON('ReservListJSON',function(json){
			loadingBlock();
   			$.each(json.list,function(idx,orderStatus){
   			console.log(orderStatus);	
  			 	var reservNo = orderStatus.reservNo;//JSON第N筆拿到的預約編號	
  			 	var memberName = orderStatus.memberName;//JSON第N筆拿到的預約人名字	
  			 	var reservDateTime = orderStatus.reservDateTime;//JSON第N筆拿到的預約日期	
  			 	var reservEndTime = orderStatus.reservEndTime;//JSON第N筆拿到的結束時間
  			 	var brand = orderStatus.brand;//JSON第N筆拿到的廠牌
  			 	var carModel = orderStatus.carModel;//JSON第N筆拿到的車系
  			 	var employeeName = orderStatus.employeeName;//JSON第N筆拿到的員工姓名
  			 	
  			 	
  			 	
  	    		var tr = $("<tr></tr>");
  	    		var td1 = $("<td style='vertical-align:middle;'>" + reservNo + "</td>");		
  	    		var td2 = $("<td style='vertical-align:middle;'>" + memberName + "</td>");			
  	    		var td3 = $("<td style='vertical-align:middle;'>" + reservDateTime + "</td>");	
  	    		var td4 = $("<td style='vertical-align:middle;'>" + reservEndTime + "</td>");	
  	    		var td5 = $("<td style='vertical-align:middle;'>" + brand + "</td>");	
  	    		var td6 = $("<td style='vertical-align:middle;'>" + carModel + "</td>");
  	    		var td7 = $("<td style='vertical-align:middle;'>" + employeeName + "</td>");  	    		
  	    		var td8 = $("<td style='vertical-align:middle;'></td>");
  	    		var td9 = $("<td style='vertical-align:middle;'></td>");
  	    		//服務明細按鈕
  	    		var btnServ = $("<button></button>").addClass("btn btn-sm btn-danger ser-list").attr({"type":"button","data-container":"body"});
  	    		var span1 = $("<span></span>").addClass("glyphicon glyphicon-list-alt");
  	    		var cts = (+new Date());//現在時間(毫秒)
  	    		
  	    		var rdts = Date.parse(reservDateTime);//預約日期毫秒(該方法只到日期，其他的小時、分鐘、毫秒要另做計算，在加回去)
  	    		var rdtshr = (new Date(reservDateTime)).getHours();//預約日期取出小時
  	    		var rdtsmin = (new Date(reservDateTime)).getMinutes();//預約日期取出分鐘
  	    		var rdtssec = (new Date(reservDateTime)).getSeconds();//預約日期取出毫秒
  	    		rdts = rdts + (rdtshr*60*60) + (rdtsmin*60) + rdtssec;//預約日期加總換算成毫秒
  	    		var rets = Date.parse(reservEndTime);//結束日期毫秒(該方法只到日期，其他的小時、分鐘、毫秒要另做計算，在加回去)
  	    		var retshr = (new Date(reservEndTime)).getHours();//結束日期取出小時
  	    		var retsmin = (new Date(reservEndTime)).getMinutes();//結束日期取出分鐘
  	    		var retssec = (new Date(reservEndTime)).getSeconds();//結束日期取出毫秒
  	    		rets = rets + (retshr*60*60) + (retsmin*60) + retssec;//結束日期加總換算成毫秒
  	    		
//   	    		console.log("現在時間"+cts);
//   	    		console.log("預約日期"+rdts);
//   	    		console.log("預約日期小時"+rdtshr);
//   	    		console.log("預約日期分"+rdtsmin);
//   	    		console.log("預約日期秒"+rdtssec);
//   	    			console.log("window.open(surveillance.jsp?a="+reservNo+",觀看愛車)");
  	    		//監控按鈕
  	    		if(cts > rdts && cts < rets){
	  	    		var btnMit = $("<button onclick='opsurveillance(this.value)'></button>").addClass("btn btn-sm btn-danger ser-list").attr({"type":"button","value":reservNo});	
  	    		}else{
  	    			var btnMit = $("<button></button>").addClass("btn btn-sm btn-danger ser-list").attr({"type":"button","disabled":"true"}); 	    			
  	    		}
  	    		var span2 = $("<span></span>").addClass("glyphicon glyphicon-facetime-video");  

  	    		
  	    		var serTbe = $("<Table style='width:350px;'></Table>");
  	    		
  	    		var serThd = $("<thead></thead>");
  	    		var serTr = $("<tr><th>服務名稱</th><th>服務價格</th><th>服務時間</th></tr>");
  	    		serThd.append(serTr);
  	    		
  	    		var serTbd = $("<tbody></tbody>");
  	    		
  	    		var prcTotal = 0;
  	    		var tmTotal = 0;
  	    		
  	    		for(i=0; i <= (orderStatus.reserv_list.length - 1) ;i++){
  	    			var serTr = $("<tr></tr>");
  	    			var serTd1 = $("<td>" + orderStatus.reserv_list[i].servName + "</td>");
  	    			var serTd2 = $("<td>" + orderStatus.reserv_list[i].servPrice + "</td>");
  	    			var serTd3 = $("<td>" + orderStatus.reserv_list[i].servTime + "</td>");
  	    			serTr.append([serTd1,serTd2,serTd3]); 	    			
  	    			serTbd.append(serTr);
  	    			prcTotal = parseInt(prcTotal) + parseInt(orderStatus.reserv_list[i].servPrice);//服務項目價格累計	    			
  	    			tmTotal = parseInt(tmTotal) + parseInt(orderStatus.reserv_list[i].servTime);//服務項目時間累計	
  	    		}
  	    		var secs = parseInt(tmTotal) * 60;
				var hr = Math.floor(secs / 3600);
				var min = Math.floor((secs - (hr * 3600)) / 60);  	    		
  	    		
  	    		var serTrp = $("<tr>" + "<td colspan='3' style='text-align:right;'>總金額：" + prcTotal + "元" +"</td>" + "</tr>");//服務項目價格累計的Tr
  	    		var serTrt = $("<tr>" + "<td colspan='3' style='text-align:right;'>總時間：" + hr + "小時 " + min + "分鐘" +"</td>" + "</tr>");//服務項目時間累計的Tr
  	    		
  	    		serTbd.append([serTrp,serTrt]);
  	    		 	    		
  	    		serTbe.append([serThd,serTbd]);


  	    		//設定訂單查詢按鈕，所彈出的提示內容，以及相關參數設定
				$(btnServ).popover({
				    trigger:"focus",
				 	placement:"auto right",
				    html:true,
				    template: '<div class="popover my-popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>',
				    content:serTbe
				});
  	    		//結束 
  	    		
  	    		btnServ.append(span1); 	    		
  	    		td8.append(btnServ);
  	    		
  	    		btnMit.append(span2);
  	    		td9.append(btnMit);
  	    		
  	    		tr.append([td1,td2,td3,td4,td5,td6,td7,td8,td9]);
  			 	
  	    		$("table > tbody").append(tr);
   			})
   			loadingUnblock();
   		}) 	   		  	 	
 	

   		
   		
   		
  } );
  
	function opsurveillance(value){		
		window.open("surveillance.jsp?reservNo="+value,"觀看愛車");
	}
  
  
  </script>

<style>
	
	
	
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


	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>預約編號</th>
								<th>預約人</th>
								<th>預約日期</th>
								<th>結束時間</th>
								<th>廠牌</th>
								<th>車系</th>
								<th>服務技師</th>
								<th>服務明細</th>
								<th>觀看愛車</th>
							</tr>
						</thead>																
						<tbody>
																								
						</tbody>
					</table>
					<div class="blockUI" style="display: none">
						<img src="${ctx}/img/loading/reservlist_loading.gif" width="170px" height="170px"/>
					</div>
					
				</div>
				
			</div>
		</div>
	</section>
		
		<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>


</body>
</html>