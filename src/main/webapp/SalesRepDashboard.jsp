<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- include the meta name="viewport" tag as well for proper responsive behavior in mobile devices. -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Sales Rep-TechNest</title>
	
	
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
                <a class="nav-link active" aria-current="page" href="SalesRepDashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="GetAllOrdersServlet">Order</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="GetAllCustomersServlet">Customer</a>
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
    
    
    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center my-3">
            <h3 class="mb-0">Dashboard</h3>
            <div>    
            <button type="button" class="btn btn-secondary" onclick="document.location='SalesRep/addCustomer.jsp'">Add Customer</button>
            <button type="button" class="btn btn-primary">Place Order</button>
            </div>
        </div>
        <div class="container-fluid row align-content-center">
            <div class="col-5 border offset-1">
                <div class="widget">
		        <h5 class="widget-title">Stock Overview</h5>
		        <p>Total Items: <strong>150</strong></p>
		        <p>Low Stock: <strong class="text-warning">15</strong></p>
		        <p>Out of Stock: <strong class="text-danger">5</strong></p>
		    </div>
            </div>
            <div class="col-5 border offset-1">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll">
                    <li>15</li>
                    <li>Customers</li>
                    <li><img src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top"></li>
                </ul>
            </div>
        </div>
        <hr class="divider">
        <div>

        </div>
    </div>

    <div class="container-fluid">
        <h4 class="mb-0">Today Orders</h4>
        <div class="table-responsive">
            <table class="table border">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Business Name</th>
                        <th>Product</th>
                        <th>Business Location</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>s</td>
                        <td>as</td>
                        <td>lap</td>
                        <td>Colombo</td>
                    </tr>                   
                </tbody>
                
            </table>

        </div>

    </div>

    <div class="container-fluid">
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true"> Motherboard </button>
            <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</button>
            <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
            <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" disabled>Disabled</button>
         </div>
        
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">...</div>
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">assac</div>
            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">...</div>
            <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">...</div>
        </div>
    </div>


	<!-- Include Bootstrap’s CSS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>