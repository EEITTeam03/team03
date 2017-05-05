<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<title>車種資料</title>

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


<style>
	.ui-datepicker-month{
		color:black;
	}
	.ui-datepicker-year{
		color:black;
	}
	
/* 	註冊資料時，nav導覽列的未完成的步驟樣式設定 */
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
	.img-responsive{
		margin:0 auto;
		border:5px white solid;
	}
	.img-border{
		border:5px red outset;
	}	
	.divScroll{
		height:350px;
		overflow: scroll
	}	
	#brandImgs::-webkit-scrollbar-track
	{
		-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
		background-color: #F5F5F5;
	}
	
	#brandImgs::-webkit-scrollbar
	{
		width: 10px;
		background-color: #F5F5F5;
	}
	
	#brandImgs::-webkit-scrollbar-thumb
	{
		background-color: #F90;	
		background-image: -webkit-linear-gradient(45deg,
		                                          rgba(255, 255, 255, .2) 25%,
												  transparent 25%,
												  transparent 50%,
												  rgba(255, 255, 255, .2) 50%,
												  rgba(255, 255, 255, .2) 75%,
												  transparent 75%,
												  transparent)
	}	
	
</style>

<script>	
	
	$(function(){				
		var tnumber = 1;
		var bContainer = "";	
   			$.getJSON('car_type.json',function(json){
   				$.each(json.carTypes,function(idx,carTypes){
   		    		
					var picNo = (carTypes.modelNo)-1;   		    		
					var brand = carTypes.brand;					
					
					var selectBrand=$("select:eq(0) > option:last-child");
					
					if(bContainer != brand){
						//以下開始動態生成廠牌資料
						var op=$("<option></option>").attr({"id":picNo,"value":picNo}).text(brand);
						selectBrand.after(op);
						bContainer = brand ;
						//結束
						
						//以下開始動態生成廠牌圖片	
						var bigd = $("<div></div>").addClass("col-xs-4 col-sm-3 col-md-2 col-lg-2");
						var mya = $("<a></a>").attr({"href":"#"});
						var smallimg = $("<img>").addClass("img-responsive").attr({"value":picNo,"src":"img/car/"+picNo+".gif","alt":""});					   
	
						mya.append(smallimg)
						bigd.append(mya);
						
						$("#brandImgs").append(bigd);
						//結束
					
					}				  					   				  					
   				})
   			 		$("select:eq(0) > option:first-child").attr({"selected":"true"});
   				
   			})  			
   			
   		})
	
	function SelectCarModel(){
		var str = $("select:eq(0) > option:first-child").text();//得到字串→請選擇您的愛車廠牌
		var opValue=$("select:eq(0) :selected");
		var selectBrand=$("select:eq(1)");
		
		$("select:eq(1)").empty();
		
		$.getJSON('car_type.json',function(json){
			
   			$.each(json.carTypes,function(idx,carTypes){
  				
  			 	var brand = carTypes.brand;	
  			 	
				if(brand.indexOf(opValue.text()) > -1){
					var picNo = (carTypes.modelNo)-1;
					var carModel = carTypes.carModel;
					var op=$("<option></option>").attr({"value":picNo}).text(carModel);
					selectBrand.append(op);									
				}
			 										  					   				  					
   			})
   				
   		})
		if(str.indexOf(opValue.text()) > -1){
			var op=$("<option></option>").attr({"value":"0"}).text("車系");
			$("#carSize").attr({"value":"","placeholder":"車型"});
			selectBrand.append(op);						
		}else{
			SelectCarClass();
		}
	}
   		 		
	function SelectCarClass(){
		var opValue1 = $("select:eq(0) :selected").text();//Select現在選到的廠牌
		var opValue2 = $("select:eq(1) :selected").text();//Select現在選到的車系
		var inpValue = $("select:eq(2)");
		
		$("select:eq(2)").empty();
		
		$.getJSON('car_type.json',function(json){
			
   			$.each(json.carTypes,function(idx,carTypes){
   				
  			 	var brand = carTypes.brand;//JSON第N筆拿到的廠牌	
  			 	var carModel = carTypes.carModel;//JSON第N筆拿到的車系	
  			 	
				if(brand.indexOf(opValue1) > -1 && carModel.indexOf(opValue2) > -1){					
					carClass = carTypes.carClass;
					
					$("#carSize").attr({"value":carClass});
					return false;//等於break
				}
  			 	
   			})
   				
   		})

	}
	
	//偵測Table的X按鈕被點擊時，觸發事件
    $(document).on('click', '.delete', function(event){
        $(this).parent().parent().remove();
    });
    
	//偵測廠牌圖片被點擊時，觸發事件
    $(document).on('click', '.img-responsive', function(event){

    	$(".img-border").removeClass("img-border");
        $(this).addClass("img-border");
        var imgVal = $(this).attr("value");
        $("#selBrand").val(imgVal);
        SelectCarModel();

    });

    $(document).on('click', '.add', function(event){
		var carLicense = $("#carLicense").val().trim();//目前輸入的車牌號碼   	
		var opValue1 = $("select:eq(0) :selected").text();//Select現在選到的廠牌
		var opValue2 = $("select:eq(1) :selected").text();//Select現在選到的車系
		var carSize = $("#carSize").val();//input現在的車型
		var str = $("select:eq(0) > option:first-child").text();//得到字串→請選擇您的愛車廠牌
		
        if($("#carLicense").val().trim() == ""){
        	$("#name-error").text("這是必填欄位");       	
        }else{
        	$("#name-error").text("");  
        }
        if(opValue1.trim() == str.trim()){
        	$("#brand-error").text("請選擇愛車廠牌");
        }else{
        	$("#brand-error").text("");
        }
		if($("#carLicense").val().trim() != "" && opValue1.trim() != str.trim()){
    		var tr = $("<tr></tr>")
    		var td1 = $("<td>" + carLicense + "</td>").addClass('haha');		
    		var td2 = $("<td>" + opValue1 + "</td>");			
    		var td3 = $("<td>" + opValue2 + "</td>");	
    		var td4 = $("<td>" + carSize + "</td>");	
    		var td5 = $("<td></td>");	
    		
    		var button = $("<button></button>").addClass("btn btn-sm btn-danger delete").attr({"type":"submit","style":"color:white;"});
    		var span = $("<span></span>").addClass("glyphicon glyphicon-remove");
    		
    		button.append(span);
    		td5.append(button);
    		
    		tr.append([td1,td2,td3,td4,td5]);
    		
    		console.log(tr.children('.haha').text());
    		
    		$("#cardatas > tbody").append(tr);
    		$("#carLicense").val("");//清空車牌			       	
        }
		
    });   
															
    $(document).on('blur', '.input-value', function(event){
        if($("#carLicense").val().trim() == ""){
        	$("#name-error").text("這是必填欄位");       	
        }else{
        	$("#name-error").text("");
        }
    });   		
// 	var modelNo = "";//if判斷完後，需傳遞到後端的值   		
// 					console.log(bContainer);
// 					console.log(brand);
// 					console.log(bContainer != brand);
// 					bContainer = brand;
// 					console.log("--------------------------");   		
</script>	
	
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
						href="register.jsp"> 基本資料
					</a></li>
					<li class="page-scroll ff-word" style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px;color:white;">
						<span class="glyphicon glyphicon-arrow-right"></span>
					</li>
					<li><a class="page-scroll ff-word btn btn-primary btn-xs"
						style="text-shadow: black 5px 3px 3px; padding: 10px; margin: 0px 10px 0px 10px"
						href="#"> 車種資料
					</a></li>
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

	<section id="services">
	
<!-- 		<div class="container"> -->
<!-- 			<div id="brandImgs" class="row divBorder"> -->
			
	
<!-- 			</div> -->
<!-- 		</div> -->
			
<!-- 		<br> -->
		
		<div class="container">
			<div class="row">
				<div class="col-sm-2 col-md-2 col-lg-1"></div>
	
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-10">
					<div class="panel panel-danger" style="border-color:salmon">
						<div class="panel-heading" style="background-color:salmon;border-color:salmon;color:white;">
							<h3 class="panel-title">車種資料</h3>
						</div>
						
						<div class="panel-body">
							<div class="flot-chart">
								<div class="flot-chart-content" id="flot-bar-chart">
									<form id="cmxform" class="form-signin" role="form" action="CarLicense" method="post">
										
										<div id="brandImgs" class="row divScroll">
										
								
										</div>										
										
										<br>
										
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<span>請輸入您的車牌：</span>
												<input id="carLicense" class="input-value" type="text" name="carLicense" value='${param.carLicense}' style="width:10%;">
												<small><Font color='red' >${ErrorMsgKey.carLicenseEmptyError}</Font></small>
												<span class="label label-default">至少一筆汽車資料</span>
												<label id="name-error" class="error"></label>																						
											</div>
										</div>										
										<br>
										<div class="row">
										
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">										
												<select id="selBrand" name="select" size="1" onchange="SelectCarModel()" style="width:40%;">
											      <option value="">請選擇您的愛車廠牌</option>
								      
												</select>
												<select name="select" size="1" onchange="SelectCarClass()" style="width:20%;">
											      <option selected="true">車系</option>
												  									      
												</select>
												<input id="carSize" type="text" name="carSize" placeholder="車型" readonly="value" style="width:10%;">
												<label id="brand-error" class="error"></label>												
											</div>											
										
										</div>														
										<br>
										<div class="row">
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
											</div>
											<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
												<button class="btn btn-lg btn-danger add" type="button" style="color:white;">
													<span class="glyphicon glyphicon-plus"></span>												
												</button>
											</div>
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
											</div>																						
										</div>										
										<br>
										
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<div class="table-responsive">
													<table id="cardatas" class="table table-hover">
												      <thead>
												        <tr>
												          <th>車牌</th>
												          <th>廠牌</th>
												          <th>車系</th>
												          <th>車型</th>
												          <th>操作</th>										          
												        </tr>
												      </thead>
												      <tbody>

												      </tbody>										  	
												  </table>
												</div>												
											</div>																																
										</div>										
										<br>
										<input type="hidden" name="action" value="insert">										
										<button class="btn btn-lg btn-info btn-block" type="submit" style="background-color:#FFB6C1;border-color:#FFB6C1;color:white;" >完成</button>																				

									</form>	
								</div>
							</div>
						</div>
						
					</div>	
				</div>
				
				<div class="col-sm-2 col-md-2 col-lg-1"></div>
	
			</div>
		</div>
	</section>
	


</body>
</html>