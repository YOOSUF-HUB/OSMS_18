<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Stock Orders</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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

        .table {
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .table thead {
            background-color: #343a40;
            color: #fff;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 6px 14px;
            font-size: 0.875rem;
            border-radius: 6px;
            transition: all 0.3s ease-in-out;
        }

        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .search-bar-container {
            max-width: 500px;
            margin: 0 auto 30px auto;
        }

        #searchInput {
            border-radius: 0.25rem 0 0 0.25rem;
            padding: 10px 12px;
            font-size: 1rem;
            transition: box-shadow 0.3s ease;
        }

        #searchInput:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.4);
        }

        #searchBtn {
            border-radius: 0 0.25rem 0.25rem 0;
            padding: 6px 16px;
            font-size: 1rem;
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

        .card-body {
            transition: background-color 0.3s ease;
        }

        .card-body:hover {
            background-color: #f8f9fc;
        }

        @media (max-width: 768px) {
            .table th, .table td {
                font-size: 0.75rem;
            }

            h2 {
                font-size: 1.2rem;
            }
        }

        /* Order Status Colors */
        .pending {
            background-color: #ffeeba;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        .processing {
            background-color: #bee5eb;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        .shipped {
            background-color: #b8daff;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        .delivered {
            background-color: #d4edda;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        .cancelled {
            background-color: #f5c6cb;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        /* Payment Status Colors */
        .unpaid {
            background-color: #ffeeba;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        .paid {
            background-color: #d4edda;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        .partially-paid {
            background-color: #fff3cd;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }

        .refunded {
            background-color: #f8d7da;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2>Stock Order Records</h2>

    <div class="input-group mb-4 search-bar-container shadow-sm">
        <input type="text" id="searchInput" class="form-control" placeholder="Search...">
        <div class="input-group-append">
            <button class="btn btn-outline-primary" type="button" id="searchBtn">Search</button>
        </div>
    </div>

    <div class="row">
        <div id="noResultsMessage" class="text-center text-muted mt-4" style="display: none;">
            <h5>No stock orders found.</h5>
        </div>

        <c:forEach var="order" items="${orders}">
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title font-weight-bold">Order ID: ORD_${order.order_id}</h5>
                        <p class="card-text">
                            <strong>Order Date:</strong> ${order.order_date}<br/>
                            <strong>Quantity:</strong> ${order.quantity_ordered}<br/>
                            <strong>Unit Price:</strong> ${order.unit_price}<br/>
                            <strong>Total Price:</strong> ${order.total_price}<br/>
                            <strong>Status:</strong> 
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
                            <strong>Supplier ID:</strong> ${order.supplier_id}<br/>
                            <strong>Notes:</strong> ${order.notes}
                        </p>
                        <div class="d-flex justify-content-between">
                            <a href="StockOrderUpdateServlet?order_id=${order.order_id}&order_date=${order.order_date}&quantity_ordered=${order.quantity_ordered}&unit_price=${order.unit_price}&total_price=${order.total_price}&order_status=${order.order_status}&expected_delivery_date=${order.expected_delivery_date}&payment_status=${order.payment_status}&notes=${order.notes}&received_date=${order.received_date}&invoice_number=${order.invoice_number}&supplier_id=${order.supplier_id}" class="btn btn-sm btn-primary">Update</a>

                            <form action="DeleteStockServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this order?');">
                                <input type="hidden" name="item_id" value="${order.order_id}" />
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="text-center mt-4">
        <a href="StockOrderInsertServlet" class="btn btn-success mr-2">Add New Stock Order</a>
        <a href="./StockManagerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
    function filterCards() {
        const input = document.getElementById("searchInput").value.toUpperCase();
        const cards = document.querySelectorAll(".card");
        let visibleCount = 0;

        cards.forEach(card => {
            const text = card.textContent.toUpperCase();
            const isMatch = text.includes(input);
            const cardContainer = card.closest(".col-md-4");
            if (cardContainer) {
                cardContainer.style.display = isMatch ? "" : "none";
                if (isMatch) visibleCount++;
            }
        });

        document.getElementById("noResultsMessage").style.display = (visibleCount === 0) ? "block" : "none";
    }

    document.getElementById("searchBtn").addEventListener("click", filterCards);
</script>

</body>
</html>
