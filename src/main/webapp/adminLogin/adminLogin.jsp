<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>administrator Login</title>
<link href="${ctx}/TestAnything/cssForAdminLogin/style.css" rel="stylesheet">
</head>
<body>
<div class="login-wrap">
<div class="login">
<h1>後台登入</h1>
	<form action="Loggin.do" method="post">
	
		<input type="text" name="userid" size='40' value='${param.userid}' placeholder="請輸入帳號"/>
		<Font color='red'>${ErrorMsgKey.AccountEmptyError}</Font>
		<br />
		<br />
		<input type="text" name="password" size='40' value='${param.password}' placeholder="請輸入密碼"/> <br> <small><Font
			color='red'>${ErrorMsgKey.PasswordEmptyError}</Font></small> <br /> 
			<Font color='red'>${ErrorMsgKey.LoginError}</Font>
			<button type="submit" class="btn btn-primary btn-block btn-large">登入</button>
	</form>
</div>
</div>
</body>
</html>