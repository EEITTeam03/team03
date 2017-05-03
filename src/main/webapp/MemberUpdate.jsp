<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="form-updatein" role="form" action="MemberServlet" method="post">
									
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										  	<span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-user"></i></span>
										  	<input id="name" type="text" class="form-control" name="name" placeholder="輸入您的姓名" value='${param.name}'>
										</div>										
										
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										  	<span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-envelope"></i></span>
										  	<input id="email" type="text" class="form-control" name="email" placeholder="輸入您的電子郵件" value='${param.email}'>
										</div>
										
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										    <span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-lock"></i></span>
										    <input id="password" type="password" class="form-control" name="password" placeholder="輸入您的密碼" value='${param.password}'>
										</div>
										
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										    <span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-phone"></i></span>
										    <input id="phone" type="phone" class="form-control" name="phone" placeholder="輸入您的電話" value='${param.phone}'>
										</div>
										
										<br>										

										<div class="input-group" style="border:1px solid #FFB6C1">
										    <span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-time"></i></span>
										    <input id="datepicker" type="datepicker" class="form-control" name="datepicker" placeholder="輸入您的出生年月日" value='${param.birthday}'>
										</div>
										
										<br>
										
										<div class="input-group" style="border:1px solid #FFB6C1">
										    <span class="input-group-addon" style="border-right:1px solid #FFB6C1"><i class="glyphicon glyphicon-time"></i></span>
										    <input id="address" type="address" class="form-control" name="address" placeholder="輸入您的地址" value='${param.address}'>
										</div>
										
										<br>																									
										<small><Font color='red' >${ErrorMsgKey.NameEmptyError}</Font></small><br>
										<small><Font color='red' >${ErrorMsgKey.EmailEmptyError}</Font></small><br>
										<small><Font color='red' >${ErrorMsgKey.PasswordEmptyError}</Font></small><br>
										<small><Font color='red' >${ErrorMsgKey.PhoneEmptyError}</Font></small><br>
										<small><Font color='red' >${ErrorMsgKey.BirthdayEmptyError}</Font></small><br>
										<small><Font color='red' >${ErrorMsgKey.AddressEmptyError}</Font></small><br>
										<input type="hidden" name="action" value="update">
										<button class="btn btn-lg btn-info btn-block" type="submit" style="background-color:#FFB6C1;border-color:#FFB6C1;color:white;" >修改</button>
										
									</form>	
</body>
</html>