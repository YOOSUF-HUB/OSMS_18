<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file="../user/loginAuthentication.jsp" %>

   
<%
        String name = loggedInUser.getName(); 
%>
 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
        	background-color: #f8f9fa; 
        }
        .navbar-brand i {
            font-weight: bold;
            font-size: 1.2rem;
            color: #264093;
        }
        .card {
        	border-radius: 12px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05); 
        }
        .form-label { 
        font-weight: 500; 
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg bg-dark-subtle shadow-sm mb-5">
    <div class="container-fluid">
        <a class="navbar-brand" href="SalesRepDashboard.jsp">
            <img src="../image/Tech-Color.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
            <i class="logotext">TechNest</i>
        </a>
        <button class="navbar-toggler order-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item"><a class="nav-link " href="SalesRepDashboardServlet">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllStockServlet?view=sales">Product</a></li>
              
                <li class="nav-item d-lg-none"><a class="nav-link" href="#"><strong><em><%= name %></em></strong></a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="LogoutServlet">Logout</a></li>
            </ul>

            <div class="dropdown d-none d-lg-block">
                <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                    John Doe
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>


<!-- Form Container -->
<!-- Form Container -->
<!-- Form Container -->
<div class="container mt-5">
    <div class="card p-4">
        <h4 class="mb-4 text-primary">Update Order</h4>
        <form action="UpdateOrderServlet" method="post" class="row g-3">

            <!-- Hidden Order ID -->
            <input type="hidden" name="orderId" value="${order.orderid}">

            <div class="col-md-12">
                <label class="form-label">Business Name (Customer)</label>
                <input class="form-control-plaintext" value="${order.bname}" readonly>
            </div>

            <div class="col-md-12">
                <label class="form-label">Product</label>
                <input class="form-control-plaintext" value="${order.itemname}" data-price="${allstock.selling_price}" readonly>
                
               
                <label class="form-label mt-3">Price per unit</label>
				<c:forEach var="stock" items="${allStock}">
				    <c:if test="${stock.item_name == order.itemname}">
				        <input type="text" id="priceInput" class="form-control-plaintext" value="$ ${stock.selling_price}" readonly />
				    </c:if>
				</c:forEach>
            </div>

            <div class="col-md-4">
                <label class="form-label">Quantity:</label>
                <input type="number" class="form-control" id="qty" name="qty" min="1" value="${order.qty}" required oninput="calculateTotal()">
            </div>

            <div class="col-md-4">
                <label class="form-label">Total Price:</label>
                <input type="text" class="form-control" id="total_price" name="total_price" value="${order.total_price}" readonly>
            </div>

            <div class="col-12 d-flex gap-2 mt-4">
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="#" class="btn btn-secondary" onclick="window.history.back()">Cancel</a>
            </div>

        </form>
    </div>
</div>

<script>
	function calculateTotal() {
	    const priceInput = document.getElementById("priceInput").value.replace(/[^\d.]/g, "");
	    const price = parseFloat(priceInput) || 0;
	    const qty = parseFloat(document.getElementById("qty").value) || 0;
	    document.getElementById("total_price").value = (qty * price).toFixed(2);
	}


	document.addEventListener("DOMContentLoaded", function () {
	    document.getElementById("qty").addEventListener("input", calculateTotal);
	    calculateTotal(); // initialize on load
	});
</script>

</body>
</html>
