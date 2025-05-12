<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .card { border-radius: 12px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05); }
        .form-label { font-weight: 500; }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="card p-4">
        <h4 class="mb-4 text-warning">Update Order</h4>
        <form action="UpdateOrderServlet" method="post" class="row g-3">

            <!-- Hidden Order ID -->
            <input type="hidden" name="orderID" value="${order.id}">

            <div class="col-md-12">
                <label class="form-label">Business Name (Customer)</label>
                <select class="form-select" name="cusID" required>
                    <c:forEach var="customer" items="${allCustomers}">
                        <option value="${customer.id}" ${customer.id == order.customerId ? 'selected' : ''}>
                            ${customer.bname}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-12">
                <label class="form-label">Product</label>
                <select id="product" class="form-select" name="itemID" required>
                    <c:forEach var="stock" items="${allStock}">
                        <option value="${stock.item_id}" data-price="${stock.selling_price}" 
                            ${stock.item_id == order.itemId ? 'selected' : ''}>
                            ${stock.item_name} | ${stock.item_model} | ${stock.item_manufacturer} | $ ${stock.selling_price}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-4">
                <label class="form-label">Quantity:</label>
                <input type="number" class="form-control" id="qty" name="qty" min="1" value="${order.qty}" required oninput="calculateTotal()">
            </div>

            <div class="col-md-4">
                <label class="form-label">Total Price:</label>
                <input type="text" class="form-control" id="total_price" name="total_price" value="${order.totalPrice}" readonly>
            </div>

            <div class="col-12 d-flex gap-2 mt-4">
                <button type="submit" class="btn btn-warning">Update</button>
                <a href="GetAllOrdersServlet" class="btn btn-secondary">Cancel</a>
            </div>

        </form>
    </div>
</div>

<script>
    function calculateTotal() {
        const productSelect = document.getElementById("product");
        const qty = parseFloat(document.getElementById("qty").value) || 0;
        const selectedOption = productSelect.options[productSelect.selectedIndex];
        const price = parseFloat(selectedOption.getAttribute("data-price")) || 0;
        document.getElementById("total_price").value = (qty * price).toFixed(2);
    }

    document.getElementById("product").addEventListener("change", calculateTotal);
    window.addEventListener("load", calculateTotal); // ensure total price is correct on load
</script>

</body>
</html>
