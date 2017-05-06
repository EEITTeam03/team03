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
	<link href="http://fonts.googleapis.com/earlyaccess/notosanstc.css" rel="stylesheet">

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

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
    <script src="js/video.js"></script>

	<!--[if lt IE 9]>
	<script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<style type="text/css">
		.button-in{
		    color: #fed136;
		    background-color: transparent;
		    border-color: #fed136;
		    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		    text-transform: uppercase;
		    font-weight: 700;						
		}
		.button-out{
		    color: white;
		    background-color: #fed136;
		    border-color: #fed136;
		    font-family: "Noto Sans TC","Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
		    text-transform: uppercase;
		    font-weight: 700;			
		}
		.btn:hover{
			color: #fed136;
		}
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
		}		
		
	</style>

    
    <script>
   		$(function(){
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
		   						var pword = $("<p></p>").addClass("text-muted").text("Graphic Design");
		   						
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
		   						
		   						$("footer").after(pmmf);
		   					//結束動態生成	
   					   		
		   						snumber=snumber+1;
   				})
   				
   			})
   			


    		var tnumber = 1;

   			$.getJSON('teams.json',function(json){
   				$.each(json.teams,function(idx,teams){
   		    		//以下開始動態生成團隊成員
					var teamName = teams.teamName;
					var teamDesc = teams.teamDesc;	    			
   		   			var cs = $("<div></div>").addClass("col-sm-4");
   		   			
   		   			var tm = $("<div></div>").addClass("team-member");
   		   			
   		   			var mimg = $("<img>").addClass("img-responsive img-circle").attr({"src":"img/team/"+tnumber+".jpg","alt":""});
   		   			var tmh = $("<h4></h4>").text(teamName);
   		   			var tmp = $("<p></p>").addClass("text-muted").text(teamDesc);
   		   			
   		   			tm.append([mimg,tmh,tmp]);
   		   			cs.append(tm);
   		   			$("#teamlist").append(cs);   					
   					
   		   			tnumber = tnumber + 1;
   					   				  					
   				})
   				
   			})
			
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

				console.log(logIn);
				console.log(regst);				
				
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
   			
   			//穿過登入、註冊按紐時觸發事件，改變樣式
   		    $(document).on('mouseenter', '.btn', function(event){
   		        $(this).removeClass("button-out");
   		     	$(this).addClass("button-in");
   		    });  			
   			//離開登入、註冊按紐時觸發事件，改變樣式
   		    $(document).on('mouseleave', '.btn', function(event){
   		        $(this).removeClass("button-in");
   		     	$(this).addClass("button-out");
   		    }); 
   		    
   		    
   		    
   		})
    
    </script>    
	    
</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Car Detailing</a>				
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
	                    <button class="page-scroll ff-word button-out btn btn-xs fun-btn" onclick="location.href='login.jsp'">
	   		
							<span class="glyphicon glyphicon-log-in"></span> 登入															
	                        
	                    </button>
	                </li>
                    <li id="nav-register" class="">
                    	<button class="page-scroll ff-word button-out btn btn-xs fun-btn" onclick="location.href='register.jsp'">
   		
							<span class="glyphicon glyphicon-user"></span> 免費註冊															
                        
                        </button>                    
                    </li>	                 
				</c:if>

						<!--	已登入	-->
				<c:if test="${!empty Code}"> 
					<li id="nav-log-in" class="dropdown">     
						<button type="button" class="page-scroll ff-word button-out btn btn-xs dropdown-toggle fun-btn" data-toggle="dropdown" aria-expanded="false">
							<span class="glyphicon glyphicon-user"></span>蔡瑋倫
						</button>
						<ul class="dropdown-menu" role="menu">
						    <li><a href="#">訂單查詢</a></li>
						    <li><a href="#">修改資料</a></li>
						    <li class="divider"></li>
						    <li><a href="#">登出</a></li>
						</ul>				              
	 				</li>
				</c:if>							
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
    
        <video autoplay loop muted class="fillWidth" style="width: 100%">            
        
			<source src="video/file.mp4" type="video/mp4" />Your browser does not support the video tag. I suggest you upgrade your browser.
			<source src="video/video_preview_h264.wmv" type="video/wmv" />Your browser does not support the video tag. I suggest you upgrade your browser.
			<!-- object標籤內解決 -->
			<object>
     			<embed src="video/video_preview_h264.mp4" type= "application/x-shockwave-flash" allowfullscreen="false" allowscriptaccess="always" style="width:100%;height:100%;z-index:-1" loop="true" />
 			</object> 


		</video>
							
        <div class="container">
            <div class="intro-text">			 			         
<!--                 <div class="intro-lead-in">Welcome To Our Studio!</div> -->
<!--                 <div class="intro-heading">It's Nice To Meet You</div> -->
                <a href="#services" class="page-scroll btn btn-xl">更多的資訊</a>
            </div>
        </div>
        

		
    </header>

    <!-- Services Section -->
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">各類服務</h2>
                    <h3 class="section-subheading text-muted">讓您可依照自身需求，選擇自己最適合的服務種類。</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">現場服務</h4>
                    <p class="text-muted">服務員現場為您安排，讓您聽美好音樂，品嚐美味甜點，悠閒等待您的愛車煥然一新。</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">預約服務</h4>
                    <p class="text-muted">時間就是金錢，透過網路預約美容服務，讓愛車在指定時間內抵達，給予專業團隊立即為您服務。</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">取還車服務</h4>
                    <p class="text-muted">讓生活忙碌的您，無需為愛車美容奔波，本公司專業人員，將會前往您指定的地點取車，並在指定時間內完成美容服務送回指定地點。</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
        
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">美容項目</h2>
                    <h3 class="section-subheading text-muted">專業團隊給予您的愛車最佳的護理服務</h3>
                </div>
            </div>
            
            <div class="row" id="svesall"></div>                                               
            
        </div>
    </section>

    <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">關於我們</h2>
                    <h3 class="section-subheading text-muted">讓您更加了解本公司的過去與未來</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/1.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>1972-2011</h4>
                                    <h4 style="font-family:Noto Sans TC; class="subheading">不屈不撓，一步一腳印</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">因為回顧過去的40年，我發現自己一直走在正確的道路上。1972年我19歲 就只因為對「汽車的熱愛」，從路邊洗車的小弟開始，40年來我逐步實現了夢想，創辦並且將事業版圖發展成國際性的「汽車美容王國」。</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/2.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 style="font-family:Noto Sans TC;">經營理念</h4>
                                    <h4 style="font-family:Noto Sans TC; class="subheading">誠信、服務 、品質</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">汽車美容中心成立理念為『誠信 服務 品質』，我們相信誠實以待，溫馨服務，選擇對的產品，公司才能永續經營。</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/4.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 style="font-family:Noto Sans TC;">未來目標</h4>
                                    <h4 style="font-family:Noto Sans TC; class="subheading">不斷努力與學習</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">我一直渴望將卡氏成功打造成為全球汽車美容業的明星品牌，我堅持信念且持續努力，我知道我已帶領所有的卡氏人走在正確的道路上，這個願景指日可待！</p>
                                </div>
                            </div>
                        </li>
<!--                         <li class="timeline-inverted"> -->
<!--                             <div class="timeline-image"> -->
<!--                                 <img class="img-circle img-responsive" src="img/about/4.jpg" alt=""> -->
<!--                             </div> -->
<!--                             <div class="timeline-panel"> -->
<!--                                 <div class="timeline-heading"> -->
<!--                                     <h4>July 2014</h4> -->
<!--                                     <h4 class="subheading">Phase Two Expansion</h4> -->
<!--                                 </div> -->
<!--                                 <div class="timeline-body"> -->
<!--                                     <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </li> -->
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4>這是
                                    <br>我們的
                                    <br>故事!</h4>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section id="team" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">團隊成員</h2>
                    <h3 class="section-subheading text-muted">專業的技術團隊，品質保證</h3>
                </div>
            </div>
            <div class="row" id="teamlist">
                
                

                
                
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">從落地窗看見愛車經美容師巧手，從頭保養後，再次以嶄新的面貌來到眼前，讓您的眼睛為之一亮。</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Clients Aside -->
    <aside class="clients">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/envato.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/designmodo.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/themeforest.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/creative-market.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
            </div>
        </div>
    </aside>

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">聯絡我們</h2>
                    <h3 class="section-subheading text-muted">有任何指教或洽詢服務歡迎來電。</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <iframe style="width: 100%;height:350px;" frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=台北市大安區復興南路一段390號&z=16&output=embed&t='></iframe>           
                </div>            	                
            </div>
            <div class="row">
            	<div class="col-xs-1 col-sm-3 col-md-4 col-lg-4 " style="color:white;margin:0 auto;">
               	
                </div>            	
            	<div class="col-xs-10 col-sm-6 col-md-6 col-lg-4" style="color:white;margin:0 auto;">
            		<br>
					<ul>
                		<li style="list-style-type:none;"><i class="fa fa-map-marker"></i> <strong>地址：</strong>台北市大安區復興南路一段390號</li>
                    	<li style="list-style-type:none;"><i class="fa fa-phone"></i> <strong>電話：</strong>02-2883-2727</li>
                    	<li style="list-style-type:none;"><i class="fa fa-fax"></i> <strong>傳真：</strong>02-2881-8272</li>
                    	<li style="list-style-type:none;"><i class="fa fa-envelope-o"></i> <strong>Email：</strong><a href="mailto:classicservice190@gmail.com">classicservice190@gmail.com</a></li>
                	</ul>              	
                </div>
            	<div class="col-xs-1 col-sm-3 col-md-2 col-lg-4" style="color:white;margin:0 auto;">
              	
                </div>                            	                
            </div>                  
            		
            
                                                                                         
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <form name="sentMessage" id="contactForm" novalidate> -->
<!--                         <div class="row"> -->
<!--                             <div class="col-md-6"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <input type="text" class="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name."> -->
<!--                                     <p class="help-block text-danger"></p> -->
<!--                                 </div> -->
<!--                                 <div class="form-group"> -->
<!--                                     <input type="email" class="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address."> -->
<!--                                     <p class="help-block text-danger"></p> -->
<!--                                 </div> -->
<!--                                 <div class="form-group"> -->
<!--                                     <input type="tel" class="form-control" placeholder="Your Phone *" id="phone" required data-validation-required-message="Please enter your phone number."> -->
<!--                                     <p class="help-block text-danger"></p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-md-6"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <textarea class="form-control" placeholder="Your Message *" id="message" required data-validation-required-message="Please enter a message."></textarea> -->
<!--                                     <p class="help-block text-danger"></p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                             <div class="col-lg-12 text-center"> -->
<!--                                 <div id="success"></div> -->
<!--                                 <button type="submit" class="btn btn-xl">Send Message</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </form> -->
<!--                 </div> -->
<!--             </div> -->
        
        
        
        
        </div>
    </section>
   

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Your Website 2016</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
               	
                <div class="col-md-4">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>                            
    </footer> 

    <!-- Portfolio Modals -->
    <!-- Use the modals below to showcase details about your portfolio projects! -->

<!--     Portfolio Modal 1 -->
<!--     <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="close-modal" data-dismiss="modal"> -->
<!--                     <div class="lr"> -->
<!--                         <div class="rl"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-8 col-lg-offset-2"> -->
<!--                             <div class="modal-body"> -->
<!--                                 Project Details Go Here -->
<!--                                 <h2>服務1</h2> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt=""> -->
<!--                                 <p>概述</p> -->
<!--                                 <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

<!--     Portfolio Modal 2 -->
<!--     <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="close-modal" data-dismiss="modal"> -->
<!--                     <div class="lr"> -->
<!--                         <div class="rl"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-8 col-lg-offset-2"> -->
<!--                             <div class="modal-body"> -->
<!--                                 <h2>服務2</h2> -->
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/startup-framework-preview.png" alt=""> -->
<!--                                 <p><a href="http://designmodo.com/startup/?u=787">Startup Framework</a> is a website builder for professionals. Startup Framework contains components and complex blocks (PSD+HTML Bootstrap themes and templates) which can easily be integrated into almost any design. All of these components are made in the same style, and can easily be integrated into projects, allowing you to create hundreds of solutions for your future projects.</p> -->
<!--                                 <p>You can preview Startup Framework <a href="http://designmodo.com/startup/?u=787">here</a>.</p> -->
<!--                                 <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

<!--     Portfolio Modal 3 -->
<!--     <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="close-modal" data-dismiss="modal"> -->
<!--                     <div class="lr"> -->
<!--                         <div class="rl"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-8 col-lg-offset-2"> -->
<!--                             <div class="modal-body"> -->
<!--                                 Project Details Go Here -->
<!--                                 <h2>服務3</h2> -->
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/treehouse-preview.png" alt=""> -->
<!--                                 <p>Treehouse is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. This is bright and spacious design perfect for people or startup companies looking to showcase their apps or other projects.</p> -->
<!--                                 <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/treehouse-free-psd-web-template/">FreebiesXpress.com</a>.</p> -->
<!--                                 <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

<!--     Portfolio Modal 4 -->
<!--     <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="close-modal" data-dismiss="modal"> -->
<!--                     <div class="lr"> -->
<!--                         <div class="rl"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-8 col-lg-offset-2"> -->
<!--                             <div class="modal-body"> -->
<!--                                 Project Details Go Here -->
<!--                                 <h2>服務4</h2> -->
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/golden-preview.png" alt=""> -->
<!--                                 <p>Start Bootstrap's Agency theme is based on Golden, a free PSD website template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Golden is a modern and clean one page web template that was made exclusively for Best PSD Freebies. This template has a great portfolio, timeline, and meet your team sections that can be easily modified to fit your needs.</p> -->
<!--                                 <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/golden-free-one-page-web-template/">FreebiesXpress.com</a>.</p> -->
<!--                                 <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

<!--     Portfolio Modal 5 -->
<!--     <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="close-modal" data-dismiss="modal"> -->
<!--                     <div class="lr"> -->
<!--                         <div class="rl"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-8 col-lg-offset-2"> -->
<!--                             <div class="modal-body"> -->
<!--                                 Project Details Go Here -->
<!--                                 <h2>服務5</h2> -->
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/escape-preview.png" alt=""> -->
<!--                                 <p>Escape is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Escape is a one page web template that was designed with agencies in mind. This template is ideal for those looking for a simple one page solution to describe your business and offer your services.</p> -->
<!--                                 <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/escape-one-page-psd-web-template/">FreebiesXpress.com</a>.</p> -->
<!--                                 <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

<!--     Portfolio Modal 6 -->
<!--     <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="close-modal" data-dismiss="modal"> -->
<!--                     <div class="lr"> -->
<!--                         <div class="rl"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-8 col-lg-offset-2"> -->
<!--                             <div class="modal-body"> -->
<!--                                 Project Details Go Here -->
<!--                                 <h2>服務6</h2> -->
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/dreams-preview.png" alt=""> -->
<!--                                 <p>Dreams is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Dreams is a modern one page web template designed for almost any purpose. It’s a beautiful template that’s designed with the Bootstrap framework in mind.</p> -->
<!--                                 <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/dreams-free-one-page-web-template/">FreebiesXpress.com</a>.</p> -->
<!--                                 <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/agency.js"></script>





</body>

</html>
