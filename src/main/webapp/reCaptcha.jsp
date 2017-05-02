<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.*" %>
<%@page import="java.io.*" %>
<%
   String g_recaptcha_response = (String)request.getParameter("g-recaptcha-response");
   String secret="6Lejoh8UAAAAAAA9lx-unzLZ2krF2YXC346LSOJi";
   URL dest = new URL("https://www.google.com/recaptcha/api/siteverify?secret="+secret+"&response="+g_recaptcha_response);
   URLConnection yc = dest.openConnection();
   BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
   String inputLine;
   String webdata="";
   String msg;

   while ((inputLine = in.readLine()) != null)
       		webdata=webdata+inputLine;
   in.close();
   if(webdata.indexOf("true")>0)
	   msg="Pass";
   else if(webdata.indexOf("missing-input-response")>0)
	   msg="請勾選我不是機器人";   
   else 
	   msg="Fail";
   out.println(msg);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>