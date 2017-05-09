<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>administrator Login</title>
</head>
<body>
	<form action="Loggin.do" method="post" >  
 帳號:<input type="text" name="userid" size='40' value='${param.userid}' />
 <br>　　<small><Font color='red' >${ErrorMsgKey.AccountEmptyError}</Font></small>
 <br/><br/>  
 密碼:<input type="text" name="password" size='40' value='${param.password}'  />
 <br>　　<small><Font color='red'>${ErrorMsgKey.PasswordEmptyError}</Font></small>
 <br/>
 　　<small><Font color='red'>${ErrorMsgKey.LoginError}</Font></small>
 <br/>
 <br/>
　<input type="submit" value="登入"/>
 <br/>
 </form>
 
 <div id="status">
</div>
 
 <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
 
 <script>
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '1787564341572824',
          xfbml      : true,
          version    : 'v2.0'
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/sdk.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
      
      function statusChangeCallback(response) {
          console.log('statusChangeCallback');
          console.log(response);
          // The response object is returned with a status field that lets the
          // app know the current login status of the person.
          // Full docs on the response object can be found in the documentation
          // for FB.getLoginStatus().
          if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
          } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            document.getElementById('status').innerHTML = 'Please log ' +
              'into this app.';
          } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            document.getElementById('status').innerHTML = 'Please log ' +
              'into Facebook.';
          }
        }

        // This function is called when someone finishes with the Login
        // Button.  See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState() {
          FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
          });
        }

        // Here we run a very simple test of the Graph API after login is
        // successful.  See statusChangeCallback() for when this call is made.
        function testAPI() {
          console.log('Welcome!  Fetching your information.... ');
          FB.api('/me', function(response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
              'Thanks for logging in, ' + response.name + '!';
          });

        }
</script>

 
</body>
</html>