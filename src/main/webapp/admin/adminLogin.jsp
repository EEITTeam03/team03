<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>administrator Login</title>
</head>
<body>
	<form action="loginNG.do" method="post" >  
 帳號:<input type="text" name="userid" size='40' value='${param.userid}' />
 <br>　　<small><Font color='red' >${ErrorMsgKey.AccountEmptyError}</Font></small>
 <br/><br/>  
 密碼:<input type="text" name="password" size='40' value='${param.password}'  />
 <br>　　<small><Font color='red'>${ErrorMsgKey.PasswordEmptyError}</Font></small>
 <br/>
 　　<small><Font color='red'>${ErrorMsgKey.LoginError}</Font></small>
 <br/>
 <br/>
　<input type="submit" value="登入"/>
 <br/>
 </form> 
</body>
</html>