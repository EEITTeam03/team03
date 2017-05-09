<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>administrator Login</title>

<!-- Bootstrap Core CSS -->
<link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ctx}/admin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

</head>
<body>
<<<<<<< HEAD
	<div id="wrapper">
		<div id="page-wrapper">
			<form action="Loggin.do" method="post">
				<div class="row">
					<div class="col-md-3 col-md-offset-3">
						<p class="text-center">帳號</p>

						<div class="form-group">
							<input class="form-control" type="text" name="userid" size='40'value='${param.userid}' /> 
							<p class="text-center"><small><Font color='red'>${ErrorMsgKey.AccountEmptyError}</Font></small></p>
						</div>
						<div class="form-group">
							<p class="text-center">密碼</p>
							<input class="form-control" type="text" name="password"
								size='40' value='${param.password}' /> 
								<p class="text-center"><small><Font color='red'>${ErrorMsgKey.PasswordEmptyError}</Font></small></p>
								<p class="text-center"><small><Font color='red'>${ErrorMsgKey.LoginError}</Font></small></p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-md-offset-3">
				<p class="text-center">
				<button type="submit" class="btn btn-sm btn-primary">登入</button>
				</p>
				</div>
				<br>
			</form>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${ctx}/admin/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${ctx}/admin/js/bootstrap.min.js"></script>
=======
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
 
>>>>>>> branch 'master' of https://github.com/EEITTeam03/team03.git
</body>
</html>