<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/le-frog/jquery-ui.css">
  
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/vader/theme.css" id="THEME_CSS"/>  -->
  
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/base/theme.css" id="THEME_CSS"/>   -->
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/dark-hive/theme.css" id="THEME_CSS"/>  -->
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/dot-luv/theme.css" id="THEME_CSS"/>  -->
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/eggplant/theme.css" id="THEME_CSS"/>  -->
  
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/excite-bike/theme.css" id="THEME_CSS"/>  -->
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/flick/theme.css" id="THEME_CSS"/>            -->
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/cupertino/theme.css" id="THEME_CSS"/>   -->
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/black-tie/theme.css" id="THEME_CSS"/> -->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/blitzer/theme.css" id="THEME_CSS"/>  
  
  
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	  $("#datepicker").datepicker({
	      changeMonth: true,
	      changeYear: true,
		  //顯示上個月日期 及下個月日期 ，但是不可選的。
	      //default:false
	      showOtherMonths : true,
	      // 設置當沒有上一個/下一個可選擇的情況下，隱藏掉相應的按鈕。（默認為不可用）
	      //配合有設定最大最小時使用
	      //default:false
	      hideIfNoPrevNext : true,
	      //設置一個最小的可選日期。可以是Date對象，或者是數字（從今天算起，例如+7），
	      //或者有效的字符串('y'代表年, 'm'代表月, 'w'代表周, 'd'代表日, 例如：'+1m +7d')。
	      minDate : "-30d",
	      //  設置一個最大的可選日期。可以是Date對象，或者是數字（從今天算起，例如+7），
	      //或者有效的字符串('y'代表年, 'm'代表月, 'w'代表周, 'd'代表日, 例如：'+1m +7d')。
	      maxDate : "+30d"
	    });
  } );
  </script>
</head>
<body>
 
<div id="datepicker"> </div>
 
 
</body>
</html>