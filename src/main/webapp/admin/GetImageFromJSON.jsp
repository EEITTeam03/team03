<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript" src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$.getJSON('GetImageFromJSON',function(datas){
			//console.log(datas.img1);
			var x = $("<img/>");
			x.attr('src','data:image/jpeg;base64,'+datas.img1);
			x.attr("width","180");
			x.attr("height","180");
			$('body').append(x);
			})
		});
	
	</script>
	
</body>
</html>