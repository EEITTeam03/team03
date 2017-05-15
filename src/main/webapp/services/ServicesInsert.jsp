<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${ctx}/scheduleJS/scripts/jquery-1.11.1.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ctx}/admin/css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ctx}/admin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
	//由<body>的onLoad事件處理函數觸發此函數
	function setFocusToUserId() {
		document.forms[0].servNo.focus(); // 將游標放在mid欄位內
	}
	//顯示所選的圖片
	$(function (){
	    function format_float(num, pos)
	    {
	        var size = Math.pow(10, pos);
	        return Math.round(num * size) / size;
	    }
	 
	    function preview(input) {
	 
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            
	            reader.onload = function (e) {
	                $('.preview').attr('src', e.target.result);
	                var KB = format_float(e.total / 1024, 2);
	                $('.size').text("檔案大小：" + KB + " KB");
	            }
	 
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	 
	    $("body").on("change", ".fieldWidth", function (){
	        preview(this);
	    })
	    
	})
	
	function format_float(num, pos)
{
    var size = Math.pow(10, pos);
    return Math.round(num * size) / size;
}
</script>

<!-- SweetAlert -->
    <script src="../admin/SweetAlert/js/sweetalert.min.js"></script> 
	<link href="../admin/SweetAlert/css/sweetalert.css" rel="stylesheet" type="text/css">
</head>


<body onLoad="setFocusToUserId()">

<jsp:include page="../admin/Testhead_nav.jsp"/>
<div id="wrapper">
<div id="page-wrapper">
	<div class="table-responsive">
		<div class="col-lg-6">
		<h2>新增服務</h2>
			<c:set var="funcName" value="REG" scope="session" />
			
			<!-- 改寫版本 -->
			<form enctype="multipart/form-data" method="post" action="${ctx}/services/services.do">
			<table class="table table-bordered table-hover">
				<tr>
					<td>
						服務編號：
					</td>
					<td>
						<input type="text" name="servNo" value="${servicesVO.servNo}" style="width: 180px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservNoEmpty}</font>
						<font size="-1" color="#FF0000">${MsgMap.errorIDDups1}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務類型編號：
					</td>
					<td>
						<input type="text" name="servTypeNo" value="${servicesVO.servTypeNo}" style="width: 200px;"> 
						<font color="red" size="-1">${MsgMap.errorservTypeNoEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						服務名稱:
					</td>
					<td>
						<input type="text" name="servName" value="${servicesVO.servName}" style="width: 200px;"> 
						<font color="red" size="-1">${MsgMap.errorservNameEmpty}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務描述：
					</td>
					<td>
						<input type="text" name="servDesc" value="${servicesVO.servDesc}" style="width: 180px;"> 
						<font color="red" size="-1">${MsgMap.errorservDesc}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務有效日期：
					</td>
					<td>
					<input type="date" name="servEffectiveDate" value="${servicesVO.servEffectiveDate}" style="width: 320px;"> 
					<font color="red" size="-1">${MsgMap.errorservEffectiveDate}</font>
					</td>
				</tr>
				<tr>
					<td>
						服務狀態：
					</td>
					<td>
						<input type="text"name="servStatus" value="${servicesVO.servStatus}" style="width: 120px;"> 
						<font color="red" size="-1">${MsgMap.errorservStatus}</font>
					</td>
				</tr>
				<tr>
					<td>
						服務照片：
					</td>
					<td>
					<input Type="file" size="40" name="servPhoto" class="fieldWidth" style="width: 480px;" name="file1">
					<font color="red" size="-1">${MsgMap.errPicture}</font>
					
					<div>
						<img class="preview" style="max-width: 150px; max-height: 150px;">
        				<div class="size"></div>
					</div>
					</td>
				</tr>
				</table>
				<h2>服務車輛等級</h2>
				<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>車種</th>
						<th>價格</th>
						<th>服務時間</th>
					</tr>
				</thead>
				
				<tr >
					<td>
						大型車(L)
					</td>
					<td>
						<input type="text"name="servPriceL" value="${serviceCarClassVOL.servPriceL}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceLEmpty}</font>
					</td>
					<td>
						<input type="text"name="servTimeL" value="${serviceCarClassVOL.servTimeL}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeLEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						中型車(M)
					</td>
					<td>
						<input type="text"name="servPriceM" value="${serviceCarClassVOM.servPriceM}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceMEmpty}</font>
					</td>
					<td>
						<input type="text"name="servTimeM" value="${serviceCarClassVOM.servTimeM}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeMEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						小型車(S)
					</td>
					<td>
						<input type="text"name="servPriceS" value="${serviceCarClassVOS.servPriceS}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceSEmpty}</font>
					</td>
					<td>
						
						<input type="text"name="servTimeS" value="${serviceCarClassVOS.servTimeS}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeSEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						休旅車(XL)
					</td>
					<td>
						<input type="text"name="servPriceXL" value="${serviceCarClassVOXL.servPriceXL}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceXLEmpty}</font>
					</td>
					<td>
						<input type="text"name="servTimeXL" value="${serviceCarClassVOXL.servTimeXL}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeXLEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						商旅車(XXL)
					</td>
					<td>
						<input type="text"name="servPriceXXL" value="${serviceCarClassVOXXL.servPriceXXL}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceXXLEmpty}</font>
					</td>
					<td>
						<input type="text"name="servTimeXXL" value="${serviceCarClassVOXXL.servTimeXXL}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeXXLEmpty}</font>
					</td>
				</tr>
				</table>.
<!-- 				<h2>服務步驟</h2> -->
<!-- 				<table class="table table-bordered table-hover"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th>服務步驟</th> -->
<!-- 						<th>服務步驟名稱</th> -->
<!-- 						<th>服務步驟描述</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							服務步驟-1 -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<input type="hidden"name="servStepOne" value="1"> -->
<%-- 							<input type="text" name="stepNameOne" value="${servStepVOOne.stepNameOne}" style="width: 120px;"/> --%>
<!-- 						</td> -->
<!-- 						<td> -->
<%-- 							<input type="text" name="stepDescpOne" value="${servStepVOOne.stepNameOne}" style="width: 120px;"/> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							服務步驟-2 -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<input type="hidden"name="servStepTwo" value="2"> -->
<%-- 							<input type="text" name="stepNameTwo" value="${servStepVOTwo.servTimeXXL}" style="width: 120px;"/> --%>
<!-- 						</td> -->
<!-- 						<td> -->
<%-- 							<input type="text" name="stepDescpTwo" value="${servStepVOOne.stepNameOne}" style="width: 120px;"/> --%>
<!-- 						</td> -->
						
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							服務步驟-3 -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<input type="hidden"name="servStepThree" value="3"> -->
<%-- 							<input type="text" name="stepNameThree" value="${servStepVOThree.servTimeXXL}" style="width: 120px;"/> --%>
<!-- 						</td> -->
<!-- 						<td> -->
<%-- 							<input type="text" name="stepDescpThree" value="${servStepVOOne.stepNameOne}" style="width: 120px;"/> --%>
<!-- 						</td> -->
						
<!-- 					</tr> -->
<!-- 				</table> -->
			
				<div id="btnArea" align="center">
				<button type="submit" class="btn btn-sm btn-primary" name="submit">送出</button> 
				<input type="hidden" name="action" value="insert"> 
				<button type="reset" name="cancel" id="cancel" class="btn btn-sm btn-primary">重填</button>
			</div>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>