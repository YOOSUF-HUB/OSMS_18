<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Orders</title>

    <!-- Bootstrap 4 (matching your stock UI) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font‑Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    <style>
        /* ------------ Generic look (borrowed from stock page) ------------ */
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }
        .table {
            background-color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: visible !important;
            position: relative;
        }
        .table thead {
            background-color: #343a40;
            color: #fff;
        }
        .table thead th {
            text-align: center;
            vertical-align: middle;
            font-size: 0.9rem;
        }
        .table tbody td {
            vertical-align: middle;
            text-align: center;
            font-size: 0.95rem;
        }
        .table tbody tr {
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .table tbody tr:hover {
            background-color: #fcefc5;
            transform: scale(1.03);
        }
        .container {
            max-width: 1600px;
            margin: auto;
            padding: 20px;
            overflow: visible !important;
            position: relative;
        }
        .orders-count-box {
            background-color: #dedede;
            font-size: 1.2rem;
            color: #45484a;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 12px;
            margin-bottom: 20px;
            border-radius: 10px;
        }
        .orders-count-box i {
            font-size: 1.4rem;
        }
        .badge-primary { background-color: #45484a; color: #fff; }
        .badge-warning { background-color: #ffc107; color: #212529; }
        .badge-success { background-color: #28a745; }
        .badge-info    { background-color: #17a2b8; }

        .btn-primary {
            background-color: #45484a;
            border: none;
        }
        .btn-primary:hover { background-color: #000; }

        /* Search bar */
        .search-bar-container {
            max-width: 400px;
            margin: 0 auto 30px auto;
        }
        #searchInput {
            border-radius: 0.25rem 0 0 0.25rem;
            padding: 10px 12px;
            font-size: 1rem;
            border: 1px solid #ced4da;
        }
        #searchBtn {
            border-radius: 0 0.25rem 0.25rem 0;
            padding: 6px 16px;
            font-size: 1rem;
        }
        @media (max-width: 768px) {
            .table th, .table td { font-size: 0.8rem; }
            h2 { font-size: 1.4rem; }
        }
    </style>
</head>
<body>

<!-- Simple top‑bar (can be replaced with your own navbar) -->
<nav class="navbar navbar-light bg-light shadow-sm mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="SalesRepDashboard.jsp"><i class="fas fa-home"></i> TechNest</a>
    </div>
</nav>

<div class="container mt-4">
    <h2>Customer Orders</h2>

    <!-- total orders count -->
    <div class="orders-count-box">
        <i class="fas fa-shopping-cart"></i>
        TOTAL ORDERS: ${fn:length(allOrders)}
    </div>

    <!-- action buttons -->
    <div class="mb-3 d-flex justify-content-between align-items-center">
        <div class="search-bar-container input-group">
            <input type="text" id="searchInput" class="form-control" placeholder="Search By Order ID or Business Name...">
            <div class="input-group-append">
                <button class="btn btn-outline-primary" type="button" id="searchBtn">Search</button>
            </div>
        </div>
    </div>

    <!-- orders table -->
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Order ID</th>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Order Date</th>
            <th>Status</th>
            <th>Business Name</th>
            <th>City</th>
            <th>Total Price</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="orders-table">
        <c:choose>
            <c:when test="${empty allOrders}">
                <tr>
                    <td colspan="10" class="text-center text-muted">No orders available.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="order" items="${allOrders}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}.</td>
                        <td><span class="badge badge-primary">CUS.ORD_${order.orderid}</span></td>
                        <td>${order.itemname}</td>
                        <td>${order.qty}</td>
                        <td>${order.odate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${order.ostatus eq 'Pending'}"><span class="badge badge-warning">Pending</span></c:when>
                                <c:when test="${order.ostatus eq 'Shipped'}"><span class="badge badge-success">Shipped</span></c:when>
                                <c:otherwise><span class="badge badge-danger">${order.ostatus}</span></c:otherwise>
                            </c:choose>
                        </td>
                        <td>${order.bname}</td>
                        <td>${order.city}</td>
                        <td><span class="badge badge-pill badge-warning"><fmt:formatNumber value="${order.total_price}" type="number" maxFractionDigits="2" minFractionDigits="2"/></span></td>
                        <td>
                            <a href="UpdateCusOrderServlet?orderId=${order.orderid}" class="btn btn-sm btn-outline-primary">Update Status</a>
<%--                             <form action="DeleteOrderServlet" method="post" style="display:inline-block;" onsubmit="return confirm('Delete order?');">
                                <input type="hidden" name="orderId" value="${order.orderid}">
                                <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                            </form> --%>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <div id="noOrdersMessage" class="alert alert-info" style="display:none;" role="alert">
        No orders found matching your search criteria.
    </div>

    <a href="StockManagerDashboard.jsp" class="btn btn-danger mt-3">Back to Dashboard</a>
</div>

<!-- JS libraries -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
// Search functionality (ID + Business Name)
function searchOrders() {
    var filter = document.getElementById("searchInput").value.toUpperCase();
    var tr = document.getElementById("orders-table").getElementsByTagName("tr");
    var found = false;

    for (var i = 0; i < tr.length; i++) {
        var tdId = tr[i].getElementsByTagName("td")[1];
        var tdBiz = tr[i].getElementsByTagName("td")[6];
        var txtId = tdId ? tdId.textContent || tdId.innerText : "";
        var txtBiz = tdBiz ? tdBiz.textContent || tdBiz.innerText : "";
        if (txtId.toUpperCase().includes(filter) || txtBiz.toUpperCase().includes(filter)) {
            tr[i].style.display = "";
            found = true;
        } else {
            tr[i].style.display = "none";
        }
    }
    document.getElementById("noOrdersMessage").style.display = found ? "none" : "block";
}

document.getElementById("searchBtn").addEventListener("click", searchOrders);
</script>

</body>
</html>
