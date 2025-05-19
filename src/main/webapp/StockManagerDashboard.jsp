<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
    request.setAttribute("requiredRole", "stock manager");
%>
<%@ include file="../user/loginAuthentication.jsp" %>


   
<%
        String name = loggedInUser.getName(); 
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> <!-- Bootstrap 4 -->
    
    

    <style>
        :root {
            --dark: #343a40;
            --accent: #ffcc00;
            --light-bg: #f4f6f9;
			--bg: linear-gradient(135deg, #374785, #04b5b5);
        }

        body {
            background-color: var(--light-bg);
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        
        header {
            background: var(--bg);
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
        
		.btn-white {
		    background-color: white;
		    color: black;
		}
		.btn-white:hover {
		    background-color: #ff7575;
		    color: black;
		}
    </style>
</head>
<body>
    
<header>
    <div class="container py-3 d-flex align-items-center justify-content-between">
        
        <!-- Left: Logo and Title -->
        <div class="d-flex align-items-center">
            <img src="image/Tech-White.png" alt="Company Logo" style="height: 40px; margin-right: 0.75rem;" />
            <h1 class="h5 mb-0 text-white fw-semibold">TechNest: Stock Manager</h1>
        </div>

        <!-- Right: User Dropdown and Logout -->
        <div class="d-flex align-items-center gap-3">

			<div class="d-none d-lg-block me-3">
			    <span class="text-white fw-semibold">
			        <i class="bi bi-person-circle me-1"></i>
			        <em><%= name %></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    </span>
			</div>

            <!-- Logout Button -->
            <a href="LogoutServlet" class="btn btn-outline-light">
                <i class="bi bi-box-arrow-right me-1"></i>&nbsp;&nbsp;&nbsp; Logout
            </a>
        </div>
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