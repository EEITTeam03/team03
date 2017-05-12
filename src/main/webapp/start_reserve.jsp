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

<title>水膜汽車美容</title>

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

<link href="css/video.css" rel="stylesheet">
<link href="css/revision.css" rel="stylesheet">

<!-- jQuery -->
<script src="js/jquery.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.css" />
<!-- <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"> -->

<!--[if lt IE 9]>
	<script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/pepper-grinder/jquery-ui.css">
<style>
label {
	font-size: 150%;
}
.img-services{
	width:360px;
	height:260px;
}
</style>
</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top">
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
					<li><a class="page-scroll ff-word" href="#">進行預約</a></li>
					<li><a class="page-scroll ff-word" href="#services">各類服務</a></li>
					<li><a class="page-scroll ff-word" href="#portfolio">美容項目</a>
					</li>
					<li><a class="page-scroll ff-word" href="#about">關於我們</a></li>
					<li><a class="page-scroll ff-word" href="#team">團隊成員</a></li>
					<li><a class="page-scroll ff-word" href="#contact">聯絡我們</a></li>
<!-- 					<li><a class="page-scroll ff-word btn btn-primary btn-xs" -->
<!-- 						style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px" -->
<!-- 						href="login.jsp"> <span class="glyphicon glyphicon-log-in"></span> -->
<!-- 							登入 -->
<!-- 					</a></li> -->
<!-- 					<li><a class="page-scroll ff-word btn btn-primary btn-xs" -->
<!-- 						style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;" -->
<!-- 						href="register.jsp"> <span class="glyphicon glyphicon-user"></span> -->
<!-- 							免費註冊 -->
<!-- 					</a></li> -->
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
						    <li><a href="LogOut">登出</a></li>
						</ul>				              
	 				</li>
				</c:if>

				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
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
	
	<div class="container">
	<div style="height:10em">
	</div>
	</div>


	</header>
	

	
	<div class="container">
	
		
<%-- 		<span id="no" hidden="hide">${memberInfo.memberNo}</span> --%>
		
		<div class="row">
			<h2 class="service-heading text-center">開始預約</h2> 
		</div>
		
		<div class="row">
			<div class="col-md-6 text-center" id="chooseCar"></div>
		</div>
		<section id="portfolio" >
		<div class="row" id="svesall"></div>
		</section>
		<div class="row col-sm-offset-2">

			<form class="form-horizontal" action="ReserveService">
				<div class="form-group">
					<label for="inputLicense" class="col-sm-2 control-label">車牌</label>
					<div class="col-sm-6">
						<h4 class="col-sm-4" id="showLicense"></h4>
						<input type="hidden" name="license" id="inputLicense"
							class="form-control" placeholder="請輸入車牌" value="${param.license}">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">選擇員工</label>
					<div class="col-sm-6">
<!-- 						<label class="radio-inline"><input type="radio" -->
<!-- 							name="empNo" value="1">1號員工</label> <label class="radio-inline"><input -->
<!-- 							type="radio" name="empNo" value="2">2號員工</label> <label -->
<!-- 							class="radio-inline"><input type="radio" name="empNo" -->
<!-- 							value="3">3號員工</label> -->
							<select id="empNo" name="empNo" class="form-control">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
					</div>
				</div>

				<div class="form-group">
					<label for="datepicker" class="col-sm-2 control-label">選擇預約日期</label>
					<div class="col-sm-6">
						<div id="datepicker" ></div>
						<input type="hidden" name="selectedDate" id="selectedDate" 
							class="form-control" value="${param.selectedDate}"
							placeholder="選擇日期">
					</div>
				</div>
				
				<table class="table text-center" id="timeline">
<!-- 				<tr> -->
<!-- 					<td>9:00</td> -->
<!-- 					<td>9:30</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>10:00</td> -->
<!-- 					<td>10:30</td> -->
<!-- 				</tr> -->
				</table>
				
				<div class="form-group">
					<label for="selectedTime" class="col-sm-2 control-label">時間</label>
					<div class="col-sm-2" id="divtime">
<!-- 						<div id="timepicker"></div> -->
						<input id="selectedTime" name="selectedTime" value="${param.selectedTime}" class="form-control">
<!-- 						<input type="text" name="selectedTime" id="selectedTime" -->
<%-- 							class="form-control" value="${param.selectedTime}" --%>
<!-- 							placeholder="選擇時間(HH:mm)"> -->
					</div>
				</div>

				<div class="form-group">
					<label for="service" class="col-sm-2 control-label">主要服務:</label>
					<div class="col-sm-6">
						<input type="hidden" name="service" id="service" class="form-control">
						<h4 id="showserv" class="col-md-6"></h4>
					</div>
				</div>

				<div class="form-group">
					<label for="plus" class="col-sm-2 control-label">加選服務 :</label>
					<h4 id="showplus" class="col-sm-4"></h4>
					<div class="col-sm-6" hidden="hidden">
						<select name="plus" id="plus" class="form-control"
							multiple="multiple" >
							
						</select>
					</div>
				</div>


				<div class="form-group">
					<div class="col-sm-4 col-sm-offset-3">
						<input type="submit" value="送出預約" class="btn btn-xl">
					</div>
				</div>
			</form>
			<c:forEach var="msg" items="${errorMsg}">
				<h3 class="col-sm-6 col-sm-offset-3" style="color: red">${msg}</h3>
			</c:forEach>
		</div>
	</div>

	<!-- Services Section -->
<!-- 	<section id="services"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-12 text-center"> -->
<!-- 					<h2 class="section-heading">各類服務</h2> -->
<!-- 					<h3 class="section-subheading text-muted">讓您可依照自身需求，選擇自己最適合的服務種類。</h3> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row text-center"> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<span class="fa-stack fa-4x"> <i -->
<!-- 						class="fa fa-circle fa-stack-2x text-primary"></i> <i -->
<!-- 						class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i> -->
<!-- 					</span> -->
<!-- 					<h4 class="service-heading">現場服務</h4> -->
<!-- 					<p class="text-muted">服務員現場為您安排，讓您聽美好音樂，品嚐美味甜點，悠閒等待您的愛車煥然一新。</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<span class="fa-stack fa-4x"> <i -->
<!-- 						class="fa fa-circle fa-stack-2x text-primary"></i> <i -->
<!-- 						class="fa fa-laptop fa-stack-1x fa-inverse"></i> -->
<!-- 					</span> -->
<!-- 					<h4 class="service-heading">預約服務</h4> -->
<!-- 					<p class="text-muted">時間就是金錢，透過網路預約美容服務，讓愛車在指定時間內抵達，給予專業團隊立即為您服務。</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<span class="fa-stack fa-4x"> <i -->
<!-- 						class="fa fa-circle fa-stack-2x text-primary"></i> <i -->
<!-- 						class="fa fa-lock fa-stack-1x fa-inverse"></i> -->
<!-- 					</span> -->
<!-- 					<h4 class="service-heading">取還車服務</h4> -->
<!-- 					<p class="text-muted">讓生活忙碌的您，無需為愛車美容奔波，本公司專業人員，將會前往您指定的地點取車，並在指定時間內完成美容服務送回指定地點。</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->




	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; Your Website 2016</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					</ul>
				</div>

				<div class="col-md-4">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>



	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"
		integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js"></script>
<!-- 	<script src="js/jquery.datetimepicker.full.min.js"></script> -->
	
	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/agency.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				changeMonth : true,
				changeYear : false,
				dateFormat : 'yy-mm-dd',
				yearRange : '-0:+1',
				monthNamesShort: [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
				maxDate: "+3m",
				minDate : new Date(),
				onSelect : function(dateText,inst){
					//console.log(inst);
					$("#selectedDate").val(dateText);
					//顯示時間軸
					showtime();
					//讀出當日已預約時間
					var empNo = $("#empNo").val();
					$.getJSON('EmptyReservJSON',{"selectedDate":dateText,"empNo":empNo},function(data){
						console.log(data);
						$.each(data,function(idx,obj){
							//console.log(obj.start);
							//只做好小時的判斷
							var x = obj.shh;
							var y = obj.ehh;
							for(var i=x;i<=y;i++){
								var selectedS = "#timeline input[value^='"+i+"']";
//	 							//console.log(selectedS);
	 							$(selectedS).prop("disabled",true).removeClass().addClass("btn btn-basic");
							}
							
							
							//disable開始時間
// 							var selectedS = "#timeline input[value='"+obj.start+"']";
// 							//console.log(selectedS);
// 							$(selectedS).prop("disabled",true).removeClass().addClass("btn btn-basic");
							
							
						});
					});
				}
			}).css("font-size","175%");
			
			//顯示時間軸
			function showtime() {
				$("#timeline").empty();
				for(var t=9;t<21;t++) {
					if (t==9) {t="0"+t}
					var input = $("#selectedTime");
					var onerow = $("<tr></tr>");
					var btn00 = $("<input></input>").attr({"type":"button","id":t+"00"}).val(t+":00").addClass("btn btn-success");
					var btn30 = $("<input></input>").attr({"type":"button","id":t+"30"}).val(t+":30").addClass("btn btn-success");
					var td00 = $("<td></td>");
					var td30 = $("<td></td>");
					
					//建立事件
					btn00.click(function(){
						
						$("#timeline input:enabled").removeClass().addClass("btn btn-success");
// 						$("#timeline input[id*='00']:enabled").removeClass("btn-success").addClass("btn-danger");
						$(this).removeClass("btn-success").addClass("btn-danger");
						input.val($(this).val());
					});	
						//滑鼠移上去顯示時間長度
// 					}).hover(function(){	//<----------------------in
// 						var license  = $("#inputLicense").val();
// 						var serviceS = $("#service").val();
// 						var sm = $("#plus>option:selected");
// 						//console.log(serviceM);
// 						var serviceM = "";
// 						for(var i=0;i<sm.length;i++){
// 							//console.log(sm[i].value);
// 							serviceM += sm[i].value +",";
// 						}
						
// 							var thisbtn = $(this).attr("id");
// 						//console.log(serviceM.substring(0,serviceM.length-1));
// 						serviceM = serviceM.substring(0,serviceM.length-1);
// 						$.getJSON('GetTotalTimeJSON',{"license":license,"serviceS":serviceS,"serviceM":serviceM},function(data){
// 							//console.log(data);
// 							//console.log(data[0].buttons);
// 							var buttons = data[0].buttons;
// 							console.log(thisbtn);
// // 							console.log(totaltime);
// 								var id = parseInt(thisbtn);
// 								console.log(id);
// 							for (var j=0;j<buttons;j++) {
								
// 								var total = "#timeline input[id*='"+id+"']:enabled";
// 								console.log(total);
// // 								$("#timeline input[id*='00']:enabled").removeClass("btn-success").addClass("btn-danger");
// 								$(total).removeClass("btn-success").addClass("btn-danger");
// 								console.log(id);
// 								id=0
// 								id+=50;
// 							}
// 						});
// 					},function(){			//---------------------->out
// 						$("#timeline input:enabled").removeClass().addClass("btn btn-success");
// 					});
					
					btn30.click(function(){
						$("#timeline input:enabled").removeClass().addClass("btn btn-success");
						$(this).removeClass("btn-success").addClass("btn-danger");
						input.val($(this).val());
					});
					
					//開始append
					td00.append(btn00);
					td30.append(btn30);
					onerow.append([td00,td30]);
					$("#timeline").append(onerow);
					
					
					
				}
				
			}
			
// 			$("#timepicker").timepicker({
// 				appendTo:$("#divtime"),
// 				className:"form-control",
// 				timeFormat:'H:i',
// 				minTime: new Date(),
// 				maxTime:'21:00',
// 				step:30,
// 				show2400:true,
// 				disableTextInput:true
// 			});

// 			jQuery('#timepicker').datetimepicker({
// 				 datepicker:false,
// 				 allowTimes:[
// 				  '12:00', '13:00', '15:00', 
// 				  '17:00', '17:05', '17:20', '19:00', '20:00'
// 				 ]
// 			});
			
			
			//傳會員編號，取得Cars
			var no = $("#no").text();
			//console.log(no);
			$.getJSON('GetCars',{"no":${memberInfo.memberNo}},function(data){
				//console.log(data);
				var row = $("#chooseCar");
				//show data
				$.each(data,function(idx,car){
// 					console.log(car.license);
// 					console.log(car.brand);
// 					console.log(car.model);
					var one = $("<div></div>");
					$("<p></p>").html(car.license+"<br>"+car.brand+"<br>"+car.model).appendTo(one);
					var btn = $("<button></button>").addClass("btn btn-danger");
					btn.text("select").click(function(){
						$("#inputLicense").val(car.license);
						$("#showLicense").text(car.license);
					});
					one.append(btn);
					row.append(one);
				})
					$("#inputLicense").val(data[0].license);
					$("#showLicense").text(data[0].license);
			});
			
			
			//動態生成美容項目
   			var snumber = 0;
   			
   			$.getJSON('services/TestGetJsonPic',function(json){

   				$.each(json,function(idx,services){
						
		   				//以下開始動態生成美容項目DIV
		   						var servName = services.servName;
		   						var servDesc = services.servDesc;
		   						
		   			   			var bigd = $("<div></div>").addClass("col-md-4 col-sm-6 portfolio-item");
		   			   			   			   			
		   			   			var mya = $("<a></a>").attr({"href":"#portfolioModal"+snumber,"data-toggle":"modal"}).addClass("portfolio-link");
		   			   			
		   			   			var smalld = $("<div></div>").addClass("portfolio-hover");
		   			   			var nd = $("<div></div>").addClass("portfolio-hover-content");
		   			   			var ii = $("<div></div>").addClass("fa fa-plus fa-3x");
		   			   			
		   			   			var smallimg = $("<img>").addClass("img-responsive img-services").attr({"src":"data:image/jpeg;base64,"+services.servPhoto ,"alt":""});
		   			   			   			
		   			   			nd.append(ii);  
		   			   			smalld.append(nd);
		   			   			mya.append([smalld,smallimg]);
		   			   			
		   						var myd = $("<div></div>").addClass("portfolio-caption");
		   			   			
		   						var hword = $("<h4></h4>").text(servName);
		   						var pword = $("<p></p>").addClass("text-muted").text("未選擇");
		   						
		   						myd.append([hword,pword]);
		   						
		   						bigd.append([mya,myd]);
		   						
		   						$("#svesall").append(bigd);
		   								   		
		   					//結束動態生成
		   					
		   					//以下開始動態生成，美容項目點擊後所彈跳出來的介紹DIV
		   					
		   						var pmmf = $("<div></div>").addClass("portfolio-modal modal fade").attr({"id":"portfolioModal"+snumber,"tabindex":"-1","role":"dialog","aria-hidden":"true"});
		   					
		   						var md = $("<div></div>").addClass("modal-dialog");
		   					
		   						var mc = $("<div></div>").addClass("modal-content");
		   					
		   						var cm = $("<div></div>").addClass("close-modal").attr({"data-dismiss":"modal"});
		   						var lr = $("<div></div>").addClass("lr");
		   						var rl = $("<div></div>").addClass("rl");
		   						lr.append(rl);
		   						cm.append(lr);
		   						
		   						var cnt = $("<div></div>").addClass("container");
		   						var crow = $("<div></div>");
		   						var cco = $("<div></div>").addClass("col-lg-8 col-lg-offset-2");
		   						var mb = $("<div></div>").addClass("modal-body");
		   						var mbh = $("<h2></h2>").text(servName);   		
		   						var mimg = $("<img>").addClass("img-responsive img-centered big-img-services").attr({"src":"data:image/jpeg;base64,"+services.servPhoto ,"alt":""});
		   						var mbp = $("<p></p>").text(servDesc);
// 		   						var rbtn = $("<button></button>").attr({"type":"button","data-dismiss":"modal","id":"rbtn"+services.servNo}).addClass("btn btn-danger btn-lg").click(function(){
// 	   								var selector = "#"+services.servNo;
// 	   								$(selector).prop("selected",false);
// 									thisrbtn = $(this);
// 									thisrbtn.hide();
// 									thisbtn.show();
									
// // 									var sel = "#btn"+services.servNo;
// // 									$(sel).show;
// 		   						});
								//產生選擇&取消按鈕
								//選擇按鈕按下
		   						var rbtn=null;
		   						var bbp = $("<button></button>").attr({"type":"button","data-dismiss":"modal","id":"btn"+services.servNo}).addClass("btn btn-primary btn-lg").click(function(){
// 		   							thisbtn = $(this);
		   							if(rbtn==null){ 
		   							rbtn = $("<button></button>").attr({"type":"button","data-dismiss":"modal","id":"rbtn"+services.servNo}).addClass("btn btn-danger btn-lg")
		   							var rtxt = $("<i></i>").addClass("fa fa-times").text("取消");
		   							//取消按鈕按下
			   						rbtn.append(rtxt).click(function(){
			   							var selector = "#"+services.servNo;
	 	   								$(selector).prop("selected",false);
// 		 	   							thisrbtn = $(this);
										rbtn.hide();
										bbp.show();
										//刪除OK icon
										pword.removeClass().addClass("text-muted").empty().text("未選擇");
										myd.removeAttr("style");
			   						});
			   						mb.append(rbtn);
		   							}
		   							
		   							if (services.servNo >= 2000)  { //單選按下 
		   								//設定hidden欄位值
		   								$("#service").val(services.servNo);
		   								$("#showserv").text(servName);
		   								//取消其他單選	好難FK
// 		   								$("button[id^='btn2']")
		   							} else {						   //多選按下
// 		   								var plus = $("<input>").attr({"type":"text","name":"plus","value":services.servNo})
// 		   								$("#plus").append(plus);
		   								var selector = "#"+services.servNo;
		   								$(selector).prop("selected",true);

		   								
		   							}
		   							//選擇按下的共通事件
		   							
		   							bbp.hide();
		   							rbtn.show();
		   							//出現OK icon
		   							var okicon = $("<i></i>").addClass("fa fa-check-square");
		   							pword.text("已選擇").removeClass().addClass("text-success").append(okicon);
		   							myd.css("background-color","#84B57E");
		   							$("#showplus").html($("#plus option:selected").text());
		   						});
// 		   						rbtn.hide();
		   						var fft = $("<i></i>").addClass("fa fa-check").text("選擇");
// 		   						var rtxt = $("<i></i>").addClass("fa fa-times").text("取消");
// 		   						rbtn.append(rtxt);
		   						
		   						bbp.append(fft);
		   						mb.append([mbh,mimg,mbp,bbp]);
		   						cco.append(mb);
		   						crow.append(cco);
		   						cnt.append(crow);
		   						
		   						mc.append([cm,cnt]);
		   						
		   						md.append(mc);
		   						
		   						pmmf.append(md);
		   						
		   						$("footer").after(pmmf);
		   					//結束動態生成	
   					   		
		   						snumber=snumber+1;
		   					
		   						
		   					//產生多選option到<select>
		   					if(services.servNo <2000) {
		   						$("<option></option>").attr({"id":services.servNo,"value":services.servNo}).text(servName+"，").appendTo($("#plus"));
		   					}
 		   				
   				})
   				
   			})
			
		});
	</script>



</body>

</html>
