<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<FORM METHOD="get" ACTION="MemberServlet" >
        <b>輸入會員編號 (如1):</b>
        <input type="text" name="memberNo">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>


<jsp:useBean id="memberSvc" scope="page" class="com.memberinfo.model.MemberService" />
	<FORM METHOD="get" ACTION="MemberServlet" >
       <b>選擇會員編號:</b>
       <select size="1" name="memberNo">
         <c:forEach var="memberinfoVO" items="${memberSvc.all}" > 
          <option value="${memberinfoVO.memberNo}">${memberinfoVO.memberNo}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
	
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>電子郵件</th>
		<th>密碼</th>
		<th>電話</th>
		<th>生日</th>
		<th>地址</th>
		<th>註冊日期</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<tr align='center' valign='middle'>
		     <td>${memberinfoVO.memberNo}</td>
			 <td>${memberinfoVO.memberName}</td>
             <td>${memberinfoVO.email}</td>
             <td>${memberinfoVO.password}</td>
             <td>${memberinfoVO.phone}</td>
             <td>${memberinfoVO.birthday}</td>
             <td>${memberinfoVO.address}</td>
             <td>${memberinfoVO.effectiveDate}</td>
             <td>
			  <FORM METHOD="post" ACTION="MemberServlet" >
			     <input type="submit" value="修改">
			     <input type="hidden" name="memberNo" value="${memberinfoVO.memberNo}">
			     <input type="hidden" name="memberName" value="${memberinfoVO.memberName}">
			     <input type="hidden" name="email" value="${memberinfoVO.email}">
			     <input type="hidden" name="password" value="${memberinfoVO.password}">
			     <input type="hidden" name="phone" value="${memberinfoVO.phone}">
			     <input type="hidden" name="birthday" value="${memberinfoVO.birthday}">
			     <input type="hidden" name="address" value="${memberinfoVO.address}">
			     <input type="hidden" name="effectiveDate" value="${memberinfoVO.effectiveDate}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="MemberServlet">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="memberNo" value="${memberinfoVO.memberNo}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
	 </tr>
</table>
	

</body>
</html>