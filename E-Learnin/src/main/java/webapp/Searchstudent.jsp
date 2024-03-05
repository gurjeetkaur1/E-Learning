<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #171415;
            margin: 0;
            padding: 0;
            background-image: url('searchstudent.jpg');
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }

        .details {
            font-size: 16px;
            line-height: 1.6;
        }

        .edit-button {
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
        <h2>Student Details</h2>
        <%
            String id = request.getParameter("id");
        
        
        
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java54", "root", "root");
            String s = "SELECT * FROM Addstudent WHERE id=?";
            PreparedStatement p = cn.prepareStatement(s);
            p.setString(1, id);
            ResultSet r = p.executeQuery();

            if (r.next()) {
        %>
                <div class="details">
                    <strong>id:</strong> <%= r.getString("id") %><br><br>
                    <strong>Name:</strong> <%= r.getString("Name") %><br><br>
                    <strong>Email:</strong> <%= r.getString("Email") %><br><br>
                    <strong>DOB:</strong> <%= r.getString("Dob") %><br><br>
                   
                    <strong>Course:</strong> <%= r.getString("Course") %><br><br>
                    <strong>Duration:</strong> <%= r.getString("Duration") %><br><br>
                </div>
                
                <button class="edit-button" onclick="location.href='editstudent.jsp?id=<%= id %>'">Edit</button>
        <%
            } else {
        %>
                <p>No student found with id <%= id %>.</p>
        <%
            }
        %>
    </div>
</body>
</html>