<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//由<body>的onLoad事件處理函數觸發此函數
function setFocusToUserId(){   
	 document.forms[0].servNo.focus();   // 將游標放在mid欄位內
}
</script>
</head>
<body onLoad="setFocusToUserId()" >
<table border='1' width='800'>
		<thead align='center' valign='middle'>
			<tr>
				<td>所有服務資料</td>
			</tr>
		</thead>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><a href="SelectServices.jsp">回搜尋服務頁</a></td>
		</tr>
	</table>
<c:set var="funcName" value="REG" scope="session"/>
  <div id="content"> 
  <Table width="700" border='2' cellspacing="0" bgColor='#E7CDFF'>
     <TR height="60" >
         <TD>
         <TABLE cellspacing="1" >
         <TR>
             <TD width="680" colspan='3' align="center" >
                 <Font color="#006600" size='5' face="標楷體">${AppName}</Font>
             </TD>
         
         </TR>
         <TR>
             <TD width="240" ></TD>
             <TD width="200"  align="center">
                 <Font color="#006600" size='4' face="標楷體">加入服務</Font>
             </TD>
         <!-- 此區塊顯示程式執行後的訊息 -->
             <TD width="240" aligh="left"><font size="-1" color="#FF0000">
                 ${MsgMap.InsertNG}${MsgMap.errorSaveData}</font>
             </TD>
         </TR>         
         </TABLE>
         </TD>
     </TR>
     <TR><TD colspan="3">
  <form ENCTYPE="multipart/form-data" method="POST" action="services.do"  id="services.do" >
      <label class="fontSize" >服務編號：</label>
      <input type="text" name="servNo" value="${param.servNo}" class="fieldWidth" style="width: 180px;">
      <!-- 
         注意value屬性的內容以及顯示錯誤訊息的寫法
      -->
      <font size="-1" color="#FF0000">${MsgMap.errorservNoEmpty}</font>
      <font size="-1" color="#FF0000">${MsgMap.errorIDDups1}</font>
      <br/>
      <label class="fontSize" >服務類型編號：</label>
      <input type="text" name="servTypeNo" value="${param.servTypeNo}" class="fieldWidth" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorservTypeNoEmpty}</font>      
      <br/>
      
      <label class="fontSize" >服務名稱：</label>
      <input type="text" name="servName" value="${param.servName}"   class="fieldWidth" style="width: 200px;">
      <font color="red" size="-1">${MsgMap.errorservNameEmpty}</font>            
      <br/>
      
      <label class="fontSize" >服務描述：</label>
      <input type="text" name="servDesc" value="${param.servDesc}"  class="fieldWidth" style="width: 180px;">
      <font color="red" size="-1">${MsgMap.errorservDesc}</font>
      <br/>
      
      <label class="fontSize" >服務有效日期：</label>
      <input type="date" name="servEffectiveDate" value="${param.servEffectiveDate}"  class="fieldWidth" style="width: 320px;">
      <font color="red" size="-1">${MsgMap.errorservEffectiveDate}</font>
      <br/>
      
      <label class="fontSize" >服務狀態：</label>
      <input type="text"  name="servStatus" value="${param.servStatus}"    class="fieldWidth" style="width: 120px;">
      <font color="red" size="-1">${MsgMap.errorservStatus}</font>
      <br/>
      
      <label class="fontSize" >服務照片：</label>
      <Input Type="file" size="40" class="fieldWidth" style="width: 480px;"  name="file1"><BR>
       <font color="red" size="-1">${MsgMap.errPicture}</font>
      <br/>
      <div id="btnArea" align="center">
         <input type="submit" value="送出"/>
         <input type="hidden" name="action" value="insert">
         <input type="reset" name="cancel" id="cancel" value="重填">
      </div>
      <br/>
</form>
</TD>
</TR>
</Table>
</div>
</body>
</html>