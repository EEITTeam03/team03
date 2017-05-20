<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--美美的icon-->
	<link rel="icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
<title>Cars</title>
</head>
<body>
	<jsp:include page="Testhead_nav.jsp" />
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row col-lg-4">
				
					<form role="form" action="${ctx}/MemberServlet" method="post">
						<div class="form-group">
							<label>會員編號</label> <input id="memberNo" type="text"
								class="form-control" name="memberNo" 
								value='${memberInfoVO.memberNo}' readonly>
							<p>${ErrorMsgKey.NameEmptyError}</p>
						</div>
						<div class="form-group">
							<label>會員姓名</label> <input id="name" type="text"
								class="form-control" name="name" 
								value='${memberInfoVO.memberName}'>
						</div>
						
						<div class="form-group">
							<label>e-mail</label> <input id="email" type="text"
								class="form-control" name="email" 
								value='${memberInfoVO.email}' >
						</div>
						<input name="password" type="hidden" value="${memberInfoVO.password}">
						
						<div class="form-group">
							<label>住址</label> <input id="address" type="text"
								class="form-control" name="address" 
								value='${memberInfoVO.address}'>
						</div>
						
						<div class="form-group">
							<label>電話</label> <input id="phone" type="text"
								class="form-control" name="phone" 
								value='${memberInfoVO.phone}'>
						</div>
						
						<div class="form-group">
							<label>生日</label> <input id="datepicker" type="text"
								class="form-control" name="datepicker" 
								value='${memberInfoVO.birthday}' readonly>
						</div>
						
						<div class="form-group">
							<label>帳號生效日期</label> <input id="effectiveDate" type="text"
								class="form-control" name="effectiveDate" 
								value='${memberInfoVO.effectiveDate}' readonly>
						</div>
						
						<input type="hidden" name="action" value="adminupdate">
						<div class="form-group text-center">
							<button type="submit" class="btn btn-primary">送出修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>