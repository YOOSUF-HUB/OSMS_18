<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Wholesale Stock Management System</title>

    <!-- Bootstrap 4 CSS -->
    <link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <!-- FontAwesome 6 -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />

    <style>
        body {
            background-color: #f4f6f9;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Sidebar styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 240px;
            background-color: #343a40;
            padding-top: 20px;
            color: white;
            overflow-y: auto;
            z-index: 1050;
            transition: all 0.3s ease;
        }

        .sidebar .nav-link,
        .sidebar .dropdown-btn {
            display: flex;
            align-items: center;
            padding: 12px 25px;
            color: white;
            font-weight: 500;
            font-size: 1rem;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            transition: background-color 0.2s ease;
            user-select: none;
        }

        .sidebar .nav-link i,
        .sidebar .dropdown-btn i {
            margin-right: 15px;
            font-size: 1.3em;
            min-width: 20px;
            text-align: center;
        }

        .sidebar .nav-link:hover,
        .sidebar .dropdown-btn:hover {
            background-color: rgba(255, 255, 255, 0.15);
            text-decoration: none;
        }

        .sidebar .nav-link.active {
            background-color: #ffcc00;
            font-weight: 600;
            border-radius: 10px;
        }

        /* Dropdown container hidden by default */
        .dropdown-container {
            display: none;
            background-color: rgba(255, 255, 255, 0.05);
            padding-left: 45px;
        }

        .dropdown-container a {
            display: block;
            padding: 10px 15px;
            font-size: 0.9rem;
            color: #ddd;
            transition: background-color 0.2s ease;
        }

        .dropdown-container a:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
            text-decoration: none;
        }

        /* Content area */
        .content {
            margin-left: 240px;
            padding: 30px 40px;
            min-height: 100vh;
            background-color: #fff;
            box-shadow: inset 0 0 15px #eee;
        }

        /* Dashboard header */
        .content h1 {
            font-weight: 700;
            color: #343a40;
            margin-bottom: 30px;
        }

        /* Card tweaks */
        .card {
            border-radius: 8px;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 50px;
        }

        .card-header {
            background-color: #374350;
            color: #fff;
            font-weight: 600;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .nav-tabs .nav-link {
            color: #dee2e6;
            border: none;
            font-weight: 600;
            font-size: 1rem;
        }

        .nav-tabs .nav-link.active {
            background-color: #fff;
            color: #374350;
            border-radius: 8px 8px 0 0;
            border: 1px solid #dee2e6;
            border-bottom-color: transparent;
        }

        /* Widget styling */
        .widget {
            background-color: #fefefe;
            padding: 20px 25px;
            border-radius: 6px;
            box-shadow: 0 0 10px #ddd;
            color: #444;
        }

        .widget-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 15px;
            color: #343a40;
            border-bottom: 2px solid #374350;
            padding-bottom: 5px;
        }

        /* Text emphasis */
        .text-warning {
            color: #ffc107 !important;
            font-weight: 700;
        }

        .text-danger {
            color: #dc3545 !important;
            font-weight: 700;
        }

        /* Remove underline on hover for all anchors */
        a:hover {
            text-decoration: none !important;
        }
    </style>
</head>
<body>
    <nav class="sidebar">
        <ul class="nav flex-column">
            <li class="nav-item mb-3 px-3">
				<a class="nav-link active" href="#" style="color: black;">
				    <i class="fas fa-warehouse"></i> TechNest
				</a>
            </li>

            <!-- Stock Management -->
            <li class="nav-item">
                <button class="dropdown-btn">
                    <i class="fas fa-box-open"></i> Stock Management
                    <i class="fas fa-chevron-down ml-auto"></i>
                </button>
                <div class="dropdown-container">
                    <a href="StockManagement/create_stock.jsp"><i class="fas fa-plus"></i> Add New Stock</a>
                    <a href="GetAllStockServlet"><i class="fas fa-list"></i> View Stock</a>
                </div>
            </li>

            <!-- Supplier Management -->
            <li class="nav-item">
                <button class="dropdown-btn">
                    <i class="fa-solid fa-boxes-packing"></i> Supplier Management
                    <i class="fas fa-chevron-down ml-auto"></i>
                </button>
                <div class="dropdown-container">
                    <a href="SupplierManagement/create_supplier.jsp"><i class="fas fa-plus"></i> Add New Supplier</a>
                    <a href="GetAllSupplierServlet"><i class="fas fa-list"></i> View Supplier</a>
                </div>
            </li>

            <!-- Stock Order Management -->
            <li class="nav-item">
                <button class="dropdown-btn">
                    <i class="fas fa-shopping-cart"></i> Stock Order Management
                    <i class="fas fa-chevron-down ml-auto"></i>
                </button>
                <div class="dropdown-container">
                    <a href="StockOrderInsertServlet"><i class="fas fa-plus"></i> Create New Order</a>
                    <a href="StockOrdersServlet"><i class="fas fa-list"></i> View Orders</a>
                </div>
            </li>
        </ul>
    </nav>

    <main class="content">
        <h1>Stock Manager Dashboard</h1>

        <div class="card">
            <div class="card-header">
                <ul
                    class="nav nav-tabs card-header-tabs"
                    id="myTab"
                    role="tablist"
                >
                    <li class="nav-item" role="presentation">
                        <a
                            class="nav-link active"
                            id="stock-overview-tab"
                            data-toggle="tab"
                            href="#stock-overview-content"
                            role="tab"
                            aria-controls="stock-overview-content"
                            aria-selected="true"
                        >Stock Overview</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a
                            class="nav-link"
                            id="recent-orders-tab"
                            data-toggle="tab"
                            href="#recent-orders-content"
                            role="tab"
                            aria-controls="recent-orders-content"
                            aria-selected="false"
                        >Recent Orders</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a
                            class="nav-link"
                            id="sales-stat-tab"
                            data-toggle="tab"
                            href="#sales-stat-content"
                            role="tab"
                            aria-controls="sales-stat-content"
                            aria-selected="false"
                        >Sales Statistics</a>
                    </li>
                </ul>
            </div>

            <div class="card-body">
                <div class="tab-content" id="myTabContent">
					<div
					    class="tab-pane fade show active"
					    id="stock-overview-content"
					    role="tabpanel"
					    aria-labelledby="stock-overview-tab"
					>
					    <div class="widget">
					        <h2 class="widget-title">Stock Overview</h2>
					        <p>Total Items: <strong><%= request.getAttribute("totalItems") %></strong></p>
					        <p>Low Stock: <strong class="text-warning"><%= request.getAttribute("lowStockCount") %></strong></p>
					        <p>Out of Stock: <strong class="text-danger"><%= request.getAttribute("outOfStockCount") %></strong></p>
					    </div>
					</div>


                    <div
                        class="tab-pane fade"
                        id="recent-orders-content"
                        role="tabpanel"
                        aria-labelledby="recent-orders-tab"
                    >
                        <div class="widget">
                            <h2 class="widget-title">Recent Orders</h2>
                            <ul>
                                <li>Order #1234 - 5 items</li>
                                <li>Order #1235 - 10 items</li>
                                <li>Order #1236 - 2 items</li>
                            </ul>
                        </div>
                    </div>

                    <div
                        class="tab-pane fade"
                        id="sales-stat-content"
                        role="tabpanel"
                        aria-labelledby="sales-stat-tab"
                    >
                        <div class="widget">
                            <h2 class="widget-title">Sales Statistics</h2>
                            <p>Today's Sales: <strong>$500</strong></p>
                            <p>This Week's Sales: <strong>$2500</strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- JS dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"
    ></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    ></script>

    <script>
        // Sidebar dropdown toggle
        document.querySelectorAll(".dropdown-btn").forEach(function (btn) {
            btn.addEventListener("click", function () {
                this.classList.toggle("active");
                let dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                    dropdownContent.style.display = "none";
                    this.querySelector(".fa-chevron-down").style.transform =
                        "rotate(0deg)";
                } else {
                    dropdownContent.style.display = "block";
                    this.querySelector(".fa-chevron-down").style.transform =
                        "rotate(180deg)";
                }
            });
        });

        // Enable Bootstrap tabs manually for compatibility with jQuery slim
        $(function () {
            $('#myTab a').on('click', function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        });
    </script>
</body>
</html>
