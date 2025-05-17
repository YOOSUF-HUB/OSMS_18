<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                <li class="nav-item"><a class="nav-link " href="../SalesRepDashboard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="../GetAllOrdersServlet">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="../GetAllCustomersServlet">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="../GetAllStockServlet?view=sales">Product</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Link</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#"><strong>John Doe</strong></a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#">Profile</a></li>
                <li class="nav-item d-lg-none"><a class="nav-link" href="#">Logout</a></li>
            </ul>

            <div class="dropdown d-none d-lg-block">
                <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
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


<div class="container">
    <div class="card p-4">
        <h4 class="mb-4 text-primary">Place Order</h4>
        <form action="AddOrderServlet" class="row g-3" method="post">

             <div class="col-md-12">
                <label for="bname" class="form-label">Business Name (Customer)</label>
                <select id="bname" class="form-select" name="cusID" required>
                    <option value="" selected disabled>Choose...</option>
                    <c:forEach var="customer" items="${allCustomers}">
                        <option value="${customer.id}">${customer.bname}</option>
                    </c:forEach>
                </select>
            </div>
            
 
            <div class="col-md-12">
                <label for="product" class="form-label">Product</label>
                <select id="product" class="form-select" name="itemID" required>
                    <option value="" selected disabled>Choose...</option>
                    <c:forEach var="stock" items="${allStock}">                   
                        <option value="${stock.item_id}" data-price="${stock.selling_price}">
                            ${stock.item_name} | ${stock.item_model} | ${stock.item_manufacturer} | $ ${stock.selling_price} | ${stock.quantity}
                        </option>

                    </c:forEach>
                </select>
            </div>
            
<!-- Individual Product Name filtering -->
<%-- 		<div class="col-md-12">
		    <label for="product" class="form-label">Product</label>
		    <select id="product" class="form-select" name="itemID" required>
		        <option value="" selected disabled>Choose...</option>
		        <c:forEach var="stock" items="${allStock}">
		            <c:if test="${stock.item_name == 'CPU'}">
		                <option value="${stock.item_id}" data-price="${stock.selling_price}">
		                    ${stock.item_name} | ${stock.item_model} | ${stock.item_manufacturer} | $ ${stock.selling_price}
		                </option>
		            </c:if>
		        </c:forEach>
		    </select>
		</div> --%>

            

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

<!-- JS Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>

<script>


    function calculateTotal() {
        const productSelect = document.getElementById("product");
        const qty = parseFloat(document.getElementById("qty").value) || 0;
        const selectedOption = productSelect.options[productSelect.selectedIndex];
        const price = parseFloat(selectedOption.getAttribute("data-price")) || 0;
        document.getElementById("total_price").value = (qty * price).toFixed(2);
    }

    /* document.getElementById("product").addEventListener("change", calculateTotal); */
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("product").addEventListener("change", calculateTotal);
        calculateTotal(); // initialize on load
    });


</script>
</body>
</html>
