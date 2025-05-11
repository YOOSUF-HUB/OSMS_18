<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Stock Orders</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }

        .container {
            max-width: 1800px;
            margin: auto;
            padding: 20px;
        }

        .table {
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .table thead {
            background-color: #343a40;
            color: #fff;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 6px 14px;
            font-size: 0.875rem;
            border-radius: 6px;
        }

        .search-bar-container {
            max-width: 500px;
            margin: 0 auto 30px auto;
        }

        #searchInput {
            border-radius: 0.25rem 0 0 0.25rem;
            padding: 10px 12px;
            font-size: 1rem;
        }

        #searchBtn {
            border-radius: 0 0.25rem 0.25rem 0;
            padding: 6px 16px;
            font-size: 1rem;
        }

        @media (max-width: 768px) {
            .table th, .table td {
                font-size: 0.75rem;
            }
            h2 {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2>Stock Order Records</h2>

    <div class="input-group mb-4 search-bar-container">
        <input type="text" id="searchInput" class="form-control" placeholder="Search...">
        <div class="input-group-append">
            <button class="btn btn-outline-primary" type="button" id="searchBtn">Search</button>
        </div>
    </div>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Total Price</th>
                <th>Order Status</th>
                <th>Expected Delivery</th>
                <th>Payment Status</th>
                <th>Notes</th>
                <th>Received Date</th>
                <th>Invoice #</th>
                <th>Supplier ID</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty orders}">
                    <tr>
                        <td colspan="13" class="text-center text-muted">No stock orders available.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="order" items="${orders}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${order.order_id}</td>
                            <td>${order.order_date}</td>
                            <td>${order.quantity_ordered}</td>
                            <td>${order.unit_price}</td>
                            <td>${order.total_price}</td>
                            <td>${order.order_status}</td>
                            <td>${order.expected_delivery_date}</td>
                            <td>${order.payment_status}</td>
                            <td>${order.notes}</td>
                            <td>${order.received_date}</td>
                            <td>${order.invoice_number}</td>
                            <td>${order.supplier_id}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    
	<a href="StockOrderManagement/CreateStockOrder.jsp" class="btn btn-primary mt-3">Add New Stock Order</a>
    <a href="./StockManagerDashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
    function filterTable() {
        const input = document.getElementById("searchInput").value.toUpperCase();
        const rows = document.querySelectorAll("table tbody tr");

        rows.forEach(row => {
            const cells = row.querySelectorAll("td");
            const match = Array.from(cells).some(cell =>
                cell.textContent.toUpperCase().includes(input)
            );
            row.style.display = match ? "" : "none";
        });
    }

    document.getElementById("searchBtn").addEventListener("click", filterTable);
</script>

</body>
</html>
