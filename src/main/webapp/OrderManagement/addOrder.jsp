<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Place Order</title>
    
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
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
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
            <img src="image/Tech-Color.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
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
                    <em><%= name %></em>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>


<div class="container">
    <div class="card p-4">
        <h4 class="mb-4 custom-title">Place Order</h4>
        <form action="AddOrderServlet" class="row g-3" method="post">
<%
    String selectedCustomerId = request.getParameter("customerId");
	String selectedCustomerName = request.getParameter("customerName");
%>
             <div class="col-md-12">
                <label for="bname" class="form-label">Business Name (Customer)</label>
                <select id="bname" class="form-select" name="cusID" required>
                    
                    <% if (selectedCustomerId != null && selectedCustomerName != null) { %>
                    	<option disabled>Choose...</option>
			            <option value="<%= selectedCustomerId %>" selected><%= selectedCustomerName %></option>
			        <% }else{ %>
			        	<option disabled selected>Choose...</option>
			        <% }%>
                  
		                
                    <c:forEach var="customer" items="${allCustomers}">
                    	
                        <option value="${customer.id}">${customer.bname}</option>
                    </c:forEach>
                </select>
            </div>
        
           

<!-- Product Cards -->
           

			<div class="container">
				<label class="form-label mt-4">Select a Product</label>
			    <div class="nav nav-tabs" id="product-tabs">
			        <button type="button" class="nav-link active" id="core-tab" data-bs-toggle="tab" data-bs-target="#core">
			            Core Components
			        </button>
			        <button type="button" class="nav-link" id="cooling-tab" data-bs-toggle="tab" data-bs-target="#cooling">
			            Casing & Cooling
			        </button>
			        <button type="button" class="nav-link" id="networking-tab" data-bs-toggle="tab" data-bs-target="#devices" >
			            I/O devices
			        </button>
			        <button type="button" class="nav-link" id="power-tab" data-bs-toggle="tab" data-bs-target="#power" >
			            Power & Connectivity
			        </button>
			        <button type="button" class="nav-link" id="other-tab" data-bs-toggle="tab" data-bs-target="#other">
			            Other
			        </button>
			    </div>
			    
			    <c:set var="core" value="CPU,Motherboard,RAM,SSD,HDD,Graphics Card" />
			    <c:set var="cooling" value="Casing,Cooling Fan,Thermal Paste" />
			    <c:set var="power" value="Power Supply,Laptop Charger,HDMI Cable,VGA Cable,USB Hub,Extension Cord" />
			    <c:set var="devices" value="Keyboard,Mouse,Monitor" />
			
			    <div class="tab-content mt-3" id="product-tab-content">
			        <div class="tab-pane fade show active" id="core">
			            <div class="row" id="product-list">
			                <c:forEach var="stock" items="${allStock}">
			                	<c:if test="${fn:contains(core, stock.item_name)}">
				                    <div class="col-md-4 mb-3">
				                        <label class="card h-100 p-3 product-card" style="cursor: pointer;">
				                            <input type="radio"
				                                   name="itemID"
				                                   value="${stock.item_id}"
				                                   class="d-none product-radio"
				                                   data-price="${stock.selling_price}"
				                                   required>
				                            <div class="card-body">
				                                <h5 class="card-title">${stock.item_name}</h5>
				                                <p class="card-text">
				                                    Model: ${stock.item_model} <br>
				                                    Manufacturer: ${stock.item_manufacturer} <br>
				                                    Price: $${stock.selling_price}
				                                </p>
				                            </div>
				                        </label>
				                    </div>
			                    </c:if>
			                </c:forEach>
			            </div>
			        </div>
			        <div class="tab-pane fade" id="cooling">
			            <div class="row" id="product-list">
			                <c:forEach var="stock" items="${allStock}">
			                	<c:if test="${fn:contains( cooling, stock.item_name)}">
				                    <div class="col-md-4 mb-3">
				                        <label class="card h-100 p-3 product-card" style="cursor: pointer;">
				                            <input type="radio" name="itemID" value="${stock.item_id}" class="d-none product-radio" data-price="${stock.selling_price}" required>
				                            <div class="card-body">
				                                <h5 class="card-title">${stock.item_name}</h5>
				                                <p class="card-text">
				                                    Model: ${stock.item_model} <br>
				                                    Manufacturer: ${stock.item_manufacturer} <br>
				                                    Price: $${stock.selling_price}
				                                </p>
				                            </div>
				                        </label>
				                    </div>
			                    </c:if>
			                </c:forEach>
			            </div>
			        </div>
			        <div class="tab-pane fade" id="devices">
			            <div class="row" id="product-list">
			                <c:forEach var="stock" items="${allStock}">
			                	<c:if test="${fn:contains(devices, stock.item_name)}">
				                    <div class="col-md-4 mb-3">
				                        <label class="card h-100 p-3 product-card" style="cursor: pointer;">
				                            <input type="radio" name="itemID" value="${stock.item_id}" class="d-none product-radio" data-price="${stock.selling_price}" required>
				                            <div class="card-body">
				                                <h5 class="card-title">${stock.item_name}</h5>
				                                <p class="card-text">
				                                    Model: ${stock.item_model} <br>
				                                    Manufacturer: ${stock.item_manufacturer} <br>
				                                    Price: $${stock.selling_price}
				                                </p>
				                            </div>
				                        </label>
				                    </div>
			                    </c:if>
			                </c:forEach>
			            </div>
			        </div>
			        <div class="tab-pane fade" id="power">
			            <div class="row" id="product-list">
			                <c:forEach var="stock" items="${allStock}">
			                	<c:if test="${fn:contains(power, stock.item_name)}">
				                    <div class="col-md-4 mb-3">
				                        <label class="card h-100 p-3 product-card" style="cursor: pointer;">
				                            <input type="radio" name="itemID" value="${stock.item_id}" class="d-none product-radio" data-price="${stock.selling_price}" required>
				                            <div class="card-body">
				                                <h5 class="card-title">${stock.item_name}</h5>
				                                <p class="card-text">
				                                    Model: ${stock.item_model} <br>
				                                    Manufacturer: ${stock.item_manufacturer} <br>
				                                    Price: $${stock.selling_price}
				                                </p>
				                            </div>
				                        </label>
				                    </div>
			                    </c:if>
			                </c:forEach>
			            </div>
			        </div>
			        <div class="tab-pane fade" id="other">
			            <div class="row" id="product-list">
			                <c:forEach var="stock" items="${allStock}">
			                	<c:if test="${!fn:contains(core, stock.item_name) and !fn:contains(cooling, stock.item_name)
					                         and !fn:contains(power, stock.item_name) and !fn:contains(devices, stock.item_name)}">
				                    <div class="col-md-4 mb-3">
				                        <label class="card h-100 p-3 product-card" style="cursor: pointer;">
				                            <input type="radio"
				                                   name="itemID"
				                                   value="${stock.item_id}"
				                                   class="d-none product-radio"
				                                   data-price="${stock.selling_price}"
				                                   required>
				                            <div class="card-body">
				                                <h5 class="card-title">${stock.item_name}</h5>
				                                <p class="card-text">
				                                    Model: ${stock.item_model} <br>
				                                    Manufacturer: ${stock.item_manufacturer} <br>
				                                    Price: $${stock.selling_price}
				                                </p>
				                            </div>
				                        </label>
				                    </div>
			                    </c:if>
			                </c:forEach>
			            </div>
			        </div>
			    </div>
			</div>
            

            <div class="col-md-4">
                <label for="qty" class="form-label">Quantity:</label>
                <input type="number" class="form-control" id="qty" name="qty" min="1" required oninput="calculateTotal()">
            </div>

            <div class="col-md-4">
                <label for="total_price" class="form-label">Total Price:</label>
                <input type="text" class="form-control" id="total_price" name="total_price" readonly>
            </div>

            <div class="col-12 d-flex gap-2 mt-4">
                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="#" class="btn btn-secondary" onclick="window.history.back()">Cancel</a>
            </div>
        </form>
    </div>
</div>


<c:if test="${param.addSuccess == 'false'}">
  <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="errorToast" class="toast align-items-center text-bg-danger border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">
           Failed to place order. Please try again.
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</c:if>

<!-- JS Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>


<script>
    const radios = document.querySelectorAll('.product-radio');
    const qtyInput = document.getElementById("qty");
    const totalPriceInput = document.getElementById("total_price");

    function calculateTotal() {
        const qty = parseFloat(qtyInput.value) || 0;
        const selectedRadio = document.querySelector('input[name="itemID"]:checked');
        const price = selectedRadio ? parseFloat(selectedRadio.dataset.price) : 0;
        const total = qty * price;
        totalPriceInput.value = total.toFixed(2);
    }

    radios.forEach(radio => {
        radio.addEventListener('change', () => {
            document.querySelectorAll('.product-card').forEach(card => card.classList.remove('border-primary'));
            radio.closest('.product-card').classList.add('border-primary');
            calculateTotal();
        });
    });

    qtyInput.addEventListener('input', calculateTotal);
</script>
</body>
</html>
