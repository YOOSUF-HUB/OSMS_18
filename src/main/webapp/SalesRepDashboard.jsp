<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    request.setAttribute("requiredRole", "sales representative");
%>
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
            /* background-color: #f8f9fa; */
            background: linear-gradient(to right, #e3f2fd, #f2fdff, #f1f0ff);
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
        	height: 12rem;
        	transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .SalesRepBtn:hover{
        	transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0,0,0,.1);
        }
        
        .SalesRepBtn i{
        	font-size:3rem;
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
                <li class="nav-item d-lg-none"><a class="nav-link" href="#"><em><strong><%= name %></strong></em></a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="LogoutServlet">Logout</a></li>
            </ul>

            <div class="dropdown d-none d-lg-block">
            	
                <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                    <em><%= name %></em>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
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

 

    
    <c:if test="${param.addSuccess == 'true'}">
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
      <div id="successToast" class="toast align-items-center text-bg-success border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
          <div class="toast-body">
            Order placed successfully!
          </div>
          <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
      </div>
    </div>
</c:if>
    
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>
