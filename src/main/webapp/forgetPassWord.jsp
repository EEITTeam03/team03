<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
	<form action="reCaptcha.do" method="post">
		<div class="g-recaptcha" data-sitekey="6Lejoh8UAAAAADgia1z4Q_N9Cd2TwPa9K_uMHnzH"></div>
		<button type="submit">送出</button>
	</form>
	<script>
   function check() 
        {
                var v = grecaptcha.getResponse();
                if(v.length == 0)
                {
                        alert("請勾選我不是機器人");
                        return false;
                }
                else
                        return true; 
        }
</script>
</body>
</html>