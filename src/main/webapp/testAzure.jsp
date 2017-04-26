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
<br>
<input type="submit" value="go">
</form>

<form action="PhoneTest">
memberPhone: <input type="text" name="memberPhone">
<input type="submit" value="go">
<br>
</form>

<!--     <Resource name="jdbc/cloudteam3" auth="Container"  -->
<!--     		  driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"  -->
<!--     		  maxActive="20" maxIdle="10" maxWait="-1"  -->
<!--     		  password="$pc27856395" type="javax.sql.DataSource"  -->
<!--     		  url="jdbc:sqlserver://peter00.database.windows.net:1433;Database=Team3"  -->
<!--     		  username="pc811218@peter00"/> -->
    		  
<!--     <Resource name="jdbc/localteam3" auth="Container"  -->
<!--     		  driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"  -->
<!--     		  maxActive="20" maxIdle="10" maxWait="-1"  -->
<!--     		  password="sa123456" type="javax.sql.DataSource"  -->
<!--     		  url="jdbc:sqlserver://localhost:1433;Database=Team3"  -->
<!--     		  username="sa"/> -->



</body>
</html>