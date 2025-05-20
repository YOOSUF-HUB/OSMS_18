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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>New Customer</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">

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
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            padding: 2rem;
        }
        .form-label {
            font-weight: 500;
        }
        .btn {
            min-width: 100px;
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

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg bg-dark-subtle shadow-sm mb-5">
    <div class="container-fluid">
        <a class="navbar-brand" href="SalesRepDashboardServlet">
            <img src="../image/Tech-Color.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
            <i class="logotext">TechNest</i>
        </a>
        <button class="navbar-toggler order-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item"><a class="nav-link " href="../SalesRepDashboardServlet">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="../GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="../GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="../GetAllStockServlet?view=sales">Product</a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#"><strong><em><%= name %></em></strong></a></li>
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


<!-- Form Container -->
<!-- Form Container -->
<!-- Form Container -->
<div class="container">
    <div class="card">
        <h4 class="mb-4 custom-title">Add New Customer</h4>
        <form action="../AddCustomerServlet" class="row g-3" method="post">
            <div class="col-sm-6">
                <label for="cname" class="form-label">Customer Name</label>
                <input type="text" class="form-control" id="cname" name="cname" required>
            </div>
            <div class="col-sm-6">
                <label for="bname" class="form-label">Business Name</label>
                <input type="text" class="form-control" id="bname" name="bname" required>
            </div>

            <div class="col-md-6">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="col-md-6">
                <label for="pnumber" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="pnumber" name="pnumber" required>
            </div>

            <div class="col-12">
                <label for="address" class="form-label">Business Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>
            <div class="col-md-6">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" required>
            </div>
            <div class="col-md-4">
                <label for="country" class="form-label">Country</label>
                <select class="form-control" id="country" name="country" required>
                	<option value="" disabled selected>Select a country</option>
				</select>
				<script>
				    fetch("https://restcountries.com/v3.1/all")
				        .then(res => res.json())
				        .then(data => {
				            const select = document.getElementById("country");
				            const countries = data.map(c => c.name.common).sort();
				
				            countries.forEach(name => {
				                const option = document.createElement("option");
				                option.value = name;
				                option.textContent = name;
				                select.appendChild(option);
				            });
				        });
				</script>
            </div>
          
            <div class="col-md-2">
                <label for="zip" class="form-label">Zip</label>
                <input type="text" class="form-control" id="zip" name="zip" required>
            </div>

            <div class="col-12 d-flex gap-2 mt-4">
                <button type="submit" class="btn btn-primary">Submit</button>
                <button type="button" class="btn btn-secondary" onclick="history.back()">Cancel</button>
            </div>
        </form>
    </div>
</div>


<c:if test="${param.addCustomerSuccess == 'false'}">
  <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="errorToast" class="toast align-items-center text-bg-danger border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">
           Failed to add customer. Please try again.
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</c:if>
    
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>

</body>
</html>
