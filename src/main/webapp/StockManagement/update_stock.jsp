<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Stock</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    

</head>
<body>
    <div class="container mt-5">
    
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
        <h2>Add New Stock Item</h2>
        <form action="../updateStockServlet" method="post" class="form-add-stock">
        
            <div class="form-group">
                <label for="productName">Stock ID:</label>
                <input type="text" class="form-control" id="item_id" value=<%=item_id %> name="item_id" readonly>
            </div>
        
            <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" class="form-control" id="item_name" value=<%=item_name %> name="item_name" required>
            </div>
            
			<div class="form-group">
                <label for="brand">Product Model:</label>
                <input type="text" class="form-control" id="item_model" value=<%=item_model %> name="item_model">
            </div>
            
            <div class="form-group">
                <label for="brand">Product Manufacturer:</label>
                <input type="text" class="form-control" id="item_manufacturer" value=<%=item_manufacturer %> name="item_manufacturer">
            </div>
            
            <div class="form-group">
                <label for="purchasePrice">Purchase Price:</label>
                <input type="number" class="form-control" id="unit_cost" value=<%=unit_cost %> name="unit_cost" step="0.01">
            </div>
            
            <div class="form-group">
                <label for="sellingPrice">Selling Price:</label>
                <input type="number" class="form-control" id="selling_price" value=<%=selling_price %> name="selling_price" step="0.01" required>
            </div>
            
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" class="form-control" id="quantity" value=<%=quantity %> name="quantity" value="0" required>
            </div>
            
			<div class="form-group">
                <label for="quantity">Date:</label>
                <input type="date" class="form-control" id="date_added" value=<%=date_added %> name="date_added" value="0" required>
            </div>
            
			<div class="form-group">
			    <label for="preferences">Description:</label>
			    <textarea class="form-control" id="description" name="description" rows="4"><%= description %></textarea>
			</div>
            
            <button type="submit" class="btn btn-primary mr-2">Update</button>
            <a href="../GetAllStockServlet" class="btn btn-secondary">Cancel</a>
            
        </form>
        <div class="mb-3"></div>
 

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>