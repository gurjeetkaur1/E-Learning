<%@page import="java.sql.*" %>
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
	String cid=request.getParameter("cid");
	String cname=request.getParameter("cname");
	String duration=request.getParameter("duration");
	String fees=request.getParameter("fees");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/java54","root","root");
	String s="insert into addnewcoursse values(?,?,?,?)";
	PreparedStatement p=cn.prepareStatement(s);
	p.setString(1, cid);
	p.setString(2, cname);
	p.setString(3, duration);
	p.setString(4, fees);
	
	int i=p.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("adminindex.html");
	}
	
	%>
</body>
</html>