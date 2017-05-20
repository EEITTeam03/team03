<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>報表查詢</title>
    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="Testhead_nav.jsp" />

	<div id="wrapper">
		<div id="page-wrapper">
			<div class="container-fluid">
			<div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-check-square-o"></i>每月服務被預約次數</h3>
                            </div>
                            <div class="panel-body">
                            	<h2>選擇月份</h2>
                            	<select id="month">
                            	<option value="2017-01">1</option>
                            	<option value="2017-02">2</option>
                            	<option value="2017-03">3</option>
                            	<option value="2017-04">4</option>
                            	<option value="2017-05" selected="selected">5</option>
                            	<option value="2017-06">6</option>
                            	<option value="2017-07">7</option>
                            	<option value="2017-08">8</option>
                            	<option value="2017-09">9</option>
                            	<option value="2017-10">10</option>
                            	<option value="2017-11">11</option>
                            	<option value="2017-12">12</option>
                            	</select>
                                <div class="flot-chart">
                                    <div class="flot-chart-content" id="flot-pie-chart" ></div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
						<table class="table table-bordered table-hover" id="showcount">
							<thead>
								<tr class="bg-primary">
									<th>服務名稱</th>
									<th>總共被預約的次數</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
                    </div>
                </div>
                <!-- /.row -->
		        	<div class="blockUI" style="display: none">
						<img src="${ctx}/img/loading/loading_gearwheal.gif" width="85px" height="85px"/>
					</div>
                <div class="row">
                	<div class="col-lg-6">
						<table class="table table-bordered table-hover" id="showbar">
							<thead>
								<tr class="bg-primary">
									<th>師傅</th>
									<th>金額</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
                	</div>

                	 <div class="col-lg-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-usd"></i>師傅總金額</h3>
                            </div>
                            <div class="panel-body">
                            <h2>選擇月份</h2>
                            	<select id="barselect">
                            		<option value="2017-01">1</option>
                            		<option value="2017-02">2</option>
                            		<option value="2017-03">3</option>
                            		<option value="2017-04">4</option>
                            		<option value="2017-05" selected="selected">5</option>
                            		<option value="2017-06">6</option>
                            		<option value="2017-07">7</option>
                            		<option value="2017-08">8</option>
                            		<option value="2017-09">9</option>
                            		<option value="2017-10">10</option>
                            		<option value="2017-11">11</option>
                            		<option value="2017-12">12</option>
                            	</select>
                                <div id="morris-bar-chart"></div>

                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
	 <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<!-- jQuery -->
<script src="${ctx}/js/jquery.js"></script>
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<!--     <script src="js/plugins/flot/jquery.flot.resize.js"></script> -->
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
<!--     <script src="js/plugins/flot/flot-data.js"></script> -->
     <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
	 <script type="text/javascript" src="${ctx}/blockUI/jquery.blockUI.js"></script>
	<script type="text/javascript">
	function loadingBlock(){
	 	 $.blockUI({ 
	 		message: $('div.blockUI'),
   		 	css: { 
   				border: 'none',
                left: ($(window).width() - 133) /2 + 'px', 
				'-webkit-border-radius': '10px', 
           		'-moz-border-radius': '10px', 
            	padding: '25px',
                opacity: 0.7,
            	width: '133px',
            	height: '133px'
            },
   		 	fadeIn: 0
   		 }); 
	 }
	 function loadingUnblock(){
	 	$.unblockUI();
	 	//alert("close block");
	 }
	// Flot Pie Chart with Tooltips
	$(function() {
		loadingBlock();
		//var month = "2017-05";
		var tbody = $("#showcount > tbody");
		var tbody2 = $("#showbar > tbody");
		showchart("2017-05");
		showbar("2017-05");
		
		$("#month").change(function(){
			var month = $(this).val();
			
			tbody.empty();
			
			showchart(month);
		});
		
			function showchart(month) {	
		
			$.getJSON('${ctx}/ReservListCount',{"month":month},function(data){
				console.log(data);
			
				if(data.length==0){
					
					swal({
						  type: "info",
						  title: "查無資料",
						  text: "所選的月份無任何預約",
						  timer: 1000,
						  showConfirmButton: false
						});
				}
	// 	    var data = [{
	// 	        label: "歐甘",
	// 	        data: 1
	// 	    }, {
	// 	        label: "GG",
	// 	        data: 1
	// 	    }, {
	// 	        label: "好男用",
	// 	        data: 1
	// 	    }, {
	// 	        label: "Series 3",
	// 	        data: 1
	// 	    }];
	
		    var plotObj = $.plot($("#flot-pie-chart"), data, {
		        series: {
		            pie: {
		                show: true
		              
		            }
		        },
		        grid: {
		            hoverable: true
		        },
		        tooltip: true,
		        tooltipOpts: {
		            content: "%p.1%, %s", // show percentages, rounding to 2 decimal places
		            shifts: {
		                x: 20,
		                y: 0
		            },
		            defaultTheme: true
		        }
		    });
		    
		    
		    
		    $.each(data,function(idx,serv){
		    	
		    var tr = $("<tr></tr>");
		    var td1 = $("<td></td>").text(serv.label);
		    var td2 = $("<td></td>").text(serv.data);
		    tr.append([td1,td2]);
		    tbody.append(tr);
		    });
		});
	}
			
		    // Bar Chart
		    
		    $("#barselect").change(function(){
		    	
		    	var month2 = $(this).val();
		    	
		    	showbar(month2);
		    });
		    
		    
		    function showbar (month2) {
			    $.getJSON('${ctx}/EmpProfit',{'month':month2},function(data){
			    
					if(data.length==0){
						
						swal({
							  type: "info",
							  title: "查無資料",
							  text: "所選的月份無任何預約",
							  timer: 1000,
							  showConfirmButton: false
							});
					}
	
		    	
		    	$("#morris-bar-chart").empty();
		    	tbody2.empty();
		    	
			    Morris.Bar({
			        element: 'morris-bar-chart',
			        data: data,
			        xkey: 'device',
			        ykeys: ['geekbench'],
			        labels: ['Geekbench'],
			        barRatio: 0.4,
			        xLabelAngle: 0,
			        hideHover: 'auto',
			        resize: true
			    });
			    
			    $.each(data,function(idx,bar){
			    	
				    var tr = $("<tr></tr>");
				    var td1 = $("<td></td>").text(bar.device);
				    var td2 = $("<td></td>").text(bar.geekbench+"元");
				    tr.append([td1,td2]);
				    tbody2.append(tr);
				    });
			    });
		    }
	loadingUnblock();		
});
	</script>
</body>
</html>