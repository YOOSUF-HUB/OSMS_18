<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="SupplierPackage.SupplierModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../user/loginAuthentication.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Supplier</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<%
    int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
    String supplier_name = request.getParameter("supplier_name");
    String phone_number = request.getParameter("phone_number");
    String email = request.getParameter("email");
    String supplier_address = request.getParameter("supplier_address");
    String supplier_city = request.getParameter("supplier_city");
    String supplier_country = request.getParameter("supplier_country");
    String supplier_website = request.getParameter("supplier_website");
    String s_date_added = request.getParameter("s_date_added");
%>

<div class="container mt-5">
    <h2>Update Supplier Information</h2>
    <form action="../updateSupplierServlet" method="post">
        <div class="form-group">
            <label for="supplier_id">Supplier ID:</label>
            <input type="text" class="form-control" id="supplier_id" name="supplier_id" value="<%= supplier_id %>" readonly>
        </div>

        <div class="form-group">
            <label for="supplier_name">Supplier Name:</label>
            <input type="text" class="form-control" id="supplier_name" name="supplier_name" value="<%= supplier_name %>" required>
        </div>

        <div class="form-group">
            <label for="phone_number">Phone Number:</label>
            <input type="tel" class="form-control" id="phone_number" name="phone_number" value="<%= phone_number %>">
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= email %>">
        </div>

        <div class="form-group">
            <label for="supplier_address">Address:</label>
            <input type="text" class="form-control" id="supplier_address" name="supplier_address" value="<%= supplier_address %>">
        </div>

        <div class="form-group">
            <label for="supplier_city">City:</label>
            <input type="text" class="form-control" id="supplier_city" name="supplier_city" value="<%= supplier_city %>">
        </div>

        <div class="form-group">
            <label for="supplier_country">Country:</label>
            <select class="form-control" id="supplier_country" name="supplier_country" required>
                <option value="" disabled>Select a country</option>
            </select>
            <button type="button" class="btn btn-warning mt-2" id="clear-btn">Clear</button>
            <script>
                const selectedCountry = "<%= supplier_country %>"; // server-side variable

                // Fetch and populate countries dynamically from an API
                fetch("https://restcountries.com/v3.1/all")
                    .then(res => res.json())
                    .then(data => {
                        const select = document.getElementById("supplier_country");
                        const countries = data.map(c => c.name.common).sort();

                        countries.forEach(name => {
                            const option = document.createElement("option");
                            option.value = name;
                            option.textContent = name;

                            // Pre-select the country based on the request parameter
                            if (name === selectedCountry) {
                                option.selected = true;
                            }

                            select.appendChild(option);
                        });
                    });

                // Clear country selection
                document.getElementById("clear-btn").addEventListener("click", () => {
                    document.getElementById("supplier_country").selectedIndex = 0;
                });
            </script>
        </div>

        <div class="form-group">
            <label for="supplier_website">Website:</label>
            <input type="url" class="form-control" id="supplier_website" name="supplier_website" value="<%= supplier_website %>">
        </div>

        <div class="form-group">
            <label for="s_date_added">Date Added:</label>
            <input type="date" class="form-control" id="s_date_added" name="s_date_added" value="<%= s_date_added %>" required>
        </div>

        <button type="submit" class="btn btn-primary mr-2">Update</button>
        <a href="../GetAllSupplierServlet" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
