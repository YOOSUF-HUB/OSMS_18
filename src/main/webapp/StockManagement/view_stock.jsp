<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <th>Stock ID</th>
                    <th>Product Name</th>
                    <th>Product Model</th>
                    <th>Product Manufacturer</th>
                    <th>Purchase Price</th>
                    <th>Selling Price</th>
                    <th>Quantity</th>
                    <th>Date</th>
                    <th>Comments/Preferences</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="stock" items="${allStocks}">
                    <tr>
                    	<td>${stock.item_id}</td>
                        <td>${stock.item_name}</td>
                        <td>${stock.item_model}</td>
                        <td>${stock.item_manufacturer}</td> <!-- Product Manufacturer -->
                        <td>${stock.unit_cost}</td> <!-- Supplier ID (from model) -->
                        <td>${stock.selling_price}</td>
                        <td>${stock.quantity}</td>
                        <td>${stock.date_added}</td> <!-- Comments or Preferences -->
                        <td>${stock.comments}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        <a href="../StockManagerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
