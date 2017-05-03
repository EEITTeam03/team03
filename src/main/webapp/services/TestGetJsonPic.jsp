<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$.getJSON('TestGetJsonPic', function(datas) {
				$.each(datas,function(i,pic){
					var x = $("<img/>");
					x.attr('src', 'data:image/jpeg;base64,' + pic.照片);
					x.attr("width", "180");
					x.attr("height", "180");
					var y=$("<h6></h6>").text("服務描述:"+pic.服務描述);
					var z=$("<h1></h1>").text("服務名稱:"+pic.服務名稱);
					$('body').append(z).append(x).append(y);	
				})
				
			})
		});
	</script>
	
	

</body>
</html>