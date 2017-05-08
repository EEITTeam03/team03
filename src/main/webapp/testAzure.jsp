<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="testDS">testDS (Azure) (JNDI)</a>
<br>
<a href="ModelTest">test model</a>
<br>
<form action="ModelTest">
memberNo:<input type="text" name="memberNo">
<input type="submit" value="go">
<br>
</form>

<form action="PhoneTest">
memberPhone: <input type="text" name="memberPhone">
<input type="submit" value="go">
<br>
</form>

<a href="${ctx}/index.jsp">test root</a>

<h1>${ctx}</h1>

</body>
</html>