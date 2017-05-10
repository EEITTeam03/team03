<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>員工資料新增 </title>
<link href="${ctx}/TestAnything/cssForAdminLogin/style.css" rel="stylesheet">
<style type="text/css">
textarea{/* Text Area 固定大小*/
 max-width:300px;
 max-height:100px;
 width:300px;
 height:100px;
 margin: 5px;

</style>
</head>
<body>
<div class="login-wrap" >
<div class="login">
	<h1>新增員工資料</h1>
	
	<c:if test = "${not empty errorMsgs}">
	<font color = 'red'>請修正以下錯誤:
	<ul>
		<c:forEach var = "message" items = "${errorMsgs}">
		<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
	</c:if>
	<FORM METHOD="post" ACTION="emp.do" name="form1" enctype="multipart/form-data">
		<input type="TEXT" name="empNo" size="45" value="${param.empNo}" placeholder="請輸入員工編號" /></td>
	
		<input type="TEXT" name="ename" size="45" value="${param.ename}" placeholder="請輸入員工姓名"/></td>
		<h5 style='text-align:center;color:#fff'>經驗</h5>
		<textarea cols="50" rows="5" name="exp" ></textarea>
		<h5 style='text-align:center;color:#fff'>照片</h5>
		
		<input type="file" name="upfile1"><br>

<br>
<input type="hidden" name="action" value="insert">
<button type="submit" class="btn btn-primary btn-block btn-large">送出新增</button>

</FORM>
</div>
</div>
</body>
</html>