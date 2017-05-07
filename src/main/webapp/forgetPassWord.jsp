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
		<div>
		<input id="email" type="text" name="email" placeholder="輸入您的電子郵件" value='${param.email}'>
		<small><Font color='red' >${ErrorMsgKey.AccountError}</Font></small>
		</div>
		<input id="phone" type="text" name="phone" placeholder="輸入您的電話號碼" value='${param.phone}'>
		<small><Font color='red' >${ErrorMsgKey.PhoneError}</Font></small>
		</div>
		<div class="g-recaptcha" data-sitekey="6Lejoh8UAAAAADgia1z4Q_N9Cd2TwPa9K_uMHnzH"></div>
		<button type="submit">送出</button><small><Font color='red'>${ErrorMsgKey.RobotFail}</Font></small>
		<br /> <small><Font color='red'>${ErrorMsgKey.Error}</Font></small> <br />
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