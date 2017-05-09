<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>administrator Login</title>
</head>
<body>
	<form action="Loggin.do" method="post" >  
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