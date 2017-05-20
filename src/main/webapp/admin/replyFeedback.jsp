<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
<!-- Bootstrap Core CSS -->
<link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ctx}/admin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<title>回覆意見</title>
</head>
<body>
	<jsp:include page="../admin/Testhead_nav.jsp" />
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="table-responsive">
				<h1>回覆意見</h1>
				<form method="post" ACTION="${ctx}/ReplyOpinions">
					<table class="table table-bordered table-hover">
					<tr><td>意見編號: ${param.feedbackNo}</td></tr>
					<tr><td>收信人: ${param.memberName}</td></tr>
					</table >
					<textarea placeholder="回覆客戶意見" name="comment" style="width:1674px;height:150px;resize:none;">${param.reply}</textarea>
					<input type="submit" value="送出">
					<input type="reset" value="清除">
					<input type="hidden" name="feedbackNo" value="${param.feedbackNo}">
					<input type="hidden" name="action" value="reply">  
				</form>
			</div>
		</div>
	</div>
</body>
</html>