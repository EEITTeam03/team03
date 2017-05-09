<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"/> -->
</head>
<body>
	<script type="text/javascript">
		//檢查是否連接facebook了
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			if (response.status === 'connected') {
				// 				var uid = response.authResponse.userID;
				// 				var accessToken = response.authResponse.accessToken;
				// 				login(response.authResponse.accessToken);
				FB.api('/me', function(response) {
					console.log(JSON.stringify(response));
				},{
					fields : 'id,name,email'
				});
// 				FB.api('/me', {
// 					fields : 'last_name,id,name,email'
// 				}, function(response) {
// 					console.log(response);
// 				});
			} else if (response.status === 'not_authorized') {
				console.log('已登入facebook但未登入網頁');
			} else {
				console.log("未登入Facebook");
			}
		}
		//檢查登入狀態
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
		//讀入使用此api的appid &版本
		window.fbAsyncInit = function() {
			FB.init({
				appId : '1319189648197282',
				cookie : true,
				xfbml : true, //解析這個頁面的社交套件
				version : 'v2.9'
			});
		};
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/zh_TW/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		function loginNEMI(token) {
			console.log('取得資料中...');
			//步驟一:建立XMLHttpRequest物件
			var xhr = new XMLHttpRequest();
			//步驟二:發出HTTP請求
			xhr.open("POST", "/login", true);
			//setRequestHeader()設定內容類型，因為POST要發送的資料會放在請求的本體中，所以你必須告知發送的資料類型為何，接著在send()時，將要發送的資料，作為send()的引數傳入。
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					if (JSON.parse(xhr.responseText).status === "ok")
						location.href = "${ctx}/index.jsp";
					else
						alert("something wrong!");
				}
			};
			xhr.send("token=" + token);
		}
		//scope裡面放的是要求使用者的哪些資料權限
		function fbLogin() {
			FB.login(function(response) {
				statusChangeCallback(response);
				console.log("回傳值" + response);
			}, {
				filed : 'email,user_likes',
				return_scopes : true
			});
		}
	</script>

	<button type="button" onClick="fbLogin()">你自行客製化的按鈕</button>
	<div id="status"></div>
</body>
</html>