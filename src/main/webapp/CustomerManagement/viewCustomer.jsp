<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- include the meta name="viewport" tag as well for proper responsive behavior in mobile devices. -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Customer Page</title>
	
	
	<!-- Include Bootstrap’s CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
	
</head>
<body>
	
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid ">
        <a class="navbar-brand " href="#"> <!-- navbar-brand class is used to highlight your brand name or logo -->
	      <img src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
	      <i>TechNest</i>
	    </a>
        <button class="navbar-toggler order-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                <a class="nav-link " aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">Order</a>
                </li>
                <li class="nav-item">
                <a class="nav-link active" href="#">Customer</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">Product</a>
                </li>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Link
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
                </li>

                <!-- Show username here in mobile -->
                <li class="nav-item d-lg-none">
                    <a class="nav-link" href="#"><strong>John Doe</strong></a>
                </li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#">Profile</a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#">Logout</a></li>
            </ul>

            <!-- User menu (desktop view only, hover to show) -->
            <div class="dropdown d-none d-lg-block">
                <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                 John Doe
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><a class="dropdown-item" href="#">Logout</a></li>
                </ul>
            </div>

            
        </div>

        <!-- <div class="order-sm-1">
            <button  type="button"     >Place Order</button>
        </div> -->
        
      </div>
    </nav>
    
    
    

    <div class="container  mt-4">
        <h4 class="mb-2">Customer</h4>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Customer ID</th>               
                        <th>Customer Name</th>            
                        <th>Business Name</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>City</th>
                    </tr>
                </thead>

                <tbody>
                	<c:forEach var="customer" items="${allCustomers}">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.cname}</td>
                        <td>${customer.bname}</td>
                        <td>${customer.number}</td>
                        <td>${customer.address}</td>
                        <td>${customer.city}</td>
                    </tr>          
                    </c:forEach>         
                </tbody>
                
            </table>

        </div>

    </div>



	<!-- Include Bootstrap’s CSS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
