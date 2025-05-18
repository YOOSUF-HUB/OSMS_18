<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Order Status</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>

<div class="container mt-5">
    <h3>Update Order Status</h3>

    <form action="UpdateCusOrderServlet" method="post">
        <!-- Hidden input for order ID -->
        <input name="order_id" value="${order.orderid}" />
        
        <input name="qty" value="${order.qty}" />

        <div class="form-group">
            <label for="order_status">Order Status</label>
            <select id="order_status" name="order_status" class="form-control" required>
                <option value="Pending"   ${order.ostatus == 'Pending' ? 'selected' : ''}>Pending</option>
                <option value="Shipped" ${order.ostatus == 'Shipped' ? 'selected' : ''}>Shipped</option>
                <option value="Cancelled" ${order.ostatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary mt-3">Update Status</button>
        <a href="StockCusOrderViewServlet" class="btn btn-secondary mt-3">Cancel</a>
    </form>
</div>

</body>
</html>
