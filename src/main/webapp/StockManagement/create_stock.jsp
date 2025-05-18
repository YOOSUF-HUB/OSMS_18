<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/loginAuthentication.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Add New Stock · TechNest</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
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

        @media (min-width: 768px) {
            .form-row .col-md-6,
            .form-row .col-md-4,
            .form-row .col-md-3 {
                padding-left: 8px;
                padding-right: 8px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1><i class="fas fa-box-open mr-2"></i>Add New Stock Item</h1>
    </header>

    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card card-form">
                    <div class="card-header">Stock Details</div>
                    <div class="card-body">
                        <form action="../stockInsertServlet" method="post">
                            <!-- Row 1 -->
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="item_name">Product Category</label>
                                    <select class="form-control" id="item_name" name="item_name" required>
                                        <option value="" disabled selected>Select a product</option>
                                        <option value="CPU">CPU</option>
                                        <option value="Motherboard">Motherboard</option>
                                        <option value="RAM">RAM</option>
                                        <option value="SSD">SSD</option>
                                        <option value="HDD">HDD</option>
                                        <option value="Power Supply">Power Supply</option>
                                        <option value="Graphics Card">Graphics Card</option>
                                        <option value="Keyboard">Keyboard</option>
                                        <option value="Mouse">Mouse</option>
                                        <option value="Monitor">Monitor</option>
                                        <option value="Casing">Casing</option>
                                        <option value="Cooling Fan">Cooling Fan</option>
                                        <option value="Network Card">Network Card</option>
                                        <option value="Laptop Charger">Laptop Charger</option>
                                        <option value="HDMI Cable">HDMI Cable</option>
                                        <option value="VGA Cable">VGA Cable</option>
                                        <option value="USB Hub">USB Hub</option>
                                        <option value="Thermal Paste">Thermal Paste</option>
                                        <option value="Extension Cord">Extension Cord</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="item_model">Product Model</label>
                                    <input type="text" class="form-control" id="item_model" name="item_model" pattern="[A-Za-z0-9 ]+" title="Only alphabets, numbers, and spaces are allowed" Placeholder="Only Alphanumeric Characters are Allowed" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="item_manufacturer">Product Manufacturer</label>
                                    <input type="text" class="form-control" id="item_manufacturer" name="item_manufacturer" pattern="[A-Za-z0-9 ]+" title="Only alphabets, numbers, and spaces are allowed" Placeholder="Only Alphanumeric Characters are Allowed" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="unit_cost">Purchase Price (Rs.)</label>
                                    <input type="number" class="form-control" id="unit_cost" name="unit_cost" step="0.01" min="0" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="selling_price">Selling Price (Rs.)</label>
                                    <input type="number" class="form-control" id="selling_price" name="selling_price" step="0.01" min="0" required>
                                </div>
                            </div>
                            <!-- Row 3 -->
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="quantity">Quantity</label>
                                    <input type="number" class="form-control" id="quantity" name="quantity" min="0" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="date_added">Date</label>
                                    <input type="date" class="form-control" id="date_added" name="date_added" required>
                                </div>
                            </div>
                            <!-- Description -->
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                            </div>
                            <!-- Buttons -->
                            <div class="text-right">
                                <button type="submit" class="btn btn-primary">Add Stock</button>
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

    <script>
        function allowAlphanumeric(event) {
            const char = String.fromCharCode(event.which);
            if (!/[A-Za-z0-9 ]/.test(char)) {
                event.preventDefault();
            }
        }

        document.getElementById('item_model').addEventListener('keypress', allowAlphanumeric);
        document.getElementById('item_manufacturer').addEventListener('keypress', allowAlphanumeric);
    </script>
</body>
</html>
