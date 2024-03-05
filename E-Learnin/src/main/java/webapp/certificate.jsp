<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Certificate</title>
</head>

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
	<body >
	<center>
	
	<h1> <a href="index.html" class="nav-item nav-link">
<button>Admin page</button><side></a>
	
	
	
	<font size="6">
	<h1>E-Learning </h1></font>
	<font size="7"><h2 style="color:grey;"><u><i>Certificate Of Completion</i></u></h2></font>
	<font size="15">
	<p>Awarded to <b><%=r.getString("Name") %>    </b>
	 for successfully completing <%=r.getString("Duration")%> months <%=r.getString("Course") %> course from e-learning platform.</p><br>
	 <br>
	</font>
		</center>
		<pre><font size="8">     With Regards</font></pre>
       </body>
       </html>
 		<%
		}
%>
</body>
</html>