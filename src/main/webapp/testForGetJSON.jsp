<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testForGetJSON</title>
<script type="text/javascript" src="scheduleJS/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function () {
	$('#btn_search').click(function(){
		var date = $('#date').val();
		var view = $('#view').val();
// 		alert(date);
// 		alert(view);
 		dataSearch(date,view);
		
	});
	function dataSearch(date,view){
	    		//loading圖 if此時有就不要做
	        	$.ajax({
	        		url: "MyJSON",
	        		dataType: "json",
	        		data:{'date':date,'view':view},
	        		method:"POST",
	        		success:function(data){
	        			alert("success");
	        			$.each(data,function(key,value){
	        				$.each(value,function(id,good){
	        					console.log(id);
	        					console.log(good);
	        				});
	        			})
	        		},
	        		error:function(data){
	        			alert("ERROR");
	        		}
	        	});	
	}        
});
</script>
</head>
<body>
<from>
	<input type="text" id="date"/><br>
	<p>日期 ex:2017-05-01</p><br>
	<input type="text" id="view"/><br><small><Font color='red' >${ErrorMsgKey.NotAcurrateView}</Font></small>
	<p>view ex: dayView.weekView.monthView</p>
	<input type="button" id="btn_search" value="submit"/><br>

</from>

**資料庫為最新版(5/2 柏元:Reserve新增一個欄位ReservEndTime)<br>
**pom檔設定多GJSON<br>
**ReservService.java要多put訂單編號reservNo<br>
**在com.test.controller套件放入: scheduleTestServlet.java (暫時將人工異動預約單時顯示在此)<br>
scheduleTest2.jsp<br>
(讀)<br>
line:	function:		<br>
363		dataSearch(date,view)	---servlet透過此方法傳送的'date' 查詢日期所在區間('view')資料<br>
383		showData(data)			---接收servlet回傳的data，顯示於畫面<br>
<br>

<br>
(新刪修)
line:	function:	<br>
337		editToServlet(data,action,addDate)		---將data.action(新刪修)傳至後端servlet<br>


</body>
</html>