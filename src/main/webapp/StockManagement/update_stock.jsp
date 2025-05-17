<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Stock · TechNest</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        :root {
            --dark: #343a40;
            --accent: #ffcc00;
            --light-bg: #f4f6f9;
        }

        body {
            background-color: var(--light-bg);
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Header bar */
        header {
            background: var(--dark);
            color: #fff;
            padding: 1.2rem 0;
            box-shadow: 0 3px 10px rgba(0,0,0,.05);
            text-align: center;
        }
        header h1 {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
        }

        /* Card form styling */
        .card-form {
            border: none;
            border-radius: 12px;
            box-shadow: 0 6px 24px rgba(0,0,0,.05);
        }
        .card-form .card-header {
            background: var(--dark);
            color: #fff;
            font-weight: 600;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        .card-form .form-control {
            border-radius: 6px;
        }

        /* Buttons */
        .btn-primary {
            background: var(--dark);
            border-color: var(--dark);
            padding: .6rem 1.6rem;
        }
        .btn-primary:hover {
            background: #23272b;
            border-color: #23272b;
        }
        .btn-secondary {
            background: var(--accent);
            border-color: var(--accent);
            color: #000;
            padding: .6rem 1.6rem;
        }
        .btn-secondary:hover {
            background: #e6b800;
            border-color: #e6b800;
            color: #000;
        }
    </style>
</head>
<body>
<%
    int item_id = Integer.parseInt(request.getParameter("item_id"));
    String item_name  = request.getParameter("item_name");
    String item_model  = request.getParameter("item_model");
    String item_manufacturer = request.getParameter("item_manufacturer");
    int quantity  = Integer.parseInt(request.getParameter("quantity"));
    float unit_cost = Float.parseFloat(request.getParameter("unit_cost"));
    float selling_price = Float.parseFloat(request.getParameter("selling_price"));
    String date_added  = request.getParameter("date_added");
    String description = request.getParameter("description");
%>
    <header>
        <h1><i class="fas fa-edit mr-2"></i>Update Stock Item</h1>
    </header>

    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card card-form">
                    <div class="card-header">Stock Details</div>
                    <div class="card-body">
                        <form action="../updateStockServlet" method="post">
                            <!-- Stock ID (readonly) -->
                            <div class="form-group">
                                <label for="item_id">Stock ID</label>
                                <input type="text" class="form-control" id="item_id" name="item_id" value="<%= item_id %>" readonly>
                            </div>

                            <!-- Row 1 -->
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="item_name">Product Name</label>
                                    <input type="text" class="form-control" id="item_name" name="item_name" value="<%= item_name %>" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="item_model">Product Model</label>
                                    <input type="text" class="form-control" id="item_model" name="item_model" value="<%= item_model %>">
                                </div>
                            </div>

                            <!-- Row 2 -->
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="item_manufacturer">Manufacturer</label>
                                    <input type="text" class="form-control" id="item_manufacturer" name="item_manufacturer" value="<%= item_manufacturer %>">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="unit_cost">Purchase Price (Rs.)</label>
                                    <input type="number" step="0.01" class="form-control" id="unit_cost" name="unit_cost" value="<%= unit_cost %>">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="selling_price">Selling Price (Rs.)</label>
                                    <input type="number" step="0.01" class="form-control" id="selling_price" name="selling_price" value="<%= selling_price %>" required>
                                </div>
                            </div>

                            <!-- Row 3-->
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="quantity">Quantity</label>
                                    <input type="number" class="form-control" id="quantity" name="quantity" value="<%= quantity %>" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="date_added">Date</label>
                                    <input type="date" class="form-control" id="date_added" name="date_added" value="<%= date_added %>" required>
                                </div>
                            </div>

                            <!-- Description -->
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="4"><%= description %></textarea>
                            </div>

                            <!-- Buttons -->
                            <div class="text-right">
                                <button type="submit" class="btn btn-primary">Update</button>
                                <a href="../GetAllStockServlet" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>