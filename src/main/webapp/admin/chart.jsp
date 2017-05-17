<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chart</title>
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
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>服務被預約總數</h3>
                            </div>
                            <div class="panel-body">
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
                	
                </div>
			</div>
		</div>
	</div>
	 <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<!-- jQuery -->
<script src="js/jquery.js"></script>
    <script src="js/plugins/flot/jquery.flot.js"></script>
<!--     <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script> -->
<!--     <script src="js/plugins/flot/jquery.flot.resize.js"></script> -->
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
<!--     <script src="js/plugins/flot/flot-data.js"></script> -->
    
	<script type="text/javascript">
	// Flot Pie Chart with Tooltips
	$(function() {
		
		$.getJSON('${ctx}/ReservListCount',{},function(data){
			console.log(data);
		
		
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
	            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
	            shifts: {
	                x: 20,
	                y: 0
	            },
	            defaultTheme: false
	        }
	    });
	    
	    
	    var tbody = $("#showcount > tbody");
	    $.each(data,function(idx,serv){
	    	
	    var tr = $("<tr></tr>");
	    var td1 = $("<td></td>").text(serv.label);
	    var td2 = $("<td></td>").text(serv.data);
	    tr.append([td1,td2]);
	    tbody.append(tr);
	    });
	});
	});
	</script>
</body>
</html>