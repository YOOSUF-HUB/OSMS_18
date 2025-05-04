<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Stock</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
        .btn-primary {
            padding: 20px, 10px;
        }

        .btn-secondary {
            padding: 20px, 10px; 
            margin-left: 10px; 
        }
        
        .form-add-stock{
        	margin-top:40px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Add New Stock Item</h2>
        <form action="process_add_stock.jsp" method="post" class="form-add-stock">
        
            <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" class="form-control" id="productName" name="productName" required>
            </div>
            
			<div class="form-group">
                <label for="brand">Product Model:</label>
                <input type="text" class="form-control" id="model" name="model">
            </div>
            
            <div class="form-group">
                <label for="brand">Product Manufacturer:</label>
                <input type="text" class="form-control" id="manufacturer" name="manufacturer">
            </div>
            
            <div class="form-group">
                <label for="model">Supplier ID:</label>
                <input type="text" class="form-control" id="ID" name="ID">
            </div>
            
            <div class="form-group">
                <label for="purchasePrice">Purchase Price:</label>
                <input type="number" class="form-control" id="purchasePrice" name="purchasePrice" step="0.01">
            </div>
            
            <div class="form-group">
                <label for="sellingPrice">Selling Price:</label>
                <input type="number" class="form-control" id="sellingPrice" name="sellingPrice" step="0.01" required>
            </div>
            
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="0" required>
            </div>
            
			<div class="form-group">
			    <label for="preferences">Comments or Preferences:</label>
			    <textarea class="form-control" id="preferences" name="preferences" rows="4"></textarea>
			</div>
            
            <button type="submit" class="btn btn-primary mr-2">Add Stock</button>
            <a href="../StockManagerDashboard.jsp" class="btn btn-secondary">Cancel</a>
            
        </form>
        <div class="mb-3"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
