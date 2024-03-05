<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #171415;
            color: white;
            margin: 0;
            padding: 0;
            background-image: url('searchstudent.jpg');
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            color: #171415;
        }

        h2 {
            color: #4CAF50;
        }

        p {
            margin-bottom: 20px;
        }

        .button-container {
            text-align: center;
        }

        .ok-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Student Details</h2>

        <%
            String id = request.getParameter("id");
            String Name = request.getParameter("Name");
            String Email = request.getParameter("Email");
            String Dob = request.getParameter("Dob");
            
            String Course = request.getParameter("Course");
            String Duration = request.getParameter("Duration");

           
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java54", "root", "root");

                String updateQuery = "UPDATE Addstudent SET Name=?,  Dob=?,Email=?,  Course=?, Duration=? WHERE id=?";
                PreparedStatement p = cn.prepareStatement(updateQuery);
                p.setString(1, Name);
            
                p.setString(2, Dob);
                p.setString(3, Email);

                p.setString(4, Course);
                p.setString(5, Duration);
                p.setString(6, id);

                int i= p.executeUpdate();
        %>
                <p>
                    <% if (i > 0) {
                    	%>
                        Student details updated successfully.
                    <% }
                    else {
                    	%>
                        Error updating student details.
                    <% }
                    %>
                </p>
<a href="adminindex.html">Main page</a>
                <div class="button-container">
                    <button class="ok-button" onclick="location.href='Searchstudent.jsp?id=<%= id %>'">OK</button>
                </div>
        <%
            cn.close();
        %>
    </div>
</body>
</html>