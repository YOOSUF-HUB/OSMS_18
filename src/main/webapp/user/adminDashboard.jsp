<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="ReportPackage.ReportModel" %>
<%@ page import="UserPackage.UserModel" %>
<%@ page import="UserPackage.ViewUsersServlet" %>
<%@ page import="UserPackage.UserController" %>
<%@ page import="UserPackage.IUser" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return;
    }
    UserModel loggedInUser = (UserModel) session.getAttribute("user");
    if (!"system admin".equals(loggedInUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/Homepage.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>System Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

   
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f1f3f5;
            margin: 0;
        }
        .dashboard-header {
            background-color: #343a40;
            color: white;
            padding: 1.5rem;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
        }
        .sidebar {
            background-color: #212529;
            height: 100vh;
            padding: 2rem 1rem;
            color: white;
            position: fixed;
            width: 220px;
        }
        .sidebar h2 {
            font-size: 1.6rem;
            margin-bottom: 2rem;
            text-align: center;
        }
        .sidebar ul {
            list-style: none;
            padding-left: 0;
        }
        .sidebar ul li {
            margin-bottom: 1rem;
        }
        .sidebar ul li a {
            color: #ced4da;
            text-decoration: none;
            display: block;
            padding: 0.5rem 1rem;
            border-radius: 0.25rem;
            transition: 0.3s;
        }
        .sidebar ul li a:hover {
            background-color: #495057;
            color: #ffffff;
        }
        .sidebar a.btn {
            width: 100%;
            margin-top: 2rem;
        }
        .main-content {
            margin-left: 240px;
            padding: 2rem;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            background-color: #ffffff;
        }
        .card-title {
            font-size: 1.25rem;
            color: #343a40;
            font-weight: 600;
        }
        .card-text {
            font-size: 2rem;
            color: #28a745;
            font-weight: bold;
        }
        .alert {
            margin-top: 2rem;
        }

        
        @media (max-width: 768px) {
            .sidebar {
                position: relative;
                height: auto;
                width: 100%;
            }
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row no-gutters">
        <div class="col-md-2 sidebar">
            <h2>System Admin</h2>
            <ul>
                <li><a href="../ViewUsersServlet"><i class="fas fa-users"></i> User Management</a></li>
                <li><a href="#"><i class="fas fa-chart-bar"></i> Dashboard</a></li>
            </ul>
            <%
                if (session.getAttribute("user") != null) {
            %>
            <a href="../LogoutServlet" class="btn btn-danger">Logout</a>
            <%
                } else {
            %>
            <a href="login.jsp" class="btn btn-primary">Login</a>
            <%
                }
            %>
        </div>

        <div class="col-md-10 main-content">
            <div class="dashboard-header">
                <h1>Welcome to the System Admin Dashboard</h1>
            </div>

            <%
                IUser userController = new UserController();
                List<UserModel> users = userController.getAllUsers();
                int totalUserCount = userController.getTotalUserCount();
                request.setAttribute("totalUsers", totalUserCount);
            %>

           
            <div class="row mt-4">
                <div class="col-md-6 offset-md-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5 class="card-title">Total Active Users</h5>
                            <p class="card-text"><c:out value="${totalUsers}" default="0"/></p>
                        </div>
                    </div>
                </div>
            </div>

           
            <% if (session.getAttribute("message") != null) { %>
                <div class="alert alert-success">
                    <%= session.getAttribute("message") %>
                    <% session.removeAttribute("message"); %>
                </div>
            <% } %>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>
