<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import = "com.schedule.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Week Schedule</title>
</head>
<body>
	<table border="1" >
		<thead>
			<tr height=00>
				<th></th>
				<th>星期日</th>
				<th>星期一</th>
				<th>星期二</th>
				<th>星期三</th>
				<th>星期四</th>
				<th>星期五</th>
				<th>星期六</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<td>8:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="8:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>9:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="9:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>9:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="9:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>10:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="10:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>10:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="10:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>11:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="11:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>11:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="11:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>12:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="12:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>12:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="12:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>13:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="13:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>13:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="13:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>14:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="14:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>14:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="14:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>15:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="15:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>15:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="15:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>16:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="16:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>16:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="16:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>17:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="17:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>17:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="17:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>18:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="18:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>18:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="18:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>19:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="19:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>19:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="19:30-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>20:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="20:00-${i}"></td> 
			</c:forEach>
			</tr>
			<tr>
			<td>20:30</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="20:30-${i}"></td> 
			</c:forEach>
			<tr>
			<td>21:00</td>
			<c:forEach var="i" begin='0' end='6'>
				<td id="21:00-${i}"></td> 
			</c:forEach>
			</tr>
			
		</tbody>
	</table>
	
<script src="http://code.jquery.com/jquery.min.js"></script>
	<script>
  		$(document).ready(function(){
			$.getJSON('GetJSON',function(datas){
				
				 $.each(datas,function(idx,service){
// 					   console.log(service.員工姓名);
// 					   console.log(service.開始時間);
					var i=0;
					  var time = service.開始時間+'-'+service.星期;
					  //console.log(time.substring(0,2));
					   //var startH =parseInt(time.substring(0,2));
					   //var endH   =parseInt(service.結束時間.substring(0,2));
					  // 				parseInt(time.substring(3,4));		
					  //console.log(parseInt(time.substring(3,4)));
					  //document.getElementById(time).style.backgroundColor = "red";
					 var obj = document.getElementById(time);
					 //obj.rowspan;
					 obj.innerHTML = obj.innerHTML+"<br><span>"+service.員工姓名+"  "+service.服務項目+"  "+service.結束時間 +"結束<span>";
					
// 					 if(service.員工姓名=='周柏元')
// 						 obj.getElementsByTagName( 'span' )[i].style.backgroundColor='yellow';
// 					 else if(service.員工姓名=='陳致鈞') obj.getElementsByTagName( 'span' )[i].style.backgroundColor='lightgreen';
// 					 else obj.getElementsByTagName( 'span' )[i].style.backgroundColor='orange';
// 					 i++;
					 
// 					 var t=service.總長 /30;
// 					 obj.setAttribute("rowspan",t);
				   });
			})
  		});
	</script>
</body>
</html>