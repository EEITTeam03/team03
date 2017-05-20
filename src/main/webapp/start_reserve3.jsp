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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/vader/theme.css" id="THEME_CSS"/>
<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

 


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
.input-group .btn[class*='carlicense'],.input-group .btn[class*='empname']{							
    text-transform: capitalize;							
    color:#bcbcbc;							
    padding: 14px 20px;							
    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;							
}							
.input-group .btn[class*='carlicense']:hover,.input-group .btn[class*='empname']:hover{							
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
#liesel,{							
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
#selcar .continue,#portfolio .continue,#date_technician .continue{							
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
#selcar .continue:hover,#portfolio .continue:hover,#date_technician .continue:hover{							
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffab23), color-stop(1, #ffec64));						
	background:-moz-linear-gradient(top, #ffab23 5%, #ffec64 100%);						
	background:-webkit-linear-gradient(top, #ffab23 5%, #ffec64 100%);						
	background:-o-linear-gradient(top, #ffab23 5%, #ffec64 100%);						
	background:-ms-linear-gradient(top, #ffab23 5%, #ffec64 100%);						
	background:linear-gradient(to bottom, #ffab23 5%, #ffec64 100%);						
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffab23', endColorstr='#ffec64',GradientType=0);						
	background-color:#ffab23;						
}							
#selcar .continue:active,#portfolio .continue:active,#date_technician .continue:active{							
	position:relative;						
	top:1px;						
}							
							
#selcar .continue span,#portfolio .continue span,#date_technician .continue span{							
	font-size:40px;						
	width:40px;						
	height:40px;						
}							
.carlicense,.empname{							
	display:none;						
	background:rgba(255, 248, 223, 0.91);												
	font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;						
	width:75%;						
	height:60px;						
	box-shadow:0 3px 20px rgba(246, 255, 251, 0.59);						
	border-radius:6px;						
	border:0px;	
	position: absolute;
	z-index:100;
	left:0px;					
}							
i{							
	margin-right:20%;						
}							
h1,h2{							
	font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;						
}
h1{
	text-align:center;
	color: red;
	text-shadow: rgb(255, 255, 255) 0px -1px 4px, rgb(255, 255, 0) 0px -2px 10px, rgb(255, 128, 0) 0px -10px 20px, rgb(255, 0, 0) 0px -18px 40px
}
h2{
	text-align:center;
	color: white;
	text-shadow: rgb(204, 204, 204) 0px 1px 0px, rgb(201, 201, 201) 0px 2px 0px, rgb(187, 187, 187) 0px 3px 0px, rgb(185, 185, 185) 0px 4px 0px, rgb(170, 170, 170) 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 6px 1px, rgba(0, 0, 0, 0.1) 0px 0px 5px, rgba(0, 0, 0, 0.3) 0px 1px 3px, rgba(0, 0, 0, 0.15) 0px 3px 5px, rgba(0, 0, 0, 0.2) 0px 5px 10px, rgba(0, 0, 0, 0.2) 0px 10px 10px, rgba(0, 0, 0, 0.1) 0px 20px 20px;
}							
#portfolio .portfolio-item .portfolio-caption{
	padding:5px;
}
.serv-price{
	padding-left:30px;
	padding-right:30px;
}
#pg2_pg1,#pg2_pg3,#pg3_pg2,#pg3_pg4{
	padding:0px;
}
#datepicker{
	display:inline;
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
 			

 			
 			
		//page1：讀取會員的車種資料，產生車牌號碼按鈕選項
  		var no=$("#no").text();
		$.getJSON("GetCars",{"no":no},function(json){
			$.each(json,function(idx,GetCars){
				var top = ((idx+1)*70)+"px" ;
				var bt = $("<button></button>").addClass("btn carlicense").attr({"type":"button"}).css("top",top);
				var i = $("<i></i>").addClass("fa fa-car fa-2x");
				var sp = $("<span></span>").text(GetCars.license);
			
				bt.append([i,sp]);
				$("#liesel").after(bt);
				
			});				
		}); 			
		//結束

		//page1：點擊車牌號碼按鈕
		$("#liesel").click(function(){
			
			//下拉DIV開關
			$(".carlicense").slideToggle("slow");
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
		
 		//page1：點擊車牌號碼下拉選項按鈕
		$(document).on('click', '.carlicense', function(event){
			
			$("#liesel span:first-child").text($(this).text());
			
			//下拉DIV開關
			$(".carlicense").slideToggle("slow");
			//結束

			//下一步按扭打開			
			$("#pg1").slideDown();
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
		//結束	
		
		//網頁讀取完畢後，第一頁打開
		$(".page1").slideToggle("slow");
		//結束
		
		//點擊pg1的下一頁按鈕後前往第2頁
	    $("#pg1").on('click', function(event){
			//第二頁打開
			$(".page2").slideToggle("slow");			
			//第一頁關閉
			$(".page1").slideToggle("slow");			
			//結束					     	
	    }); 

	 	//點擊pg2_pg1的上一頁按鈕後前往第1頁
	    $("#pg2_pg1").on('click', function(event){
			//第二頁打開狀態→關閉狀態
			$(".page2").slideToggle("slow");			
			//第一頁關閉狀態→打開狀態
			$(".page1").slideToggle("slow");			
			//結束					     	
	    });
	 	
	 	//點擊pg2_pg3的下一頁按鈕後前往第3頁
	    $("#pg2_pg3").on('click', function(event){
			//第二頁打開狀態→關閉狀態
			$(".page2").slideToggle("slow");			
			//第三頁打開
			$(".page3").slideToggle("slow");			
			//結束					     	
	    });
	 	
	 	//點擊pg3_pg2的上一頁按鈕後前往第2頁
	    $("#pg3_pg2").on('click', function(event){
			//第三頁打開狀態→關閉狀態
			$(".page3").slideToggle("slow");			
			//第二頁打開
			$(".page2").slideToggle("slow");			
			//結束					     	
	    });	

	 	//點擊pg3_pg4的上一頁按鈕後前往第2頁
	    $("#pg3_pg4").on('click', function(event){
			//第三頁打開狀態→關閉狀態
			$(".page3").slideToggle("slow");			
			//第四頁打開
			$(".page4").slideToggle("slow");			
			//結束					     	
	    });	 	
	 	
		//page2：服務項目文字區塊點擊後，自動選擇該服務並更換樣式
	    $(document).on('click','.ptag',function(event){
	    	
	    	var dvalue = $(this).attr("value");
	    	$("#svesall1 div:gt(0) div").attr({"style":"background-color:white;"});
			$(this).attr({"style":"background-color:#84B57E;"});
			
	    	if(dvalue <= 2000){
	    		if($("#"+dvalue).prop("checked")){
					$("#"+dvalue).removeAttr("checked");
					$(this).attr({"style":"background-color:white;"});
	    		}else{
	    			$("#"+dvalue).prop({"checked":"true"});
	    		}
	    	}else{
				$("#svesall1:radio").removeAttr("checked");
				$("#"+dvalue).prop({"checked":"true"});
	    	}
	    }); 		
		//結束	
	  
		//page2：產生美容項目DIV及點選後跳出的DIV
		var snumber = 0;   			
		$.getJSON('services/TestGetJsonPic',function(json){

			$.each(json,function(idx,services){
				//以下開始動態生成美容項目DIV
				var servName = services.servName;													
				var servDesc = services.servDesc;													
				var servNo = services.servNo;
				
				var bigd = $("<div></div>").addClass("col-xs-6 col-sm-6 col-md-4 col-lg-3 portfolio-item").attr("style","height:210px;");													
				   			   										
				var mya = $("<a></a>").attr({"href":"#portfolioModal"+snumber,"data-toggle":"modal"}).addClass("portfolio-link");													
																	
				var smalld = $("<div></div>").addClass("portfolio-hover");													
				var nd = $("<div></div>").addClass("portfolio-hover-content");													
				var ii = $("<div></div>").addClass("fa fa-plus fa-3x");													
																	
				var smallimg = $("<img>").addClass("img-responsive img-services").attr({"src":"data:image/jpeg;base64,"+services.servPhoto ,"alt":"","style":"height:160px;"});													
				   													
				nd.append(ii);  													
				smalld.append(nd);													
				mya.append([smalld,smallimg]);													
																	
				var myd = $("<div></div>").addClass("portfolio-caption ptag").attr({"value":servNo});													
																	
				var hword = $("<h4></h4>").text(servName);													
				var pword = $("<p></p>").addClass("text-muted");													
				var prcsp = $("<span></span>").addClass("serv-price").text("Graphic Design");
				pword.append(prcsp);
				
				var selsp = $("<span></span>");
				var lb = $("<label></label>").attr({"for":servNo}).text("選擇");				
				if( servNo <= 2000 ){
					var rad = $("<input type='checkbox' name='checkbox'></input>").attr({"id":servNo}); 
					selsp.append(rad,lb);
					pword.append(selsp);
					myd.append([hword,pword]);													
					bigd.append([mya,myd]);						
					$("#svesall2").append(bigd);									
				}else{					
					var rad = $("<input type='radio' name='radio1'></input>").attr({"id":servNo}); 
					selsp.append(rad,lb);
					pword.append(selsp);					
					myd.append([hword,pword]);													
					bigd.append([mya,myd]);						
					$("#svesall1").append(bigd);
				}																	
						   											
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
				var bbp = $("<button></button>").attr({"type":"button","data-dismiss":"modal"}).addClass("btn btn-primary");													
				var fft = $("<i></i>").addClass("fa fa-times").text("離開");													
																	
																	
				bbp.append(fft);													
				mb.append([mbh,mimg,mbp,bbp]);													
				cco.append(mb);													
				crow.append(cco);													
				cnt.append(crow);													
																	
				mc.append([cm,cnt]);													
																	
				md.append(mc);													
																	
				pmmf.append(md);													
																	
				$("#no").after(pmmf);													
			//結束動態生成														
																	
				snumber=snumber+1;													

   			});   			
   			//網頁載入時，讓第2頁的第一筆服務已被選取
   			var rf = $(":radio[name*='radio1']:first");
			rf.prop({"checked":"true"});
			var rfId = rf.attr("id");
			$("#svesall1 div[value*='"+rfId+"']").attr({"style":"background-color:#84B57E;"});
			//結束
   		});	
		
		//page4：動態生成技師DIV
		$.getJSON('emp/GetEmpJSON.do',function(json){

			$.each(json,function(idx,emp){
				var empNo = emp.empNo;
				var empName = emp.empName;
				var employeeDesc = emp.employeeDesc;		
				var picnumber = idx+1;
				var bigd = $("<div></div>").addClass("col-xs-6 col-sm-6 col-md-4 col-lg-3 portfolio-item csschange").attr({"style":"background-color:white;padding:0px;margin:0px 10px 0px 10px;","value":empNo});													
				   			   																																																																						
				var smallimg = $("<img>").addClass("img-responsive img-services").attr({"src":"img/team/"+picnumber+".jpg","alt":"","value":empNo});													
				   																										
				bigd.append(smallimg);													
																	
				var myd = $("<div></div>").addClass("portfolio-caption decsel");													
																	
				var hword = $("<h4></h4>").text(empName);													
				var pword = $("<p></p>").addClass("text-muted");													
				
				
				var selsp = $("<span></span>");
				var lb = $("<label></label>").attr({"for":empNo}).text("選擇");				

				var rad = $("<input type='radio' name='radio2'></input>").attr({"id":empNo}); 
				selsp.append(rad,lb);
				pword.append(selsp);					
				myd.append([hword,pword]);
				bigd.append(myd);
				$("#tccsel").append(bigd);
// 				console.log($(":radio[name*='radio2']"));
// 				console.log($(":radio[name*='radio2']").prop("checked"));		   											
			//結束動態生成														

   			}); 
			//page4：技師區塊被點選後，自動選擇該技師並更換樣式
		    $(document).on('click','.csschange',function(event){
		    	
		    	var dvalue = $(this).attr("value");
		    	$("#tccsel:radio").removeAttr("checked");
		    	$("#tccsel .csschange").css("background-color","white");
		    	$("#"+dvalue).prop({"checked":"true"});		    	
				$(this).css("background-color","#84B57E");
				
		    }); 		
			//結束
				
			

			//網頁載入時，讓第4頁的第一筆服務已被選取
			$("#1").prop({"checked":"true"});
			$("#tccsel div[value*='1']").css("background-color","#84B57E");
			//結束
			console.log($(":checked[name*='radio2']").attr("id"));
   		});	
		//結束
		
// 		$("#datepicker").datepicker({
// 			changeMonth : true,
// 			changeYear : false,
// 			dateFormat : 'yy-mm-dd',
// 			yearRange : '-0:+1',
// 			monthNamesShort: [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
// 			maxDate: "+3m",
// 			minDate : new Date(),
// 			onSelect : function(dateText,inst){
// 				$("#selectedDate").val(dateText);
// 				//顯示時間軸
// 				showtime();
// 				//讀出當日已預約時間
// 				var empNo = $(":checked[name*='radio2']").attr("id");
// 				$.getJSON('EmptyReservJSON',{"selectedDate":dateText,"empNo":empNo},function(data){
// 					console.log(data);
// 					$.each(data,function(idx,obj){
// 						console.log(obj);
// 						//只做好小時的判斷
// 						var x = obj.shh;
// 						var y = obj.ehh;
// 						for(var i=x;i<=y;i++){
// 							var selectedS = "#timeline input[value^='"+i+"']";
// 							$(selectedS).prop("disabled",true).removeClass().addClass("btn btn-basic");
							
// 						}
// 					});
// 				});
// 			}
// 		}).css("font-size","175%");			
		 $("#datepicker").datepicker({
		      //顯示上個月日期 及下個月日期 ，但是不可選的。
		      //default:false
		      showOtherMonths : true,
		      // 設置當沒有上一個/下一個可選擇的情況下，隱藏掉相應的按鈕。（默認為不可用）
		      //配合有設定最大最小時使用
		      //default:false
		      hideIfNoPrevNext : true,
		      //設置一個最小的可選日期。可以是Date對象，或者是數字（從今天算起，例如+7），
		      //或者有效的字符串('y'代表年, 'm'代表月, 'w'代表周, 'd'代表日, 例如：'+1m +7d')。
		      minDate : "-30d",
		      //  設置一個最大的可選日期。可以是Date對象，或者是數字（從今天算起，例如+7），
		      //或者有效的字符串('y'代表年, 'm'代表月, 'w'代表周, 'd'代表日, 例如：'+1m +7d')。
		      maxDate : "+30d"
		    });
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
	<form class="form-horizontal" action="ReserveService">
		<section id="selcar" class="page1" style="display:none;">
			<div class="container">
			
				<div class="row">
					<div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 col-md-offset-2">
		
					</div>
					<div class="col-xs-8 col-sm-8 col-md-7 col-lg-6">
						<h1>第一步：選擇您的汽車</h1>	
						<br>
						<div class="input-group" style="width:100%;position: absolute;">
							<button id="liesel" class="btn btn-lg light-orange btn-block" type="button">
								<span>車牌號碼</span><span>│</span><span class="glyphicon glyphicon-chevron-down"></span>
							</button>																						
						</div>																	
					</div>
					
					<div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
						<button id="pg1" class="btn btn-lg continue" type="button" style="display:none;">
							<span class="glyphicon glyphicon-circle-arrow-right"></span>
						</button>
					</div>							
				</div>												
			</div>
		</section>
	
	    <section id="portfolio" class="page2" style="display:none;">
	        <div class="container">
	        	
		            <div class="row">
						<div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 col-md-offset-2">
							<button id="pg2_pg1" class="btn btn-lg continue" type="button">
								<span class="glyphicon glyphicon-circle-arrow-left"></span>
							</button>				
						</div>            
		                <div class="col-xs-8 col-sm-8 col-md-7 col-lg-6">
		                    <h1>第二步：選擇您要的美容服務</h1>
		                    <br>
		                </div>
						<div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
							<button id="pg2_pg3" class="btn btn-lg continue" type="button">
								<span class="glyphicon glyphicon-circle-arrow-right"></span>
							</button>	
						</div>	                
		            </div>
		            
		            <div class="row" id="svesall1">
		                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		                    <h2>綜合服務項目(單選)</h2>	                    	                    
		                </div>
		            </div> 
		            <div class="row" id="svesall2">
		                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		                    <h2>加選服務項目(多選)</h2>	                    	                    
		                </div>								          	            	            
		            </div>
	        </div>
	    </section>
	    
	    <section id="date_technician" class="page3" style="display:none;">
	        <div class="container">
	        
		            <div class="row">
						<div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 col-md-offset-2">
							<button id="pg3_pg2" class="btn btn-lg continue" type="button">
								<span class="glyphicon glyphicon-circle-arrow-left"></span>
							</button>				
						</div>            
		                <div class="col-xs-8 col-sm-8 col-md-7 col-lg-6">
		                    <h1>第三步：選擇技師與日期</h1>
		                    <br>
		                </div>
						<div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
							<button id="pg3_pg4" class="btn btn-lg continue" type="button">
								<span class="glyphicon glyphicon-circle-arrow-right"></span>
							</button>	
						</div>	                
		            </div>
		            
		            <div class="row" id="tccsel">
		                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		                    <h2>技師名單</h2>	                    	                    
		                </div>
		            </div> 
		            <div class="row" id="datesel">
		                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		                    <h2>可選日期</h2>	                    	                    
		                </div>
<!-- 		                <div class="form-group"> -->
<!-- 			                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"> -->
<!-- 								<div id="datepicker" ></div> -->
<%-- 								<input type="hidden" name="selectedDate" id="selectedDate" class="form-control" value="${param.selectedDate}" placeholder="選擇日期"> --%>
<!-- 			                </div>	 -->
<!-- 		                </div>	                								          	            	             -->
		            </div>
		           <div id="datepicker"> </div> 
	        </div>
	        
	    </section>
	    	    
	</form> 
	
	<span id="no" hidden="hide">${memberInfo.memberNo}</span>
		
 


</body>
</html>