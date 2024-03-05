<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updated Record</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String Name=request.getParameter("Name");
	
	
	String Dob=request.getParameter("Dob");
	String Email=request.getParameter("Email");
	String Course=request.getParameter("Course");
	String Duration=request.getParameter("Duration");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java54","root","root");
	String s="update Addstudent set id=?,Name=?,email=?,Dob=?,Course=?,Duration=? where id="+id;
	PreparedStatement p=cn.prepareStatement(s);
	p.setString(1,id);
	p.setString(2,Name);
	
	p.setString(3,Dob);
	p.setString(4,Email);
	p.setString(5,Course);
	p.setString(6,Duration);
	int i=p.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("adminindex.html");
	}
%>
</body>
</html>