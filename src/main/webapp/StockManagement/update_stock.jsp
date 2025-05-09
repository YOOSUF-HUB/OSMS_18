<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="onlineStockManagement.stockModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Stock</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<%

	int item_id = Integer.parseInt(request.getParameter("item_id"));
	String item_name  = request.getParameter("item_name");
	String item_model  = request.getParameter("item_model");
	String item_manufacturer = request.getParameter("item_manufacturer");
	int quantity  = Integer.parseInt(request.getParameter("quantity"));  
	float unit_cost = Float.parseFloat(request.getParameter("unit_cost"));
	float selling_price = Float.parseFloat(request.getParameter("selling_price"));
	String date_added  = request.getParameter("date_added");
	String description = request.getParameter("description");
%>

<div class="container mt-5">
    <h2>Update Stock Item</h2>

    <form action="../updateStockServlet" method="post">
        <div class="form-group">
            <label for="item_id">Stock ID:</label>
            <input type="text" class="form-control" id="item_id" name="item_id" value="<%= item_id %>" readonly>
        </div>

        <div class="form-group">
            <label for="item_name">Product Name:</label>
            <input type="text" class="form-control" id="item_name" name="item_name" value="<%= item_name %>" required>
        </div>

        <div class="form-group">
            <label for="item_model">Product Model:</label>
            <input type="text" class="form-control" id="item_model" name="item_model" value="<%= item_model %>">
        </div>

        <div class="form-group">
            <label for="item_manufacturer">Manufacturer:</label>
            <input type="text" class="form-control" id="item_manufacturer" name="item_manufacturer" value="<%= item_manufacturer %>">
        </div>

        <div class="form-group">
            <label for="unit_cost">Purchase Price:</label>
            <input type="number" step="0.01" class="form-control" id="unit_cost" name="unit_cost" value="<%= unit_cost %>">
        </div>

        <div class="form-group">
            <label for="selling_price">Selling Price:</label>
            <input type="number" step="0.01" class="form-control" id="selling_price" name="selling_price" value="<%= selling_price %>" required>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value="<%= quantity %>" required>
        </div>

        <div class="form-group">
            <label for="date_added">Date:</label>
            <input type="date" class="form-control" id="date_added" name="date_added" value="<%= date_added %>" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="4"><%= description %></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <a href="../GetAllStockServlet" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
