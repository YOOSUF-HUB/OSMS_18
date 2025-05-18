<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../user/loginAuthentication.jsp" %>


   
<%
        String name = loggedInUser.getName(); 
%>
      


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sales Rep - TechNest</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        

        .widget {
            padding: 1rem;
            background-color: #ffffff;
            border-radius: 0.5rem;
            box-shadow: 0 0.25rem 0.75rem rgba(0, 0, 0, 0.05);
        }

        .widget-title {
            font-weight: 600;
            color: #495057;
            margin-bottom: 1rem;
        }

        .navbar-brand i {
            font-weight: bold;
            font-size: 1.2rem;
            color: #264093;
        }

        .tab-content {
            padding: 1rem;
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-top: none;
        }

        .divider {
            margin: 2rem 0;
        }
        
        .SalesRepBtn{
        	height: 10rem;
        }
        
        .SalesRepBtn i{
        	font-size:3rem;
        }
        
        .btn-primary{
        	background-color: #3674B5;
        }
        .btn-primary:hover{
        	background-color: #578FCA;
        	transform: translateY(-4px);
            box-shadow: 0 6px 20px rgba(0,0,0,.1);
        }
        .custom-title {
        	color: #3674B5;
        }
        .custom-title2{
        	color: #3674B5;
        	font-size: 2rem;
        	font-weight: 600;
        }
        
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-dark-subtle shadow-sm">
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
                <li class="nav-item"><a class="nav-link active" href="SalesRepDashboardServlet">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllOrdersServlet">Order</a></li>
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
                <li class="nav-item d-lg-none"><a class="nav-link" href="#"><em><strong><%= name %></strong></em></a></li>
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



<div class="container-fluid px-4">
    <div class="d-flex justify-content-center align-items-center my-4">
        <h2 class="mb-0 custom-title2"><em>Sales Representative Dashboard</em></h2>
    </div>
    <div class="row justify-content-center my-4">
		<button type="button" class="btn btn-primary me-md-3 col-md-4 SalesRepBtn" onclick="window.location.href ='AddOrderServlet'">
                <i class="bi bi-cart-plus"></i>
                <h3>Place Order</h3>
        </button>
        <button type="button" class="btn btn-secondary mt-md-0 mt-2  col-md-4 SalesRepBtn" onclick="window.location.href ='CustomerManagement/addCustomer.jsp'">
                <i class="bi bi-person-plus"></i>
                <h3>Add Customer</h3>
        </button>
	</div>

	
	<!-- 
    <div class="row justify-content-center my-4">
        <div class="col-md-5 mx-2">
            <div class="widget">
                <h5 class="widget-title">Stock Overview</h5>
                <p>Total Items: <strong>150</strong></p>
                <p>Low Stock: <strong class="text-warning">15</strong></p>
                <p>Out of Stock: <strong class="text-danger">5</strong></p>
            </div>
        </div>
        <div class="col-md-5 mx-2">
            <div class="widget text-center">
                <h5 class="widget-title">Customer Info</h5>
                <p>Total Customers: <strong>15</strong></p>
                <img src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Customer" width="50" class="mt-2">
            </div>
        </div>
    </div> -->

    <hr class="divider">

  
    
    <div class="container card p-4">
    <div class="d-flex justify-content-between align-items-center mb-2 custom-title">
    	<h4><strong><em>Today's Orders</em></strong></h4>
    	<h4><strong><em>${currentDate2}</em></strong></h4>
    </div>
    <div class="table-responsive" style="max-height: 250px; overflow-y: auto;">
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Order ID</th>               
                        <th>Item Name</th>
                        <th>Total Price</th>
                        <th>Business Name</th>
                        <th>City</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${allOrders}">
                    <c:set var="odate2" value="${fn:substring(order.odate, 0, 10)}"/>
					<c:if test="${odate2 == currentDate2}">
                        <tr>
                            <td>${order.orderid}</td>
                            <td>${order.itemname}</td>
                            <td>$ ${order.total_price}</td>
                            <td>${order.bname}</td>
                            <td>${order.city}</td>
                        </tr>
                    </c:if> 
                    </c:forEach>
                </tbody>
            </table>
   		</div>
   		</div>

 
    <!-- <div class="container">
	    <div class="nav nav-tabs" id="product-tabs">
	        <button class="nav-link active" id="core-tab" data-bs-toggle="tab" data-bs-target="#core">
	            Core Components
	        </button>
	        <button class="nav-link" id="peripherals-tab" data-bs-toggle="tab" data-bs-target="#peripherals">
	            Peripherals
	        </button>
	        <button class="nav-link" id="cooling-tab" data-bs-toggle="tab" data-bs-target="#cooling">
	            Casing & Cooling
	        </button>
	        <button class="nav-link" id="networking-tab" data-bs-toggle="tab" data-bs-target="#networking" >
	            Networking
	        </button>
	        <button class="nav-link" id="power-tab" data-bs-toggle="tab" data-bs-target="#power" >
	            Power & Connectivity
	        </button>
	    </div>
	
	    <div class="tab-content mt-3" id="product-tab-content">
	        <div class="tab-pane fade show active" id="core">
	            <p>Core components product details go here.</p>
	        </div>
	        <div class="tab-pane fade" id="peripherals">
	            <p>Peripheral product details go here.</p>
	        </div>
	        <div class="tab-pane fade" id="cooling">
	            <p>Casing and cooling products go here.</p>
	        </div>
	        <div class="tab-pane fade" id="networking">
	            <p>Networking products go here.</p>
	        </div>
	        <div class="tab-pane fade" id="power">
	            <p>Power and connectivity products go here.</p>
	        </div>
	    </div>
	</div> -->
    
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>
