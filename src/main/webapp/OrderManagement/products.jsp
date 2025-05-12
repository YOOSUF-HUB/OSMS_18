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
        <a class="navbar-brand" href="#">
            <img src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24">
            <i>TechNest</i>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 navbar-nav-scroll">
                <li class="nav-item"><a class="nav-link" href="SalesRepDashboard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link active fw-bold" href="GetAllStockServlet">Product</a></li>
            </ul>
            <div class="dropdown d-none d-lg-block">
                <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" id="userDropdown" data-bs-toggle="dropdown">John Doe</a>
                <ul class="dropdown-menu dropdown-menu-end">
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
        <h4 class="mb-3 text-primary">Products</h4>
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
                        <th>Actions</th>
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
                                    <td>
                                        <div class="d-flex gap-2">
                                            <!-- Update -->
                                            <a href="StockManagement/update_stock.jsp?item_id=${stock.item_id}&item_name=${stock.item_name}&item_model=${stock.item_model}&item_manufacturer=${stock.item_manufacturer}&quantity=${stock.quantity}&selling_price=${stock.selling_price}&description=${stock.description}" class="btn btn-sm btn-outline-primary">Update</a>
                                            <!-- Delete -->
                                            <form action="DeleteStockServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this product?');">
                                                <input type="hidden" name="item_id" value="${stock.item_id}">
                                                <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
        <div class="mt-3 d-flex justify-content-between">
            <a href="StockManagement/create_stock.jsp" class="btn btn-primary">Add Product</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
