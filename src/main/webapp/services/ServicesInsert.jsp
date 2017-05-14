<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ctx}/admin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
	//由<body>的onLoad事件處理函數觸發此函數
	function setFocusToUserId() {
		document.forms[0].servNo.focus(); // 將游標放在mid欄位內
	}
</script>

<!-- SweetAlert -->
    <script src="../admin/SweetAlert/js/sweetalert.min.js"></script> 
	<link href="../admin/SweetAlert/css/sweetalert.css" rel="stylesheet" type="text/css">
</head>


<body onLoad="setFocusToUserId()">

<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
	<div class="table-responsive">
		<div class="col-lg-6">
		<h2>新增服務</h2>
			<c:set var="funcName" value="REG" scope="session" />
			
			<!-- 改寫版本 -->
			<form enctype="multipart/form-data" method="post" action="${ctx}/services/services.do">
<%-- 			<form method="post" action="${ctx}/services/services.do"> --%>
			<table class="table table-bordered table-hover">
				<tr>
					<td>
						服務編號：
					</td>
					<td>
						<input type="text" name="servNo" value="${servicesVO.servNo}" class="fieldWidth" style="width: 180px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservNoEmpty}</font>
						<font size="-1" color="#FF0000">${MsgMap.errorIDDups1}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務類型編號：
					</td>
					<td>
						<input type="text" name="servTypeNo" value="${servicesVO.servTypeNo}" class="fieldWidth"style="width: 200px;"> 
						<font color="red" size="-1">${MsgMap.errorservTypeNoEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						服務名稱:
					</td>
					<td>
						<input type="text" name="servName" value="${servicesVO.servName}" class="fieldWidth" style="width: 200px;"> 
						<font color="red" size="-1">${MsgMap.errorservNameEmpty}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務描述：
					</td>
					<td>
						<input type="text" name="servDesc" value="${servicesVO.servDesc}" class="fieldWidth" style="width: 180px;"> 
						<font color="red" size="-1">${MsgMap.errorservDesc}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務有效日期：
					</td>
					<td>
					<input type="date" name="servEffectiveDate" value="${servicesVO.servEffectiveDate}" class="fieldWidth" style="width: 320px;"> 
					<font color="red" size="-1">${MsgMap.errorservEffectiveDate}</font>
					</td>
				</tr>
				<tr>
					<td>
						服務狀態：
					</td>
					<td>
						<input type="text"name="servStatus" value="${servicesVO.servStatus}" class="fieldWidth" style="width: 120px;"> 
						<font color="red" size="-1">${MsgMap.errorservStatus}</font>
					</td>
				</tr>
				<tr>
					<td>
						服務照片：
					</td>
					<td>
					<Input Type="file" size="40" name="servPhoto" class="fieldWidth" style="width: 480px;" name="file1">
					<font color="red" size="-1">${MsgMap.errPicture}</font>
					</td>
				</tr>

			</table>
			<div id="btnArea" align="center">
				<button type="submit" class="btn btn-sm btn-primary" name="submit">送出</button> 
				<input type="hidden" name="action" value="insert"> 
				<button type="reset" name="cancel" id="cancel" class="btn btn-sm btn-primary">重填</button>
			</div>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>