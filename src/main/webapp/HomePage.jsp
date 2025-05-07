<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wholesale Shoe Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
   
    <style>
        body {
background-color: #f4f6f9; 
}


.sidebar {
height: 100vh; 
width: 240px; 
position: fixed; 
top: 0; 
left: 0; 
background-color: #343a40; 
padding-top: 20px; 
color: white; 
z-index: 1; 
overflow-y: auto; 
}


.sidebar .nav-link {
padding: 12px 20px; 
color: white; 
text-decoration: none; 
display: flex; 
align-items: center; 
}


.sidebar .nav-link i {
margin-right: 10px; 
font-size: 1.2em; 
}


.sidebar .nav-link:hover {
background-color: rgba(255, 255, 255, 0.1); 
}


.sidebar .dropdown-btn {
padding: 12px 20px; 
color: white;
background: none; 
border: none; 
width: 100%; 
text-align: left; 
cursor: pointer; 
}


.sidebar .dropdown-btn:hover {
background-color: rgba(255, 255, 255, 0.1); 
}


.sidebar .dropdown-container {
display: none; 
background-color: rgba(0, 0, 0, 0.1); 
padding-left: 30px; 
}


.sidebar .dropdown-container a {
padding: 10px 15px; 
text-decoration: none; 
display: block; 
color: #ccc; 
font-size: 0.9em; 
}


.sidebar .dropdown-container a:hover {
background-color: rgba(255, 255, 255, 0.05); 
}


.content {
margin-left: 240px; 
padding: 20px; 
}


.dashboard-widgets {
display: grid; 
grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); 
grid-gap: 20px; 
margin-bottom: 20px; 
}


.widget {
background-color: white; 
padding: 20px; 
border-radius: 5px; 
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
}


.widget-title {
font-size: 1.1em; 
color: #555; 
margin-bottom: 10px; 
}
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block bg-dark sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                <i class="fas fa-tachometer-alt"></i> TechNest <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <button class="dropdown-btn">
                                <i class="fas fa-box-open"></i> Stock Management
                            </button>
                            <div class="dropdown-container">
                                <a href="StockManagement/create_stock.jsp"><i class="fas fa-plus"></i> Add New Stock</a>
                                <a href="StockManagement/view_stock.jsp"><i class="fas fa-list"></i> View Stock</a>
                                <a href="StockManagement/update_stock.jsp"><i class="fas fa-edit"></i> Update Stock</a>
                                <a href="StockManagement/delete_stock.jsp"><i class="fas fa-trash"></i> Delete Stock</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <button class="dropdown-btn">
                                <i class="fas fa-users"></i> User Management
                            </button>
                            <div class="dropdown-container">
                                <a href="create_user.jsp"><i class="fas fa-user-plus"></i> Add New User</a>
                                <a href="view_users.jsp"><i class="fas fa-list"></i> View Users</a>
                                <a href="update_user.jsp"><i class="fas fa-edit"></i> Update User</a>
                                <a href="delete_user.jsp"><i class="fas fa-user-minus"></i> Delete User</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <button class="dropdown-btn">
                                <i class="fas fa-shopping-cart"></i> Order Management
                            </button>
                            <div class="dropdown-container">
                                <a href="create_order.jsp"><i class="fas fa-plus"></i> Create New Order</a>
                                <a href="view_orders.jsp"><i class="fas fa-list"></i> View Orders</a>
                                <a href="update_order.jsp"><i class="fas fa-edit"></i> Update Order</a>
                                <a href="delete_order.jsp"><i class="fas fa-ban"></i> Cancel Order</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <button class="dropdown-btn">
                                <i class="fas fa-chart-bar"></i> Report Management
                            </button>
                            <div class="dropdown-container">
                                <a href="ReportManagement/create_report.jsp"><i class="fas fa-file-alt"></i> Generate New Report</a>
                                <a href="ViewReportsServlet"><i class="fas fa-list"></i> View Reports</a>
                                <a href="ViewReportsServlet"><i class="fas fa-edit"></i> Update Report</a>
                                <a href="ViewReportsServlet"><i class="fas fa-trash-alt"></i> Delete Report</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#customer-portal">
                                <i class="fas fa-portal-enter"></i> Customer Portal
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">
                                <i class="fas fa-envelope"></i> Contact Us
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Dashboard</h1>
                </div>

                <div class="dashboard-widgets">
                    <div class="widget">
                        <h2 class="widget-title">Stock Overview</h2>
                        <p>Total Items: <strong>150</strong></p>
                        <p>Low Stock: <strong class="text-warning">15</strong></p>
                        <p>Out of Stock: <strong class="text-danger">5</strong></p>
                    </div>

                    <div class="widget">
                        <h2 class="widget-title">Recent Orders</h2>
                        <ul>
                            <li>Order #1234 - 5 items</li>
                            <li>Order #1235 - 10 items</li>
                            <li>Order #1236 - 2 items</li>
                        </ul>
                    </div>

                    <div class="widget">
                        <h2 class="widget-title">Sales Statistics</h2>
                        <p>Today's Sales: <strong>$500</strong></p>
                        <p>This Week's Sales: <strong>$2500</strong></p>
                    </div>
                </div>

                <section id="customer-portal" class="mt-5">
                    <h2>Customer Portal</h2>
                    <p class="lead">Registered customers can log in here.</p>
                    <a href="login.jsp" class="btn btn-success btn-lg">Login to Portal</a>
                    <p class="mt-3">New customer? <a href="register.jsp">Register here</a></p>
                </section>

                <section id="contact" class="mt-5">
                    <h2>Contact Us</h2>
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <p class="lead text-center">Get in touch with our team.</p>
                            <form>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" placeholder="Your Name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <input type="email" class="form-control" id="email" placeholder="Enter your email">
                                </div>
                                <div class="form-group">
                                    <label for="message">Message</label>
                                    <textarea class="form-control" id="message" rows="4" placeholder="Your Message"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Send Message</button>
                            </form>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        var dropdown = document.querySelectorAll(".dropdown-btn");
        var i;

        for (i = 0; i < dropdown.length; i++) {
            dropdown[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                    dropdownContent.style.display = "none";
                } else {
                    dropdownContent.style.display = "block";
                }
            });
        }
    </script>
</body>
</html>