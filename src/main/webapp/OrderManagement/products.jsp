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
    <title>Product Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
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
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .form-label {
            font-weight: 500;
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
                <li class="nav-item"><a class="nav-link " href="GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link active" href="GetAllStockServlet?view=sales">Product</a></li>
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


<div class="container">
    <div class="card p-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
        <div class="d-flex align-items-center">
        	<i class="bi bi-motherboard me-2" style="font-size: 2em;"></i>
        	<h3 class="mb-0"><strong>Products</strong></h3>
        </div>
	        
	    </div>
	    <%-- <div>
			<div class="nav nav-pills nav-justified" id="nav-tab" role="tablist">
	            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
	                    type="button" role="tab" aria-controls="nav-home" aria-selected="true">Motherboard</button>
	            <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile"
	                    type="button" role="tab" aria-controls="nav-profile" aria-selected="false">CPU</button>
	            <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact"
	                    type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
	            <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled"
	                    type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" disabled>Disabled</button>
        	</div>
        	<div class="tab-content" id="nav-tabContent">
	            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
	                <div class="table-responsive">
			            <table class="table table-bordered table-striped align-middle">
			                <thead class="table-dark">
			                    <tr>
			                        <th>Stock ID</th>
			                        <th>Product Name</th>
			                        <th>Product Model</th>
			                        <th>Product Manufacturer</th>
			                        <th>Quantity</th>
			                        <th>Selling Price</th>
			                        <th>Description</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <c:choose>
			                        <c:when test="${empty allStocks}">
			                            <tr>
			                                <td colspan="8" class="text-center text-muted">No products available.</td>
			                            </tr>
			                        </c:when>
			                        <c:otherwise>
			                            <c:forEach var="stock" items="${allStocks}">
			                            	<c:if test="${stock.item_name == 'Motherboard'}">
				                                <tr>
				                                    <td>${stock.item_id}</td>
				                                    <td>${stock.item_name}</td>
				                                    <td>${stock.item_model}</td>
				                                    <td>${stock.item_manufacturer}</td>
				                                    <td>${stock.quantity}</td>
				                                    <td>${stock.selling_price}</td>
				                                    <td>
				                                        <div class="text-truncate" style="max-width: 200px;" title="${stock.description}">
				                                            ${stock.description}
				                                        </div>
				                                    </td>
				                                </tr>
			                                </c:if>
			                            </c:forEach>
			                        </c:otherwise>
			                    </c:choose>
			                </tbody>
			            </table>
			        </div>
	            </div>
	            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
	                <div class="table-responsive">
			            <table class="table table-bordered table-striped align-middle">
			                <thead class="table-dark">
			                    <tr>
			                        <th>Stock ID</th>
			                        <th>Product Name</th>
			                        <th>Product Model</th>
			                        <th>Product Manufacturer</th>
			                        <th>Quantity</th>
			                        <th>Selling Price</th>
			                        <th>Description</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <c:choose>
			                        <c:when test="${empty allStocks}">
			                            <tr>
			                                <td colspan="8" class="text-center text-muted">No products available.</td>
			                            </tr>
			                        </c:when>
			                        <c:otherwise>
			                            <c:forEach var="stock" items="${allStocks}">
			                            	<c:if test="${stock.item_name == 'CPU'}">
				                                <tr>
				                                    <td>${stock.item_id}</td>
				                                    <td>${stock.item_name}</td>
				                                    <td>${stock.item_model}</td>
				                                    <td>${stock.item_manufacturer}</td>
				                                    <td>${stock.quantity}</td>
				                                    <td>${stock.selling_price}</td>
				                                    <td>
				                                        <div class="text-truncate" style="max-width: 200px;" title="${stock.description}">
				                                            ${stock.description}
				                                        </div>
				                                    </td>
				                                </tr>
			                                </c:if>
			                            </c:forEach>
			                        </c:otherwise>
			                    </c:choose>
			                </tbody>
			            </table>
			        </div>
	            </div>
	            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
	                <p>Contact information here.</p>
	            </div>
	            <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab">
	                <p>This tab is disabled.</p>
	            </div>
       	 	</div>	
	    </div> --%>
	    
        <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Stock ID</th>
                        <th>Product Name</th>
                        <th>Product Model</th>
                        <th>Product Manufacturer</th>
                        <th>Quantity</th>
                        <th>Selling Price</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty allStocks}">
                            <tr>
                                <td colspan="8" class="text-center text-muted">No products available.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="stock" items="${allStocks}">
                                <tr>
                                    <td>${stock.item_id}</td>
                                    <td>${stock.item_name}</td>
                                    <td>${stock.item_model}</td>
                                    <td>${stock.item_manufacturer}</td>
                                    <td>${stock.quantity}</td>
                                    <td>${stock.selling_price}</td>
                                    <td>
                                        <div class="text-truncate" style="max-width: 200px;" title="${stock.description}">
                                            ${stock.description}
                                        </div>
                                    </td>
                                  
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
