<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- include the meta name="viewport" tag as well for proper responsive behavior in mobile devices. -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Place Order</title>
	
	<!-- Include Bootstrap’s CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
	
</head>
<body>
	
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid ">
        <a class="navbar-brand " href="#"> <!-- navbar-brand class is used to highlight your brand name or logo -->
	      <img src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
	      <i>Company Name</i>
	    </a>
        <button class="navbar-toggler order-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
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
                <li class="nav-item">
                <a class="nav-link disabled" aria-disabled="true">Link</a>
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

        
      </div>
    </nav>

    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center my-3">
            <h4 class="mb-3">Place Order</h4>
        </div>

        <div class="container-fluid">
            <form action="AddOrderServlet" class="row g-3" method="post">
                
                <div class="col-md-12">
                  <label for="bname" class="form-label">Business Name (Customer)</label>
                  <select id="bname" class="form-select" name="cusID">
                  			<option selected>Choose...</option>
					    <c:forEach var="customer" items="${allCustomers}">
					        <option value="${customer.id}">${customer.bname}</option> <!-- displaying business name but getting customer id as value -->
					    </c:forEach>
				  </select>
                </div>
                <div class="col-md-12">
                    <label for="product" class="form-label">Product</label>
                    <select id="product" class="form-select" name="itemID">
                      <option selected>Choose...</option>
                      <c:forEach var="stock" items="${allStock}">
					        <option value="${stock.item_id}">${stock.item_name}</option> <!-- displaying itemName but getting  id as value -->
					    </c:forEach>
                    </select>
                </div><div class="col-md-2">
                  <label for="qty" class="form-label">Quantity</label>
                  <input type="number" class="form-control" id="qty" name="qty">
                </div>

                <div class="col-12">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <button type="" class="btn btn-secondary">Cancel</button>
                </div>
              </form>
        </div>
        
    </div>



	<!-- Include Bootstrap’s CSS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>