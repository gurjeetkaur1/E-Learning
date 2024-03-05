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

String Username= request.getParameter("Username");
String password= request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/java54","root","root");
String s="update  admin set password=? where Username=?";
PreparedStatement p=cn.prepareStatement(s);

p.setString(2,Username);
p.setString(1,password);

int i=p.executeUpdate();
if(i>0){
	response.sendRedirect("admin.html");
}

%>
</body>
</html>