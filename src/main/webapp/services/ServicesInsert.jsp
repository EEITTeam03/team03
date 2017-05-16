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
<link href="${ctx}/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
	//廢廢的一鍵輸入js
	function ch(){
		document.getElementById('ForservNo').value = 2019;
		document.getElementById('ForservTypeNo').value = "M";
		document.getElementById('ForservName').value = "不知道要寫啥";
		document.getElementById('ForservDesc').value = "隨便寫個敘述還好霸";
		document.getElementById('ForservEffectiveDate').value = "2016-05-30";
		document.getElementById('ForservStatus').value ="1";
		document.getElementById('ForservPriceL').value = 100;
		document.getElementById('ForservTimeL').value = 30;
		document.getElementById('ForservPriceM').value = 200;
		document.getElementById('ForservTimeM').value = 60;
		document.getElementById('ForservPriceS').value = 300;
		document.getElementById('ForservTimeS').value = 90;
		document.getElementById('ForservPriceXL').value = 400;
		document.getElementById('ForservTimeXL').value = 120;
		document.getElementById('ForservPriceXXL').value = 500;
		document.getElementById('ForservTimeXXL').value = 150;
		document.getElementById('ForstepNameOne').value = "洗車比打程式還賺";
		document.getElementById('ForstepDescpOne').value = "那我還寫程式幹嘛?";
		document.getElementById('ForstepNameTwo').value = "那你去洗車阿";
		document.getElementById('ForstepDescpTwo').value = "就不想咩";
		document.getElementById('ForstepNameThree').value = "這格子真多";
		document.getElementById('ForstepDescpThree').value = "可是，瑞凡，我回不去了";
	}
	//使用jquery做前端驗證
	$(function(){
		$("#commentform").validate();
		
	})
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
		<input type="button" onclick="ch();" value="我就是一鍵輸入啦幹"> 
			<c:set var="funcName" value="REG" scope="session" />
			<!-- 改寫版本 -->
			<form enctype="multipart/form-data" id="commentform" method="post" action="${ctx}/services/services.do">
			<table class="table table-bordered table-hover">
				<tr>
					<td>
						服務編號：
					</td>
					<td>
						<input type="text" id="ForservNo" name="servNo" value="${servicesVO.servNo}" class="required digits" style="width:180px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservNoEmpty}</font>
						<font size="-1" color="#FF0000">${MsgMap.errorIDDups1}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務類型編號：
					</td>
					<td>
						<input type="text" id="ForservTypeNo" name="servTypeNo" value="${servicesVO.servTypeNo}" style="width: 200px;"> 
						<font color="red" size="-1">${MsgMap.errorservTypeNoEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						服務名稱:
					</td>
					<td>
						<input type="text" id="ForservName" name="servName" value="${servicesVO.servName}" style="width: 200px;"> 
						<font color="red" size="-1">${MsgMap.errorservNameEmpty}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務描述：
					</td>
					<td>
						<input type="text" id="ForservDesc" name="servDesc" value="${servicesVO.servDesc}" style="width: 180px;"> 
						<font color="red" size="-1">${MsgMap.errorservDesc}</font>
					</td>
				</tr>
				
				<tr>
					<td>
						服務有效日期：
					</td>
					<td>
					<input type="date" id="ForservEffectiveDate" name="servEffectiveDate" value="${servicesVO.servEffectiveDate}" style="width: 320px;"> 
					<font color="red" size="-1">${MsgMap.errorservEffectiveDate}</font>
					</td>
				</tr>
				<tr>
					<td>
						服務狀態：
					</td>
					<td>
						<input type="text" id="ForservStatus" name="servStatus" value="${servicesVO.servStatus}" style="width: 120px;"> 
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
						<input type="text" id="ForservPriceL" name="servPriceL" value="${serviceCarClassVOL.servPrice}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceLEmpty}</font>
					</td>
					<td>
						<input type="text" id="ForservTimeL" name="servTimeL" value="${serviceCarClassVOL.servTime}" style="width: 120px;">
<%-- 							<select name="servTimeL" value="${serviceCarClassVOL.servTime}" class="form-control"> --%>
<!-- 								<option value="30">30分鐘</option> -->
<!-- 								<option value="45">45分鐘</option> -->
<!-- 								<option value="60">60分鐘</option> -->
<!-- 								<option value="75">75分鐘</option> -->
<!-- 								<option value="90">90分鐘</option> -->
<!-- 							</select> -->
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeLEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						中型車(M)
					</td>
					<td>
						<input type="text" id="ForservPriceM" name="servPriceM" value="${serviceCarClassVOM.servPrice}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceMEmpty}</font>
					</td>
					<td>
						<input type="text" id ="ForservTimeM"name="servTimeM" value="${serviceCarClassVOM.servTime}" style="width: 120px;">
<%-- 							<select name="servTimeM" value="${serviceCarClassVOM.servTime}" class="form-control"> --%>
<!-- 								<option value="30">30分鐘</option> -->
<!-- 								<option value="45">45分鐘</option> -->
<!-- 								<option value="60">60分鐘</option> -->
<!-- 								<option value="75">75分鐘</option> -->
<!-- 								<option value="90">90分鐘</option> -->
<!-- 							</select> -->
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeMEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						小型車(S)
					</td>
					<td>
						<input type="text" id="ForservPriceS" name="servPriceS" value="${serviceCarClassVOS.servPrice}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceSEmpty}</font>
					</td>
					<td>
						
						<input type="text" id ="ForservTimeS"name="servTimeS" value="${serviceCarClassVOS.servTime}" style="width: 120px;">
<%-- 							<select name="servTimeS" value="${serviceCarClassVOS.servTime}" class="form-control"> --%>
<!-- 								<option value="30">30分鐘</option> -->
<!-- 								<option value="45">45分鐘</option> -->
<!-- 								<option value="60">60分鐘</option> -->
<!-- 								<option value="75">75分鐘</option> -->
<!-- 								<option value="90">90分鐘</option> -->
<!-- 							</select> -->
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeSEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						休旅車(XL)
					</td>
					<td>
						<input type="text" id="ForservPriceXL" name="servPriceXL" value="${serviceCarClassVOXL.servPrice}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceXLEmpty}</font>
					</td>
					<td>
						<input type="text"id="ForservTimeXL" name="servTimeXL" value="${serviceCarClassVOXL.servTime}" style="width: 120px;">
<%-- 							<select name="servTimeXL" value="${serviceCarClassVOXL.servTime}" class="form-control"> --%>
<!-- 								<option value="30">30分鐘</option> -->
<!-- 								<option value="45">45分鐘</option> -->
<!-- 								<option value="60">60分鐘</option> -->
<!-- 								<option value="75">75分鐘</option> -->
<!-- 								<option value="90">90分鐘</option> -->
<!-- 							</select> -->
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeXLEmpty}</font>
					</td>
				</tr>
				<tr>
					<td>
						商旅車(XXL)
					</td>
					<td>
						<input type="text" id="ForservPriceXXL" name="servPriceXXL" value="${serviceCarClassVOXXL.servPrice}" style="width: 120px;">
						<font size="-1" color="#FF0000">${MsgMap.errorservPriceXXLEmpty}</font>
					</td>
					<td>
						<input type="text" id="ForservTimeXXL" name="servTimeXXL" value="${serviceCarClassVOXXL.servTime}" style="width: 120px;">
<%-- 						<select name="servTimeXXL" value="${serviceCarClassVOXXL.servTime}" class="form-control"> --%>
<!-- 							<option value="30">30分鐘</option> -->
<!-- 							<option value="45">45分鐘</option> -->
<!-- 							<option value="60">60分鐘</option> -->
<!-- 							<option value="75">75分鐘</option> -->
<!-- 							<option value="90">90分鐘</option> -->
<!-- 						</select> -->
						<font size="-1" color="#FF0000">${MsgMap.errorservTimeXXLEmpty}</font>
					</td>
				</tr>
				</table>.
				<h2>服務步驟</h2>
				<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>服務步驟</th>
						<th>服務步驟名稱</th>
						<th>服務步驟描述</th>
					</tr>
				</thead>
					<tr>
						<td>
							服務步驟-1
						</td>
						<td>
							<input type="hidden"name="servStepOne" value="1">
							<input type="text" id="ForstepNameOne" name="stepNameOne" value="${servStepVOOne.stepName}" style="width: 120px;"/>
							<font size="-1" color="#FF0000">${MsgMap.errorstepNameOneEmpty}</font>
						</td>
						<td>
							<input type="text" id="ForstepDescpOne" name="stepDescpOne" value="${servStepVOOne.stepDescp}" style="width: 120px;"/>
							<font size="-1" color="#FF0000">${MsgMap.errorstepDescpOneEmpty}</font>
						</td>
					</tr>
					<tr>
						<td>
							服務步驟-2
						</td>
						<td>
							<input type="hidden"name="servStepTwo" value="2">
							<input type="text" id="ForstepNameTwo" name="stepNameTwo" value="${servStepVOTwo.stepName}" style="width: 120px;"/>
							<font size="-1" color="#FF0000">${MsgMap.errorstepNameTwoEmpty}</font>
						</td>
						<td>
							<input type="text" id="ForstepDescpTwo" name="stepDescpTwo" value="${servStepVOOne.stepDescp}" style="width: 120px;"/>
							<font size="-1" color="#FF0000">${MsgMap.errorstepDescpTwoEmpty}</font>
						</td>
						
					</tr>
					<tr>
						<td>
							服務步驟-3
						</td>
						<td>
							<input type="hidden"name="servStepThree" value="3">
							<input type="text" id="ForstepNameThree" name="stepNameThree" value="${servStepVOThree.stepName}" style="width: 120px;"/>
							<font size="-1" color="#FF0000">${MsgMap.errorstepNameThreeEmpty}</font>
						</td>
						<td>
							<input type="text" id="ForstepDescpThree" name="stepDescpThree" value="${servStepVOOne.stepDescp}" style="width: 120px;"/>
							<font size="-1" color="#FF0000">${MsgMap.errorstepDescpThreeEmpty}</font>
						</td>
						
					</tr>
				</table>
				
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