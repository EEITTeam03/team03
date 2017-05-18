<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chart</title>
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
                        <div class="panel panel-green">
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
                            	<option value="2017-05">5</option>
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
                                <div class="text-right">
                                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
						<table class="table table-bordered table-hover" id="showcount">
							<thead>
								<tr>
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
                <div class="row">
                	<div class="col-lg-6">
						<table class="table table-bordered table-hover" id="showbar">
							<thead>
								<tr>
									<th>服務名稱</th>
									<th>總共被預約的次數</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
                	</div>
                	
                	 <div class="col-md-offset-6 col-lg-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i> Bar Graph Example</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                                <div class="text-right">
                                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
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
<script src="js/jquery.js"></script>
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<!--     <script src="js/plugins/flot/jquery.flot.resize.js"></script> -->
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
<!--     <script src="js/plugins/flot/flot-data.js"></script> -->
     <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
	<script type="text/javascript">
	// Flot Pie Chart with Tooltips
	$(function() {
		//var month = "2017-05";
		var tbody = $("#showcount > tbody");
		
		showchart("2017-05");
		
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
		    Morris.Bar({
		        element: 'morris-bar-chart',
		        data: [{
		            device: 'iPhone',
		            geekbench: 136
		        }, {
		            device: 'iPhone 3G',
		            geekbench: 137
		        }, {
		            device: 'iPhone 3GS',
		            geekbench: 275
		        }, {
		            device: 'iPhone 4',
		            geekbench: 380
		        }, {
		            device: 'iPhone 4S',
		            geekbench: 655
		        }, {
		            device: 'iPhone 5',
		            geekbench: 1571
		        }],
		        xkey: 'device',
		        ykeys: ['geekbench'],
		        labels: ['Geekbench'],
		        barRatio: 0.4,
		        xLabelAngle: 35,
		        hideHover: 'auto',
		        resize: true
		    });
			
			
});
	</script>
</body>
</html>