<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"/>
<form action="../MemberServlet">
	<div id="fb-root"></div>
	<script>
		//原始的寫法----
		//   function statusChangeCallback(response) {
		//     console.log('statusChangeCallback');
		//     console.log(response);

		//     if (response.status === 'connected') {

		//       testAPI();
		//     } else {
		//       document.getElementById('status').innerHTML = 'Please log ' +
		//         'into this app.';
		//     }
		//   }

		//   function checkLoginState() {
		//     FB.getLoginStatus(function(response) {
		//       statusChangeCallback(response);
		//     });
		//   }

		//   window.fbAsyncInit = function() {
		//   FB.init({
		//     appId      : '1319189648197282',
		//     cookie     : true,  // enable cookies to allow the server to access 
		//                         // the session
		//     xfbml      : true,  // parse social plugins on this page
		//     version    : 'v2.9' // use graph api version 2.8
		//   });

		//   FB.getLoginStatus(function(response) {
		//     statusChangeCallback(response);
		//   });

		//   };

		//   (function(d, s, id) {
		//     var js, fjs = d.getElementsByTagName(s)[0];
		//     if (d.getElementById(id)) return;
		//     js = d.createElement(s); js.id = id;
		//     js.src = "//connect.facebook.net/zh_TW/sdk.js";
		//     fjs.parentNode.insertBefore(js, fjs);
		//   }(document, 'script', 'facebook-jssdk'));

		//   function testAPI() {
		//     console.log('Welcome!  Fetching your information.... ');
		//     FB.api('/me', function(response) {
		//     	window.top.location.href = 
		//     		"http://www.facebook.com/connect/uiserver.php?app_id="
		//     				+ encodeURIComponent("1319189648197282") 
		//     				+ "&next=" 
		//     				+ encodeURIComponent("http://localhost:8080/maven-archetype-webapp-servlet3/index.jsp") + 
		//     				"&display=popup&perms=email,public_profile&fbconnect=1&method=permissions.request";
		//     	}
		//     )}

		//亂寫一通
		//load facebook sdk
		FB.getLoginStatus(function(response) {
			if (response.authResponse) {
				var accessToken = response.authResponse.accessToken;
				FB.api('/me', function(response) {
					checkMember(response.id, response.name, response.email,
							response.birthday);
				});
			} else {
				FB.login(function(response) {
					if (response.authResponse) {
						FB.api('/me', function(response) {
							checkMember(response.id, response.name,
									response.email, response.birthday);
						});
					} else {
						alert('登入失敗!');
					}
				}, {
					scope : 'id,name,email,user_birthday'
				});
			}
		});

		window.fbAsyncInit = function() {
			FB.init({
				appId : '1319189648197282',
				cookie : true,
				xfbml : true,
				version : 'v2.9'
			});
		};
		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, "script", "facebook-jssdk"));

		function checkMember(memberName, email, password, phone, birthday,address) {
			$.ajax({
				url : 'register.jsp',

				type : 'POST',

				data : {
					memberName : memberName,
					email : email,
					password : "password",
					phone : phone,
					birthday : birthday,
					address : address
				},

				dateType : 'html',
			})

		}
	</script>
</form>
</head>
<body>
	<!-- <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"> -->
	<!-- </fb:login-button> -->
	<button onClick="checkMember()">登入facebook</button>
	<div id="status"></div>
</body>
</html>