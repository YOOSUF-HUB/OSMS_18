<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../user/loginAuthentication.jsp" %>


   
<%
        String name = loggedInUser.getName(); 
%>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Customer</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand i {
            font-weight: bold;
            font-size: 1.2rem;
            color: #264093;
        }
        .form-container {
            max-width: 700px;
            margin: 30px auto;
            background-color: white;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
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
                <li class="nav-item"><a class="nav-link " href="./SalesRepDashboardServlet">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="./GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="./GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="./GetAllStockServlet?view=sales">Product</a></li>
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



<!-- Form Container -->
<!-- Form Container -->
<!-- Form Container -->
<div class="container">
    <div class="form-container">
        <h4 class="mb-4 text-primary">Update Customer</h4>
        <form action="UpdateCustomerServlet" method="post">

            <input type="hidden" name="customerId" value="${customer.id}" />

            <div class="mb-3">
                <label for="cname" class="form-label">Customer Name</label>
                <input type="text" class="form-control" id="cname" name="cname" value="${customer.cname}" required>
            </div>

            <div class="mb-3">
                <label for="bname" class="form-label">Business Name</label>
                <input type="text" class="form-control" id="bname" name="bname" value="${customer.bname}" required>
            </div>

            <div class="mb-3">
                <label for="number" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="number" name="number" value="${customer.number}" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email (optional)</label>
                <input type="email" class="form-control" id="email" name="email" value="${customer.email}">
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="${customer.address}" required>
            </div>

            <div class="mb-3">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" value="${customer.city}" required>
            </div>


            <div class="mb-3">
                <label for="country" class="form-label">Country</label>
                <select class="form-control" id="country" name="country" required>
                	<option value="${customer.country}" selected>${customer.country}</option>
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

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Update</button>
                <button type="button" class="btn btn-secondary" onclick="history.back()">Cancel</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>
</html>
