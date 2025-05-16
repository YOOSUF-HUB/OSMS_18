<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%
    String username = (String) session.getAttribute("loggedInUsername");
    String role = (String) session.getAttribute("loggedInUserRole");

    if (username == null || !role.equals("salesrepresentative")) {
        response.sendRedirect("login.jsp");
        return; // Always add return after redirect in JSP
    }
%>
 --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sales Rep - TechNest</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        

        .widget {
            padding: 1rem;
            background-color: #ffffff;
            border-radius: 0.5rem;
            box-shadow: 0 0.25rem 0.75rem rgba(0, 0, 0, 0.05);
        }

        .widget-title {
            font-weight: 600;
            color: #495057;
            margin-bottom: 1rem;
        }

        .navbar-brand i {
            font-weight: bold;
            font-size: 1.2rem;
            color: #264093;
        }

        .table thead th {
            background-color: #e9ecef;
        }

        .tab-content {
            padding: 1rem;
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-top: none;
        }

        .divider {
            margin: 2rem 0;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="SalesRepDashboard.jsp">
            <img src="image/Tech-Color.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
            <i class="logotext">TechNest</i>
        </a>
        <button class="navbar-toggler order-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item"><a class="nav-link active" href="SalesRepDashboard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllStockServlet?view=sales">Product</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Link</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#"><strong>John Doe</strong></a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#">Profile</a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#">Logout</a></li>
            </ul>

            <div class="dropdown d-none d-lg-block">
                <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                    John Doe
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><a class="dropdown-item" href="#">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<div class="container-fluid px-4">
    <div class="d-flex justify-content-between align-items-center my-4">
        <h3 class="mb-0">Dashboard</h3>
        <div>
            <button type="button" class="btn btn-secondary me-2" onclick="window.location.href ='CustomerManagement/addCustomer.jsp'">
                <i class="bi bi-person-plus"></i> Add Customer
            </button>
            <button type="button" class="btn btn-primary" onclick="window.location.href ='OrderManagement/addOrder.jsp'">
                <i class="bi bi-cart-plus"></i> Place Order
            </button>
        </div>
    </div>

    <div class="row justify-content-center my-4">
        <div class="col-md-5 mx-2">
            <div class="widget">
                <h5 class="widget-title">Stock Overview</h5>
                <p>Total Items: <strong>150</strong></p>
                <p>Low Stock: <strong class="text-warning">15</strong></p>
                <p>Out of Stock: <strong class="text-danger">5</strong></p>
            </div>
        </div>
        <div class="col-md-5 mx-2">
            <div class="widget text-center">
                <h5 class="widget-title">Customer Info</h5>
                <p>Total Customers: <strong>15</strong></p>
                <img src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Customer" width="50" class="mt-2">
            </div>
        </div>
    </div>

    <hr class="divider">

    <div class="mb-5">
        <h4>Today’s Orders</h4>
        <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle text-center">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Business Name</th>
                    <th>Product</th>
                    <th>Business Location</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>#001</td>
                    <td>ABC Traders</td>
                    <td>Laptop</td>
                    <td>Colombo</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
                    type="button" role="tab" aria-controls="nav-home" aria-selected="true">Motherboard</button>
            <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile"
                    type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</button>
            <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact"
                    type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
            <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled"
                    type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" disabled>Disabled</button>
        </div>

        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <p>Motherboard product details go here.</p>
            </div>
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                <p>User profile information here.</p>
            </div>
            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                <p>Contact information here.</p>
            </div>
            <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab">
                <p>This tab is disabled.</p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>
