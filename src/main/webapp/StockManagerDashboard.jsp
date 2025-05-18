<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ReportPackage.ReportModel" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="StockOrderManagement.StockOrderModel" %>
<%@ page import="StockOrderManagement.StockOrderControl" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="StockOrderManagement.DBconnection" %>
<%@ page import = "UserPackage.UserModel" %>

<%
    
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return; 
    }

    
    UserModel loggedInUser = (UserModel) session.getAttribute("user");
    if (!"stock manager".equals(loggedInUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/Homepage.jsp");
        return; 
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>TechNest · Stock Manager</title>

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <!-- FontAwesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        :root {
            --dark: #343a40;
            --accent: #ffcc00;
            --light-bg: #f4f6f9;
        }

        body {
            background-color: var(--light-bg);
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        
        header {
            background: var(--dark);
            color: #fff;
            padding: 1.2rem 0;
            box-shadow: 0 3px 10px rgba(0,0,0,.05);
        }
        header h1 {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
        }

        
        .action-card {
            border: none;
            border-radius: 12px;
            transition: transform .2s ease, box-shadow .2s ease;
            cursor: pointer;
        }
        .action-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 20px rgba(0,0,0,.1);
            text-decoration: none;
        }
        .action-card .card-body {
            text-align: center;
            padding: 2.5rem 1.5rem;
        }
        .action-card i {
            font-size: 2.2rem;
            color: var(--dark);
            margin-bottom: .8rem;
        }
        .action-card h5 {
            font-weight: 700;
            color: var(--dark);
            margin-bottom: .2rem;
        }

        
        .widget {
            background-color: #fff;
            padding: 1.5rem 2rem;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,.05);
            color: #444;
        }
        .widget-title {
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--dark);
            position: relative;
        }
        .widget-title::after {
            content: "";
            width: 45px;
            height: 4px;
            background: var(--accent);
            position: absolute;
            left: 0;
            bottom: -6px;
            border-radius: 2px;
        }
        .text-warning { color: #ffc107!important; font-weight: 700; }
        .text-danger  { color: #dc3545!important; font-weight: 700; }
    </style>
</head>
<body>
    
    <header>
        <div class="container d-flex align-items-center justify-content-between">
            <h1><i class="fas fa-warehouse mr-2"></i>TechNest · Stock Manager</h1>
                <%
                   
                    if (session.getAttribute("user") != null) {
                %>
                    <a href="LogoutServlet" class="btn btn-danger logout-button">Logout</a>
                <%
                    } else {
                    	
                %>
                
                     <a href="user/login.jsp" class="btn btn-primary">Login</a>
                <%
                    }
                %>
        </div>
    </header>

    <main class="container py-5">
        <!-- Action buttons as cards -->
        <div class="row text-center mb-5">
            <div class="col-sm-6 col-lg-4 mb-4">
                <a href="GetAllStockServlet" class="card action-card h-100">
                    <div class="card-body">
                        <i class="fas fa-box-open"></i>
                        <h5>Stock Management</h5>
                        <p class="small text-muted mb-0">View &amp; manage inventory</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-lg-4 mb-4">
                <a href="GetAllSupplierServlet" class="card action-card h-100">
                    <div class="card-body">
                        <i class="fa-solid fa-boxes-packing"></i>
                        <h5>Supplier Management</h5>
                        <p class="small text-muted mb-0">Suppliers &amp; contacts</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-lg-4 mb-4 mx-sm-auto">
                <a href="StockOrdersServlet" class="card action-card h-100">
                    <div class="card-body">
                        <i class="fas fa-shopping-cart"></i>
                        <h5>Stock Orders</h5>
                        <p class="small text-muted mb-0">Create &amp; track orders</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-lg-4 mb-4 mx-sm-auto">
                <a href="StockCusOrderViewServlet" class="card action-card h-100">
                    <div class="card-body">
                        <i class="fas fa-shipping-fast"></i>
                        <h5>Customer Orders</h5>
                        <p class="small text-muted mb-0">Manage &amp; Ship Customer orders</p>
                    </div>
                </a>
            </div>
        </div>


    </main>

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>