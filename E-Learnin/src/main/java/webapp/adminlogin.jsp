<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
       
        String username= request.getParameter("username");
        String Password= request.getParameter("Password");
        
        
        
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/java54","root","root");
       String s="select * from admin where Username =? and password=?";
       PreparedStatement p=cn.prepareStatement(s);
     
      p.setString(1,username);
      p.setString(2,Password);
      
 ResultSet r=p.executeQuery();
      if(r.next())
      {
    	  response.sendRedirect("adminindex.html");
      }else 
      {
    	  response.sendRedirect("adminerror.html");
      } 
     
      
      
%>

</body>
</html>