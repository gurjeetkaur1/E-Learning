<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Students Data</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 0;
            background-image: url('searchstudent.jpg');
            background-size: cover; 
           background-position: center;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #E6E6FA;
        }
        button{
        top: 10px;
        left: 100px;
        background-color:black;
        color:white;
        }
    </style>
</head>
<body>

    <h2>All Students Data</h2>

    <table cellpadding="5" cellspacing="5" border="1">
        <tr bgcolor="#faebd7">
            <td><b>id</b></td>
            <td><b>Name</b></td>
            <td><b>Dob</b></td>
            <td><b>Email</b></td>
           
            <td><b>Course</b></td>
            <td><b>Duration</b></td>
        </tr>

        <% 
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/java54","root","root");
            String s ="SELECT * FROM Addstudent";
            PreparedStatement p = cn.prepareStatement(s);
            ResultSet r = p.executeQuery();
            
            while(r.next()){
            	
        %>
            <tr bgcolor="#E6E6FA">
                <td><%=r.getString("id") %></td>
                <td><%=r.getString("Name") %></td>
                <td><%=r.getString("Dob") %></td>
                <td><%=r.getString("Email") %></td>
                 <td><%=r.getString("Course") %></td>
                <td><%=r.getString("Duration") %></td>
            </tr>
        <%
            }
        %>
    </table>
     <p></p>
    
    <button onClick="window.print();"> PRINT</button>
    <br>
    
    <button><a href="adminindex.html">Main page</a></button>
 
    
   
    

</body>
</html>