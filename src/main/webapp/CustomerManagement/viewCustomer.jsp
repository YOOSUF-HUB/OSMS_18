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
    <title>Customer Page</title>

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
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .form-label {
            font-weight: 500;
        }
        .search-container {
		    position: relative;
		}
		
		.search-input {
		    height: 40px;
		    border-radius: 30px;
		    padding-left: 35px;
		    border: 1px #black;
		}
		
		.search-icon {
		    position: absolute;
		    top: 50%;
		    left: 25px;
		    transform: translateY(-50%);
		    color: #888;
		    
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
                <li class="nav-item"><a class="nav-link" href="GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link active" href="GetAllCustomersServlet">Customer</a></li>
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


<!-- Content -->
<div class="container">
	<div class="stock-count-box mb-3">
		        <i class="bi bi-people"></i>
		        TOTAL CUSTOMERS: ${fn:length(allCustomers)}
    </div>
    <div class="card p-4">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<div class="d-flex align-items-center custom-title">
				<i class="bi bi-people-fill me-2" style="font-size: 2em;"></i>
	        	<h3 class="mb-0"><strong>Customers</strong></h3>
	        </div>
			<div class="col-md-4 row justify-content-center">
			  	<div class="search-container">
			  		<input type="text" id="searchInput" class="form-control search-input" placeholder="Search...">
			  		<i class="bi bi-search search-icon"></i>
			   	</div>
			</div>
	        <div>
	            <button type="button" class="btn btn-primary" onclick="window.location.href ='CustomerManagement/addCustomer.jsp'">
	                <i class="bi bi-person-plus"></i> Add Customer
	            </button>
	        </div>
	    </div>
        <div class="table-responsive overflow-y-auto">
            <table id="table" class="table table-bordered table-striped align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Customer ID</th>
                        <th>Customer Name</th>
                        <th>Business Name</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Actions</th>
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
                            <td>
                                <div class="d-flex gap-2 justify-content-center">                               
									<form action="AddOrderServlet" method="get">
									    <input type="hidden" name="customerId" value="${customer.id}">
									    <input type="hidden" name="customerName" value="${customer.bname}">
									    <button type="submit" class="btn btn-sm btn-outline-primary">Place Order</button>
									</form>                                 
                                    <form action="UpdateCustomerServlet" method="get">
                                        <input type="hidden" name="customerId" value="${customer.id}">
                                        <button type="submit" class="btn btn-sm btn-outline-primary">Update</button>
                                    </form>
                                    <form action="DeleteCustomerServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this customer?');">
                                        <input type="hidden" name="customerId" value="${customer.id}">
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
            Customer updated successfully!
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
           Failed to update customer. <a href="UpdateCustomerServlet?customerId=${param.customerId}">Please try again.</a>      
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</c:if>

<c:if test="${param.addCustomerSuccess == 'true'}">
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
      <div id="successToast" class="toast align-items-center text-bg-success border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
          <div class="toast-body">
            Customer added successfully!
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
            Customer deleted successfully!
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
           Failed to delete customer.      
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</c:if>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
<script>
	function searchCustomer(){
		var input, filter, table, tr, td, i,j, txtvalue;
		input = document.getElementById("searchInput");
		filter = input.value.toUpperCase();
		table = document.querySelector("table");
	    tr = table.getElementsByTagName("tr");
	    
	    for(i=1; i<tr.length; i++){
	    	td = tr[i].getElementsByTagName("td")
	    	
	    	for(j=0; j<2; j++){
	    		if(td[j]){
	    			textvalue = td[j].textContent || td[j].innerText;
	    			tr[i].style.display = "";
	                break;
	    		}else{
	    			tr[i].style.display = "none";
	    		}
	    	}
	    }
	    
	    document.getElementById("searchInput").addEventListener("input", searchCustomer);
	}
</script> 

<script>
function searchCustomer() {
    var input = document.getElementById("searchInput");
    var filter = input.value.toUpperCase();
    var table = document.querySelector("table");
    var tr = table.getElementsByTagName("tr");

    for (var i = 1; i < tr.length; i++) { 
        var td = tr[i].getElementsByTagName("td");
        var found = false;

        for (var j = 0; j < 3; j++) { // ignore Actions column
            if (td[j]) {
                var txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    found = true;
                    break;
                }
            }
        }

        tr[i].style.display = found ? "" : "none";
    }
}

// Attach event listener once DOM is loaded
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("searchInput").addEventListener("input", searchCustomer);
});
</script>

</body>
</html>
