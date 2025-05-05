<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Stock</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
        .actions-column {
            text-align: right; /* Align text (and inline elements like buttons) to the right */
        }
        
        


    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Current Stock Inventory</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Product Manufacturer</th>
                    <th>Purchase Price</th>
                    <th>Selling Price</th>
                    <th>Quantity</th>
                    <th>Comments/Preferences</th>
                    <th class="actions-column">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="stockItem" items="${stockList}">
                    <tr>
                        <td>${stockItem.id}</td>
                        <td>${stockItem.productName}</td>
                        <td>${stockItem.brand}</td> <!-- Product Manufacturer -->
                        <td>${stockItem.model}</td> <!-- Supplier ID (from model) -->
                        <td>${stockItem.purchasePrice}</td>
                        <td>${stockItem.sellingPrice}</td>
                        <td>${stockItem.quantity}</td>
                        <td>${stockItem.preferences}</td> <!-- Comments or Preferences -->
                        <td class="actions-column">
                            <div class="d-inline-flex">
                                <a href="update_stock.jsp?id=${stockItem.id}" class="btn btn-sm btn-primary mr-1">Update</a>
                                <a href="delete_stock.jsp?id=${stockItem.id}" class="btn btn-sm btn-danger">Delete</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty stockList}"> 
                    <tr><td colspan="9" class="text-center">No stock items found.</td></tr>
                </c:if>
            </tbody>
        </table>
        <a href="../StockManagerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
