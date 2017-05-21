<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.services.model.*"%>
<%@ page import="com.servicecarclass.model.*"%>
<%@ page import="java.util.*"%>
<%
	ServicesService ssjsp = new ServicesService();
	ServiceCarClassService sccs=new ServiceCarClassService();
	List<ServicesVO> list = ssjsp.getAll();
	
	List<ServiceCarClassVO> list2=new ArrayList<ServiceCarClassVO>();
	List<ServiceCarClassVO> list3=new ArrayList<ServiceCarClassVO>();
	List<ServiceCarClassVO> list4=new ArrayList<ServiceCarClassVO>();
	List<ServiceCarClassVO> list5=new ArrayList<ServiceCarClassVO>();
	List<ServiceCarClassVO> list6=new ArrayList<ServiceCarClassVO>();

	for(ServicesVO servNo:list){
		list2.add(sccs.getMorePriceAndTimeByFK(servNo.getServNo()).get(0));
	}
	for(ServicesVO servNo1:list){
		list3.add(sccs.getMorePriceAndTimeByFK(servNo1.getServNo()).get(1));
	}
	for(ServicesVO servNo2:list){
		list4.add(sccs.getMorePriceAndTimeByFK(servNo2.getServNo()).get(2));
	}
	for(ServicesVO servNo3:list){
		list5.add(sccs.getMorePriceAndTimeByFK(servNo3.getServNo()).get(3));
	}
	for(ServicesVO servNo4:list){
		list6.add(sccs.getMorePriceAndTimeByFK(servNo4.getServNo()).get(4));
	}
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("list2", list2);
	pageContext.setAttribute("list3", list3);
	pageContext.setAttribute("list4", list4);
	pageContext.setAttribute("list5", list5);
	pageContext.setAttribute("list6", list6);
%>

<!DOCTYPE html>
<html>
<head>
<title>所有服務項目</title>
<!--美美的icon-->
<link rel="icon" href="../admin/favicon.ico" type="image/x-icon" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script type="text/javascript" src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
  <!-- Bootstrap Core CSS -->
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
<div class="table-responsive">
<h2>所有服務價格</h2>
<table class="table table-bordered table-hover">

					<tr align='center' class="info" >
						<td width="200">服務類型和編號/車種</td>
							
						<c:forEach var="servicesVO" items="${list}">
							<td>
								${servicesVO.servName}
							</td>
							
						</c:forEach>
					</tr>
					<tr>
						<td>
							大型車(L)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list2}">
							<td>
								${serviceCarClassVO.servPrice}
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>
							中型車(M)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list3}">
							<td>
								${serviceCarClassVO.servPrice}
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>
							小型車(S)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list4}">
							<td>
								${serviceCarClassVO.servPrice}
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>
							休旅車(XL)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list5}">
							<td>
								${serviceCarClassVO.servPrice}
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>
							商旅車(XXL)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list6}">
							<td>
								${serviceCarClassVO.servPrice}
							</td>
						</c:forEach>
					</tr>
	</table>
	
<h2>所有服務時間</h2>
<table class="table table-bordered table-hover">

					<tr align='center' class="success">
						<td width="200">服務類型和編號/車種</td>
							
						<c:forEach var="servicesVO" items="${list}">
							<td>
								${servicesVO.servName}
							</td>
							
						</c:forEach>
					</tr>
					<tr>
						<td>
							大型車(L)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list2}">
							<td>
								${serviceCarClassVO.servTime} 分鐘
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>
							中型車(M)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list3}">
							<td>
								${serviceCarClassVO.servTime} 分鐘
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>
							小型車(S)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list4}">
							<td>
								${serviceCarClassVO.servTime} 分鐘
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>
							休旅車(XL)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list5}">
							<td>
								${serviceCarClassVO.servTime} 分鐘
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>
							商旅車(XXL)
						</td>
						<c:forEach var="serviceCarClassVO" items="${list6}">
							<td>
								${serviceCarClassVO.servTime} 分鐘
							</td>
						</c:forEach>
					</tr>
	</table>
	</div>
	</div>
	</div>
</body>
</html>