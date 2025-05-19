<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Update Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-card {
            max-width: 500px;
            margin: auto;
            margin-top: 80px;
            padding: 30px;
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.05);
        }
        .form-title {
            font-weight: 600;
            margin-bottom: 24px;
        }
    </style>
</head>
<body>

<div class="form-card">
    <div class="form-title">Update Order Status</div>

    <form action="UpdateCusOrderServlet" method="post">
        <!-- Hidden fields for form submission -->
        <input type="hidden" name="order_id" value="${order.orderid}">
        <input type="hidden" name="qty" value="${order.qty}">

        <!-- Display Order ID -->
        <div class="mb-3">
            <label class="form-label">Order ID</label>
            <input type="text" class="form-control" value="${order.orderid}" readonly>
        </div>

        <!-- Display Quantity -->
        <div class="mb-3">
            <label class="form-label">Quantity</label>
            <input type="text" class="form-control" value="${order.qty}" readonly>
        </div>
        
         <div class="mb-3">
            <label class="form-label">Item Name</label>
            <input type="text" class="form-control" value="${order.itemname}" readonly>
        </div>

        <!-- Select Order Status -->
        <div class="mb-3">
            <label for="order_status" class="form-label">Order Status</label>
            <select id="order_status" name="order_status" class="form-select" required>
                <option value="Pending" ${order.ostatus == 'Pending' ? 'selected' : ''}>Pending</option>
                <option value="Shipped" ${order.ostatus == 'Shipped' ? 'selected' : ''}>Shipped</option>
                <option value="Cancelled" ${order.ostatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
            </select>
        </div>

        <!-- Submit & Cancel buttons -->
        <div class="d-flex justify-content-between mt-4">
            <a href="StockCusOrderViewServlet" class="btn btn-outline-secondary">Cancel</a>
            <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>

</body>
</html>
