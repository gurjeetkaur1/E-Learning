<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String UserName= request.getParameter("UserName");
String Password= request.getParameter("Password");

Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/java54","root","root");
String s="update  login set UserName=? where Password=?";
PreparedStatement p=cn.prepareStatement(s);

p.setString(1,UserName);
p.setString(2,Password);

int i=p.executeUpdate();
if(i>0){
	response.sendRedirect("login.html");
}

%>
</body>
</html>