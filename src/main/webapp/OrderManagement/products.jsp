<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
		.navbar-brand i {
            font-weight: bold;
            font-size: 1.2rem;
            color: #264093;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        }
        .table {
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm mb-4">
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
                <li class="nav-item"><a class="nav-link" href="SalesRepDashboard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link " href="GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link active" href="GetAllStockServlet?view=sales">Product</a></li>
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

<!-- Content -->
<div class="container">
    <div class="card p-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
	        <h3 class="mb-0">Products</h3>
	    </div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Stock ID</th>
                        <th>Product Name</th>
                        <th>Product Model</th>
                        <th>Product Manufacturer</th>
                        <th>Quantity</th>
                        <th>Selling Price</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty allStocks}">
                            <tr>
                                <td colspan="8" class="text-center text-muted">No products available.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="stock" items="${allStocks}">
                                <tr>
                                    <td>${stock.item_id}</td>
                                    <td>${stock.item_name}</td>
                                    <td>${stock.item_model}</td>
                                    <td>${stock.item_manufacturer}</td>
                                    <td>${stock.quantity}</td>
                                    <td>${stock.selling_price}</td>
                                    <td>
                                        <div class="text-truncate" style="max-width: 200px;" title="${stock.description}">
                                            ${stock.description}
                                        </div>
                                    </td>
                                  
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
