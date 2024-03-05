<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<style>
body  {
  background-image: url('delete.jpg');
   background-size: cover; 
   
}
</style>

<%
int id=Integer.parseInt(request.getParameter("id"));


Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/java54","root","root");
String s="delete from Addstudent where id="+id;
PreparedStatement p=cn.prepareStatement(s);
int i=p.executeUpdate(s);
if(i>0)
{
	response.sendRedirect("adminindex.html");
}

%>
</body>
</html>