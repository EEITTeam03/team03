<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.feedback.model.*"%>
<%@ page import = "java.util.*" %>
<%
FeedbackService fsvc = new FeedbackService();
	Integer fNO= Integer.valueOf(request.getParameter("feedbackNO"));
    FeedbackVO fVO = fsvc.getOneFeedFeedback(fNO);
    pageContext.setAttribute("fVO",fVO);
%>
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
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<title>List one opinion</title>
<style type="text/css">
.swal-wide{
    width:800px !important;
}
</style>
</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
<table class="table table-bordered ">
	<thead>
	<tr>
	<th>意見編號</th>
	<th>發表日期</th>
	<th>會員名稱</th>
	<th>意見</th>
	<th>評價</th>
	<th>回覆意見</th>
	<th>回覆狀態</th>
	</tr>
	</thead>
	<tbody>
	<c:if test="${fVO!=null}">
<%-- 	<c:forEach var="fVO" items="${list}" begin="0" end="${list.size()-1}"> --%>
	<c:if test="${fVO.reply!=null}"><tr class="bg-success"></c:if>
	<c:if test="${fVO.reply==null}"><tr></c:if>
			<td>${fVO.feedbackNo}</td>
			<td>${fVO.feedbackDateStr}</td>
			<td>${fVO.memberName}</td>
			<td>${fVO.feedback}</td>
			<td>
			<c:choose>
				<c:when test="${fVO.readState==5}">極佳</c:when>
				<c:when test="${fVO.readState==4}">很好</c:when>
				<c:when test="${fVO.readState==3}">好</c:when>
				<c:when test="${fVO.readState==2}">尚可</c:when>
				<c:when test="${fVO.readState==1}">差</c:when>
			</c:choose>
			</td>
			<td><FORM METHOD="get" ACTION="replyFeedback.jsp">
									<c:if test="${fVO.reply!=null}">已回覆 </c:if>
						<c:if test="${fVO.reply==null}"><input type="submit" value="回覆" class="btn btn-success btn-lg"></c:if>
									<input type="hidden" name="feedbackNo" value="${fVO.feedbackNo}">
									<input type="hidden"  name="memberName" value="${fVO.memberName}">
									<input type="hidden"  name="reply" value="${fVO.reply}">
								</FORM></td>
<%-- 			<td><button class="btn btn-primary" onclick="swal({ title: '你的回覆',text:'${fVO.reply}',customClass: 'swal-wide',closeOnConfirm: true})">查看</button></td> --%>
				<td>
					 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">查看回覆</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">你的回覆</h4>
        </div>
        <div class="modal-body">
          <textarea class="form-control" style="width:860px; height:90px;border-style: none;resize: none;font-size:18px">${fVO.reply}</textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    </div>
				</td>
		</tr>
<%-- 	</c:forEach> --%>
	</c:if>
	</tbody>
	</table>
</div>
</div>
</div>
</body>
</html>