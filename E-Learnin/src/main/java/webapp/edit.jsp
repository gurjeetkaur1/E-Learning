<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Records</title>
</head>
<style>
body  {
  background-image: url('loginerror.jpg');
   background-size: cover; 
   
}
</style>





<body>
<%
	String id=request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/java54","root","root");
	String s="select * from Addstudent where id="+id;
	PreparedStatement p=cn.prepareStatement(s);
	ResultSet r=p.executeQuery();
	while(r.next())
	{
%>
	<html>
	<body>
	<h1>Update Records</h1>
	<form action="updatejs.jsp">
	<table>
	<tr>
	<td></td><td><input type="hidden" name="id" value=<%=r.getString("id") %>></td>
	</tr>
	<tr>
	<td>Name</td><td><input type="text" name="Name" value=<%=r.getString("Name") %>></td>
	</tr>
	
	
	<tr>
	<td>Date of birth</td><td><input type="text" name="Dob" value=<%=r.getString("Dob") %>></td>
	</tr>
	<tr>
	<td>Email</td><td><input type="text" name="Email" value=<%=r.getString("Email") %>></td>
	</tr>
	<tr>
	<td>Course Name</td><td><input type="text" name="Course" value=<%=r.getString("Course") %>></td>
	</tr>
	<tr>
	<td>Duration</td><td><input type="text" name="Duration" value=<%=r.getString("Duration") %>></td>
	</tr>
	
	<tr>
	<td></td><td><input type="submit" value="Update"></td>
	</tr>
		</table>
		</form>
       </body>
       </html>
 		<%
		}
%>
</body>
</html>