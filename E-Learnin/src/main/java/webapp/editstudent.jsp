<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #171415;
            margin: 0;
            padding: 0;
            background-image: url('searchstudent.jpg');
            color: white;
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

        h2 {
            color: #171415;
        }

        .form {
            font-size: 16px;
            line-height: 1.6;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Student Details</h2>
        <%
            String id = request.getParameter("id");

     
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java54", "root", "root");
            String s = "SELECT * FROM Addstudent WHERE id=?";
            PreparedStatement p = cn.prepareStatement(s);
            p.setString(1,id);
            ResultSet r = p.executeQuery();

            if (r.next()) {
        %>
                <div class="form">
                    <form action="update.jsp" method="post">
                        <input type="hidden" name="id" value="<%= r.getString("id") %>">
                        
                        <label for="Name">Name:</label>
                        <input type="text" name="Name" value="<%= r.getString("Name") %>" required>

                        <label for="email">Email:</label>
                        <input type="email" name="Email" value="<%= r.getString("Email") %>" required>

                        <label for="dob">DOB:</label>
                        <input type="date" name="Dob" value="<%= r.getString("Dob") %>" required>

                        
                        <label for="Course">Course:</label>
                        <input type="text" name="Course" value="<%= r.getString("Course") %>" required>

                        <label for="Duration">Duration:</label>
                        <input type="text" name="Duration" value="<%= r.getString("Duration") %>" required>

                        <input type="submit" value="Update">
                    </form>
                </div>
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