<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="myCss.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<script src="../js/jquery.js"></script>
<script src="../vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script> 

<link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" /> 	

<style>
	.in {
		color : red;
	}
	
/* 	.dropdown-menu { */
/* 		    color: #fed136; */
/* 		    background-color: #222222; */
/* 			text-align: center; */
/*  		    min-width: 114px;  */
/* 		}				 */
		.dropdown:hover .dropdown-menu {
			
			display: block;
		}		
	
</style>
<script>




$(document).ready(function(){
	$("button").click(function(){
		
		$("p").addClass("in");
	});
	
});

$(window).resize(function(){
	
	
});
	
$(window).resize(function() {
    wdth=$(window).width();
  $("span").text(wdth);
});


</script>






</head>

<body>
<span></span>

<p>123456784561321</p>

<button>button</button>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1
        <span class="caret"></span></a>
        <div class="dropdown-menu" >
                <div class="col-sm-12">
                    <div class="col-sm-12">
                        Login
                    </div>
                    <div class="col-sm-12">
                        <input type="text" placeholder="Uname or Email" onclick="return false;" class="form-control input-sm" id="inputError" />
                    </div>
                    <br/>
                    <div class="col-sm-12">
                        <input type="password" placeholder="Password" class="form-control input-sm" name="password" id="Password1" />
                    </div>
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-success btn-sm">Sign in</button>
                    </div>
                </div>
            </div>
<!--         <ul class="dropdown-menu"> -->
<!--           <li><a href="#">Page 1-1</a></li> -->
<!--           <li><a href="#">Page 1-2</a></li> -->
<!--           <li><a href="#">Page 1-3</a></li> -->
<!--         </ul> -->
      </li>
      <li><a href="#">Page 2</a></li>
      <li><a href="#">Page 3</a></li>
    </ul>
  </div>
</nav>



</body>
</html>