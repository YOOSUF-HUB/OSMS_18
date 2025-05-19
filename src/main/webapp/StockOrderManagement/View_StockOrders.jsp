<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("requiredRole", "stock manager");
%>
<%@ include file="../user/loginAuthentication.jsp" %>


   
<%
        String name = loggedInUser.getName(); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Stock Orders</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        .container {
            max-width: 1800px;
            margin: auto;
            padding: 20px;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 12px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }

        .card-body:hover {
            background-color: #f8f9fc;
        }

        .search-bar-container {
            max-width: 500px;
            margin: 0 auto 30px auto;
        }

        #searchInput {
            border-radius: 0.25rem 0 0 0.25rem;
            padding: 10px 12px;
            font-size: 1rem;
        }

        #searchBtn {
            border-radius: 0 0.25rem 0.25rem 0;
            padding: 6px 16px;
            font-size: 1rem;
        }

        @media (max-width: 768px) {
            h2 {
                font-size: 1.2rem;
            }
        }

        /* Order & Payment badge colors */
        .pending { background-color: #ffeeba; }
        .processing { background-color: #bee5eb; }
        .shipped { background-color: #b8daff; }
        .delivered { background-color: #d4edda; }
        .cancelled { background-color: #f5c6cb; }

        .unpaid { background-color: #ffeeba; }
        .paid { background-color: #d4edda; }
        .partially-paid { background-color: #fff3cd; }
        .refunded { background-color: #f8d7da; }

        .pending, .processing, .shipped, .delivered, .cancelled,
        .unpaid, .paid, .partially-paid, .refunded {
            padding: 4px 15px;
            border-radius: 4px;
            display: inline-block;
        }
        
        #filter-text{
        	font-size:1.4rem;
        	margin-left:20px;
        }

	.card-body .card-title .badge {
	  font-size: 1rem; /* Increase font size to 16px (default 0.8rem or less) */
	  padding: 0.4em 0.7em; /* optional: adjust padding for better look */
	}
	
	.btn-success {
	    color: #fff;
	    background-color: #28a745;
	    border-color: #28a745;
	    padding:10px 70px;
	    margin-left: 18px;
	}
	
	.badge-info {
	    color: #fff;
	    background-color: #45484a;
	}
	.btn-secondary{
	padding:10px 70px;
	margin-bottom: 50px;
		
	}
    </style>
</head>
<body>

<div class="container mt-5">
    <h2>Stock Order Records</h2>
    
    
    <!-- Search Bar -->
    <div class="input-group mb-4 search-bar-container shadow-sm">
        <input type="text" id="searchInput" class="form-control" placeholder="Search...">
        <div class="input-group-append">
            <button class="btn btn-outline-primary" type="button" id="searchBtn">Search</button>
        </div>
    </div>
    


    <div class="row mb-4">
    
    <a href="StockOrderInsertServlet" class="btn btn-success">Add New Stock Order</a>
    
        <div class="col-md-3">
            <select id="statusFilter" class="form-control">
                <option value="">All Delivery Statuses</option>
                <option value="Pending">Pending</option>
                <option value="Processing">Processing</option>
                <option value="Shipped">Shipped</option>
                <option value="Delivered">Delivered</option>
                <option value="Cancelled">Cancelled</option>
            </select>
        </div>
        <!-- Filtering Payment Status -->
        <div class="col-md-3">
            <select id="paymentFilter" class="form-control">
                <option value="">All Payment Statuses</option>
                <option value="Paid">Paid</option>
                <option value="Unpaid">Unpaid</option>
                <option value="Partially Paid">Partially Paid</option>
                <option value="Refunded">Refunded</option>
            </select>
        </div>
        
        
    </div>




<div class="row">
    <c:choose>
        <c:when test="${empty orders}">
            <div class="col-12 text-center text-muted">
                <h4>No stock orders available.</h4>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="order" items="${orders}">
                <div class="col-md-4 mb-4"
                     data-status="${order.order_status}"
                     data-payment="${order.payment_status}">
                    <div class="card shadow-sm h-100">
                        <div class="card-body">
							<h5 class="card-title">
							    <span class="badge badge-info">Order ID: ORD_${order.order_id}</span>
							</h5>
                            <p class="card-text">
                                <strong>Order Date:</strong> ${order.order_date}<br/>
                                <strong>Quantity:</strong> ${order.quantity_ordered}<br/>
                                <strong>Unit Price:</strong> ${order.unit_price}<br/>
                                <strong>Total Price:</strong> ${order.total_price}<br/>
                                <strong>Delivery Status:</strong>
                                <span class="${order.order_status == 'Pending' ? 'pending' : order.order_status == 'Processing' ? 'processing' : order.order_status == 'Shipped' ? 'shipped' : order.order_status == 'Delivered' ? 'delivered' : 'cancelled'}">
                                    ${order.order_status}
                                </span><br/>
                                <strong>Expected Delivery:</strong> ${order.expected_delivery_date}<br/>
                                <strong>Payment Status:</strong>
                                <span class="${order.payment_status == 'Unpaid' ? 'unpaid' : order.payment_status == 'Paid' ? 'paid' : order.payment_status == 'Partially Paid' ? 'partially-paid' : 'refunded'}">
                                    ${order.payment_status}
                                </span><br/>
                                <strong>Received Date:</strong> ${order.received_date}<br/>
                                <strong>Invoice #:</strong> ${order.invoice_number}<br/>
                                <strong>Supplier ID:</strong> SUPPL_${order.supplier_id}<br/>
                                <strong>Notes:</strong> ${order.notes}
                            </p>
                            <div class="d-flex justify-content-between">
                                <a href="StockOrderUpdateServlet?order_id=${order.order_id}&order_date=${order.order_date}&quantity_ordered=${order.quantity_ordered}&unit_price=${order.unit_price}&total_price=${order.total_price}&order_status=${order.order_status}&expected_delivery_date=${order.expected_delivery_date}&payment_status=${order.payment_status}&notes=${order.notes}&received_date=${order.received_date}&invoice_number=${order.invoice_number}&supplier_id=${order.supplier_id}" class="btn btn-sm btn-primary">Update</a>
                                <form action="DeleteStockOrderServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this order?');">
                                    <input type="hidden" name="order_id" value="${order.order_id}" />
                                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>


    <div class="text-center mt-4">
        <a href="./StockManagerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
    function filterCards() {
        const input = document.getElementById("searchInput").value.toUpperCase();
        const statusFilter = document.getElementById("statusFilter").value;
        const paymentFilter = document.getElementById("paymentFilter").value;
        const cards = document.querySelectorAll(".card");
        let visibleCount = 0;

        cards.forEach(card => {
            const cardContainer = card.closest(".col-md-4");
            const text = card.textContent.toUpperCase();
            const status = cardContainer.getAttribute("data-status");
            const payment = cardContainer.getAttribute("data-payment");

            const matchesSearch = text.includes(input);
            const matchesStatus = !statusFilter || status === statusFilter;
            const matchesPayment = !paymentFilter || payment === paymentFilter;

            const show = matchesSearch && matchesStatus && matchesPayment;
            cardContainer.style.display = show ? "" : "none";

            if (show) visibleCount++;
        });

        document.getElementById("noResultsMessage").style.display = (visibleCount === 0) ? "block" : "none";
    }

    document.getElementById("searchBtn").addEventListener("click", filterCards);
    document.getElementById("statusFilter").addEventListener("change", filterCards);
    document.getElementById("paymentFilter").addEventListener("change", filterCards);
</script>

</body>
</html>
