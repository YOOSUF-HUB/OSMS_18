<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <label for="province" class="form-label">Province</label>
                <select id="province" name="province" class="form-select" required>
                    <option value="">Choose...</option>
                    <option value="CP" ${customer.province == 'CP' ? 'selected' : ''}>CP</option>
                    <option value="NP" ${customer.province == 'NP' ? 'selected' : ''}>NP</option>
                    <!-- Add other options if needed -->
                </select>
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
