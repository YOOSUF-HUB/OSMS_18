<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@ include file="../user/loginAuthentication.jsp" %>


   
<%
        String name = loggedInUser.getName(); 
%> 
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Orders</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
	<!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    
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
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        }
        .table {
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .form-label {
            font-weight: 500;
        }
		.btn-primary{
        	background-color: #3674B5;
        }
        .btn-primary:hover{
        	background-color: #578FCA;
        }
        .custom-title {
        	color: #3674B5;
        }
        
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-dark-subtle shadow-sm mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="SalesRepDashboardServlet">
            <img src="image/Tech-Color.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
            <i class="logotext">TechNest</i>
        </a>
        <button class="navbar-toggler order-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item"><a class="nav-link" href="SalesRepDashboardServlet">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllStockServlet?view=sales">Product</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Link</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#"><strong><em><%= name %></em></strong></a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#">Profile</a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="LogoutServlet">Logout</a></li>
            </ul>

            <div class="dropdown d-none d-lg-block">
                <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                    <em><%= name %></em>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">
	<div class="stock-count-box mb-3">
		        <i class="bi bi-boxes"></i>
		        TOTAL ORDERS: ${fn:length(allOrders)}
    </div>
    <div class="card p-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
        	<div class="d-flex align-items-center custom-title">
        		<i class="bi bi-box-seam-fill me-2" style="font-size: 2em;"></i>
	        	<h3 class="mb-0"><strong>Orders</strong></h3>
	        </div>
	        
	        
	        <div>
				<button type="button" class="btn btn-primary" onclick="window.location.href ='AddOrderServlet'">
	                <i class="bi bi-cart-plus"></i> Place Order
	            </button>
	        </div>
	    </div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Order ID</th>               
                        <th>Item Name</th>            
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Order Date</th>
                        <th>Order Status</th>
                        <th>Business Name</th>
                        <th>City</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${allOrders}">
                        <tr>
                            <td>${order.orderid}</td>
                            <td>${order.itemname}</td>
                            <td>${order.qty}</td>
                            <td>$ ${order.total_price}</td>
                            <td>${order.odate}</td>
                            <td>${order.ostatus}</td>
                            <td>${order.bname}</td>
                            <td>${order.city}</td>
                            <td>
                                <div class="d-flex gap-2 justify-content-center">
                                    <form action="UpdateOrderServlet" method="get">
                                        <input type="hidden" name="orderId" value="${order.orderid}">
                                        <button type="submit" class="btn btn-sm btn-outline-primary">Update</button>
                                    </form>
                                    <form action="DeleteOrderServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this order?');">
                                        <input type="hidden" name="orderId" value="${order.orderid}">
                                        <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:if test="${param.updateSuccess == 'true'}">
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
      <div id="successToast" class="toast align-items-center text-bg-success border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
          <div class="toast-body">
            Order updated successfully!
          </div>
          <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
      </div>
    </div>
</c:if>

<c:if test="${param.updateSuccess == 'false'}">
  <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="errorToast" class="toast align-items-center text-bg-danger border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">
           Failed to update Order. <a href="UpdateCustomerServlet?customerId=${param.customerId}">Please try again.</a>      
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</c:if>


<c:if test="${param.deleteSuccess == 'true'}">
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
      <div id="successToast" class="toast align-items-center text-bg-success border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
          <div class="toast-body">
            Order deleted successfully!
          </div>
          <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
      </div>
    </div>
</c:if>

<c:if test="${param.deleteSuccess == 'false'}">
  <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="errorToast" class="toast align-items-center text-bg-danger border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">
           Failed to delete Order.      
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</c:if>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>

</body>
</html>
