<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Order</title>

    <!-- Bootstrap 4 (same stack as other update pages) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    <style>
        body{background:#f8f9fa;font-family:'Segoe UI',Tahoma,Verdana,sans-serif;}
        .container{max-width:900px;margin:auto;padding:20px;}
        .card{border-radius:12px;box-shadow:0 4px 20px rgba(0,0,0,.05);}
        h4{font-weight:600;color:#343a40;}
        label{font-weight:500;}
        .btn-primary{background:#45484a;border:none;} .btn-primary:hover{background:#000;}
    </style>
</head>
<body>


	<nav class="navbar navbar-light bg-light shadow-sm mb-4">
	    <div class="container-fluid">
	        <a class="navbar-brand"><i class="fas fa-home"></i> TechNest</a>
	    </div>
	</nav>

	<div class="container">
	    <div class="card p-4">
	        <h4 class="mb-4 text-primary"><i class="fas fa-edit"></i> Update Order</h4>
	
	        
	        <form action="UpdateCusOrderServlet" method="post" class="row g-3">
	            <!-- Hidden Order ID -->
	            <input type="hidden" name="orderId" value="${order.orderid}">
	
	            <!-- Business name (editable now) -->
	            <div class="col-md-6">
	                <label class="form-label" for="bname">Business Name (Customer)</label>
	                <input type="text" class="form-control" id="bname" name="bname" value="${order.bname}" required>
	            </div>
	
	            <!-- City (editable) -->
	            <div class="col-md-6">
	                <label class="form-label" for="city">City</label>
	                <input type="text" class="form-control" id="city" name="city" value="${order.city}" required>
	            </div>
	
	            <!-- Product name (editable) -->
	            <div class="col-md-6 mt-3">
	                <label class="form-label" for="itemname">Product</label>
	                <input type="text" class="form-control" id="itemname" name="itemname" value="${order.itemname}" required>
	            </div>
	
	            <!-- Price per unit (editable) -->
	            <div class="col-md-6 mt-3">
	                <label class="form-label" for="priceInput">Price per unit ($)</label>
	                <input type="number" step="0.01" class="form-control" id="priceInput" name="unitPrice" value="${order.qty != 0 ? (order.total_price / order.qty) : ''}" oninput="calculateTotal()" required>
	            </div>
	
	            <!-- Quantity -->
	            <div class="col-md-4 mt-3">
	                <label class="form-label" for="qty">Quantity</label>
	                <input type="number" class="form-control" id="qty" name="qty" min="1" value="${order.qty}" oninput="calculateTotal()" required>
	            </div>
	
	            <!-- Order status -->
	            <div class="col-md-4 mt-3">
	                <label class="form-label" for="ostatus">Status</label>
	                <select id="ostatus" name="ostatus" class="form-control" required>
	                    <option value="Pending"   ${order.ostatus == 'Pending' ? 'selected':''}>Pending</option>
	                    <option value="Completed" ${order.ostatus == 'Completed' ? 'selected':''}>Completed</option>
	                    <option value="Cancelled" ${order.ostatus == 'Cancelled' ? 'selected':''}>Cancelled</option>
	                </select>
	            </div>
	
	            <!-- Order date (editable) -->
	            <div class="col-md-4 mt-3">
	                <label class="form-label" for="odate">Order Date</label>
	                <input type="date" class="form-control" id="odate" name="odate" value="${order.odate}" required>
	            </div>
	
	            <!-- Total price (auto‑calculated but still editable if user wants) -->
	            <div class="col-md-4 mt-3">
	                <label class="form-label" for="total_price">Total Price ($)</label>
	                <input type="number" step="0.01" class="form-control" id="total_price" name="total_price" value="${order.total_price}" required>
	            </div>
	
	            <div class="col-12 d-flex gap-2 mt-4">
	                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Update</button>
	                <a href="javascript:history.back()" class="btn btn-secondary">Cancel</a>
	            </div>
	        </form>
	    </div>
	</div>

<!-- JS libs -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
function calculateTotal(){
    const price = parseFloat(document.getElementById('priceInput').value) || 0;
    const qty   = parseFloat(document.getElementById('qty').value)        || 0;
    document.getElementById('total_price').value = (price * qty).toFixed(2);
}

document.addEventListener('DOMContentLoaded',calculateTotal);
</script>

</body>
</html>
