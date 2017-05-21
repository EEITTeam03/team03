<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${ctx}/Cancel">
	<input type="text" name="reservNo">
	<input type="hidden" name="action" value="cancel">
	<input type="submit" value="go">
</form>

<div>
	<div>
		<div>
			<ul>
			<li>ccccc</li>
			<li>asssss</li>
			<li id="vvv">kkkkkkk</li>
			</ul>
			<form action="">
				<input type="text" value="1000" name="qq" id="pp">
				<input type="text" value="2000" name="ww">
				<input type="text" value="3000" name="ee" id="inin">
				<input type="text" value="4000" name="rr">
			</form>
		</div>
	</div>
</div>
	<!-- jQuery -->
	<script src="${ctx}/js/jquery.js"></script>
<script type="text/javascript">
//var aa = $("div").find("#vvv");
// var aa = $("div").find("li");
// console.log(aa);
// console.log(aa[0]);
// console.log(aa.html());
// console.log(aa.text());

 var inputs = $('input');
 console.log(inputs);
var find = inputs.find('input[value*="4"]');
 console.log(find);
 console.log(find.length);
var form = $('form');
var find2 = form.find('input[value*="000"]');
console.log(find2);
console.log(find2.length);

for(var i=0;i<find2.length;i++) {
	var nn = find2[i].value;
	console.log(nn);
}

// var lam = $("input[value='4000'] ~ input");
var lam = $("#pp ~ input");
console.log(lam);
</script>
</body>
</html>