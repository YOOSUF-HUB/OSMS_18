<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="UserPackage.UserModel" %>
<%@ page import="UserPackage.UserController" %>
<%@ page import="UserPackage.IUser" %>
<%@ include file="../user/loginAuthentication.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>System Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap 4.5.2 CSS (matching your report management) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <!-- FontAwesome 6 for icons (matching your report management) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <!-- Google Fonts Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

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
            font-weight: 600;
            font-size: 1.5rem;
        }
        .sidebar {
            background-color: #212529;
            height: 100vh;
            padding: 2rem 1rem;
            color: white;
            position: fixed;
            width: 220px;
            display: flex;
            flex-direction: column;
        }
        .sidebar h2 {
            font-size: 1.6rem;
            margin-bottom: 2rem;
            text-align: center;
            font-weight: 600;
        }
        .sidebar ul {
            list-style: none;
            padding-left: 0;
            flex-grow: 1;
        }
        .sidebar ul li {
            margin-bottom: 1rem;
        }
        .sidebar ul li a {
            color: #ced4da;
            text-decoration: none;
            display: block;
            padding: 0.6rem 1rem;
            border-radius: 0.25rem;
            font-weight: 500;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .sidebar ul li a:hover,
        .sidebar ul li a.active {
            background-color: #495057;
            color: #ffffff;
        }
        .logout-btn {
            margin-top: auto;
        }
        .logout-btn a {
            display: block;
            width: 100%;
            text-align: center;
            padding: 0.5rem 0;
            border: 1px solid #dc3545;
            border-radius: 0.25rem;
            color: #dc3545;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .logout-btn a:hover {
            background-color: #dc3545;
            color: white;
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
            padding: 2rem;
            text-align: center;
        }
        .card-title {
            font-size: 1.25rem;
            color: #343a40;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        .card-text {
            font-size: 2.5rem;
            color: #28a745;
            font-weight: 700;
        }
        .alert {
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .sidebar {
                position: relative;
                height: auto;
                width: 100%;
                flex-direction: row;
                padding: 1rem;
            }
            .sidebar h2 {
                flex: 1;
                margin-bottom: 0;
                font-size: 1.25rem;
                text-align: left;
            }
            .sidebar ul {
                display: flex;
                flex-grow: 3;
                margin: 0;
                padding: 0;
                overflow-x: auto;
                list-style: none;
            }
            .sidebar ul li {
                margin-bottom: 0;
                margin-right: 1rem;
            }
            .sidebar ul li a {
                padding: 0.5rem 0.75rem;
                font-size: 0.9rem;
            }
            .logout-btn {
                margin-top: 0;
                flex-grow: 1;
                text-align: right;
            }
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>System Admin</h2>
    <ul>
        <li><a href="../ViewUsersServlet" class="active"><i class="fas fa-users mr-2"></i> User Management</a></li>
        <li><a href="#"><i class="fas fa-chart-bar mr-2"></i> Dashboard</a></li>
    </ul>
    <div class="logout-btn">
        <a href="../LogoutServlet"><i class="fas fa-sign-out-alt mr-1"></i> Logout</a>
    </div>
</div>

<div class="main-content">
    <div class="dashboard-header">
        Welcome to the System Admin Dashboard
    </div>

    <%
        IUser userController = new UserController();
        List<UserModel> users = userController.getAllUsers();
        int totalUserCount = userController.getTotalUserCount();
        request.setAttribute("totalUsers", totalUserCount);
    %>

    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <h5 class="card-title">Total Active Users</h5>
                <p class="card-text"><c:out value="${totalUsers}" default="0"/></p>
            </div>
        </div>
    </div>

    <% if (session.getAttribute("message") != null) { %>
        <div class="alert alert-success rounded">
            <%= session.getAttribute("message") %>
            <% session.removeAttribute("message"); %>
        </div>
    <% } %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>
