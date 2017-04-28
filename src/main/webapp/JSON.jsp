<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>水膜汽車美容</title>
	<style type="text/css">
	<!--
		@import url(http://fonts.googleapis.com/earlyaccess/notosanstc.css);
	-->
	</style>


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
    <script>
   		$(function(){
   			var bigd = $("<div></div>").addClass("col-md-4 col-sm-6 portfolio-item");
   			
   			
   			var mya = $("<a></a>").attr({"href":"#portfolioModal1","data-toggle":"modal"}).addClass("portfolio-link");
   			
   			var smalld = $("<div></div>").addClass("portfolio-hover");
   			var nd = $("<div></div>").addClass("portfolio-hover-content");
   			var ii = $("<div></div>").addClass("fa fa-plus fa-3x");
   			
   			var smallimg = $("<img>").addClass("img-responsive").attr({"src":"img/portfolio/roundicons.png","alt":""});
   			   			
   			nd.append(ii);  
   			smalld.append(nd);
   			mya.append([smalld,smallimg]);
   			
			var myd = $("<div></div>").addClass("portfolio-caption");
   			
			var hword = $("<h4></h4>").text("我是測試");
			var pword = $("<p></p>").addClass("text-muted").text("Graphic Design");
			
			myd.append([hword,pword]);
			
			bigd.append([mya,myd]);
			
			$("#svesall").append(bigd);
			
   		})

   		
   		
   		
   		
   		
    </script>


</head>
<body>
            <div class="row" id="bb">
            
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/roundicons.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>精緻人工泡沫洗車</h4>
                        <p class="text-muted">Graphic Design</p>
                    </div>
                </div>            	
                
        	</div>
        	





<!--    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true"> -->
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
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt=""> -->
<!--                                 <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p> -->
<!--                                 <p> -->
<!--                                     <strong>Want these icons in this portfolio item sample?</strong>You can download 60 of them for free, courtesy of <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>, or you can purchase the 1500 icon set <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.</p> -->
<!--                                 <ul class="list-inline"> -->
<!--                                     <li>Date: July 2014</li> -->
<!--                                     <li>Client: Round Icons</li> -->
<!--                                     <li>Category: Graphic Design</li> -->
<!--                                 </ul> -->
<!--                                 <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
        	
        	
     
     
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>服務1</h2>
                                <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt="">
                                <p>概述</p>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                	<i class="fa fa-times"></i> Close Project
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
        	
        	
        	
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/team/1.jpg" class="img-responsive img-circle" alt="">
                        <h4>Kay Garland</h4>
                        <p class="text-muted">Lead Designer</p>
                    </div>
                </div>        	
     
     
     
     
        	
        	
        	
        	
        	
</body>
</html>