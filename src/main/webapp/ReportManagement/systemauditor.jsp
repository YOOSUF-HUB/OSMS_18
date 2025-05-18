<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ReportPackage.ReportModel" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="StockOrderManagement.StockOrderModel" %>
<%@ page import="StockOrderManagement.StockOrderControl" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="StockOrderManagement.DBconnection" %>
<%@ page import = "UserPackage.UserModel" %>

<%
    
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return; 
    }

    
    UserModel loggedInUser = (UserModel) session.getAttribute("user");
    if (!"system auditor".equals(loggedInUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/Homepage.jsp");
        return; 
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Auditor Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f8f9fa;
    }
    .dashboard-header {
        background-color: #343a40;
        color: white;
        padding: 2rem 1rem;
        text-align: center;
        margin-bottom: 2rem;
    }
    .sidebar {
        background-color: #ffffff;
        border-right: 1px solid #dee2e6;
        padding: 2rem 1rem;
        height: 100vh;
        justify-content: space-between;
    }
    .sidebar h2 {
        font-size: 1.75rem;
        font-weight: 600;
        color: #343a40;
        margin-bottom: 2rem;
    }
    .sidebar ul {
        list-style: none;
        padding: 0;
    }
    .sidebar ul li {
        margin-bottom: 1.25rem;
    }
    .sidebar ul li a {
        color: #495057;
        text-decoration: none;
        padding: 0.75rem 1rem;
        display: block;
        border-radius: 0.5rem;
        transition: all 0.3s ease;
    }
    .sidebar ul li a:hover {
        background-color: #f0f0f0;
        color: #007bff;
    }
    .sidebar ul li a i {
        margin-right: 10px;
    }
    .logout-button {
    	margin-top: auto;
    	width: 100%;
}
    .main-content {
        padding: 2rem;
    }
    .card {
        border-radius: 0.75rem;
        border: none;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    }
    .card-header {
        background-color: #f8f9fa;
        font-weight: 600;
        font-size: 1.25rem;
    }
    .card-body p {
        font-size: 1rem;
        margin-bottom: 0.5rem;
    }
    .profit-summary-card {
        background-color: #fff3cd;
        border-left: 5px solid #ffc107;
        padding: 1.5rem;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        border-radius: 0.5rem;
    }
    .profit-summary-card-header h3 {
        font-weight: 600;
        color: #856404;
        margin-bottom: 1rem;
    }
    .profit-summary-card-body {
        font-size: 2rem;
        color: #212529;
        font-weight: bold;
    }
    .alert {
        margin-top: 2rem;
    }
</style>

</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 sidebar">
                <h2>System Auditor</h2>
                <ul>
                    <li><a href="../ViewReportsServlet"><i class="fas fa-file-alt"></i> View Reports</a></li>
                   
                </ul>
                <%
                   
                    if (session.getAttribute("user") != null) {
                %>
                    <a href="../LogoutServlet" class="btn btn-danger logout-button">Logout</a>
                <%
                    } else {
                    	
                %>
                
                     <a href="user/login.jsp" class="btn btn-primary">Login</a>
                <%
                    }
                %>
            </div>
            <div class="col-md-10 main-content">
                <div class="dashboard-header">
                    <h1>Welcome to the System Auditor Dashboard</h1>
                </div>
                <div class="row mt-5">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Stock Overview (Received)</h3>
                            </div>
                            <div class="card-body">
                                <%
                                    LocalDate today = LocalDate.now();
                                    int month = today.getMonthValue();
                                    int year = today.getYear();
                                    LocalDate startOfMonth = today.withDayOfMonth(1);
                                    LocalDate endOfMonth = today.withDayOfMonth(today.lengthOfMonth());
                                    String dateRange = startOfMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " to " + endOfMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

                                    Connection connection = null;
                                    PreparedStatement preparedStatement = null;
                                    ResultSet resultSet = null;
                                    double totalCost = 0;
                                    int totalQuantity = 0;

                                    try {
                                        connection = DBconnection.getConnection();
                                       
                                        String query = "SELECT SUM(quantity_ordered) AS totalQuantity, SUM(total_price) AS totalCost " +
                                                       "FROM stock_orders " +
                                                       "WHERE MONTH(received_date) = ? AND YEAR(received_date) = ?";
                                        preparedStatement = connection.prepareStatement(query);
                                        preparedStatement.setInt(1, month);
                                        preparedStatement.setInt(2, year);
                                        resultSet = preparedStatement.executeQuery();

                                        if (resultSet.next()) {
                                            totalQuantity = resultSet.getInt("totalQuantity");
                                            totalCost = resultSet.getDouble("totalCost");
                                        }
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    } finally {
                                        try {
                                            if (resultSet != null) resultSet.close();
                                            if (preparedStatement != null) preparedStatement.close();
                                            if (connection != null) connection.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                %>
                                 <b>
                                <p>Date Range: <%= dateRange %></p>
                                <p>Total Quantity Received: <%= totalQuantity %></p>
                               <p>Total Amount Spent: $<%= totalCost %></p>
                               </b>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Stock Overview (Released)</h3>
                            </div>
                            <div class="card-body">
                                <%
                                    LocalDate todayReleased = LocalDate.now();
                                    int monthReleased = todayReleased.getMonthValue();
                                    int yearReleased = todayReleased.getYear();
                                    LocalDate startOfMonthReleased = todayReleased.withDayOfMonth(1);
                                    LocalDate endOfMonthReleased = todayReleased.withDayOfMonth(todayReleased.lengthOfMonth());
                                    String dateRangeReleased = startOfMonthReleased.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " to " + endOfMonthReleased.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

                                    Connection connectionReleased = null;
                                    PreparedStatement preparedStatementReleased = null;
                                    ResultSet resultSetReleased = null;
                                    double totalGain = 0;
                                    int totalQuantityReleased = 0;

                                    try {
                                        connectionReleased = DBconnection.getConnection();
                                       
                                        String queryReleased = "SELECT SUM(quantity) AS totalQuantityReleased, SUM(total_price) AS totalGain " +
                                                       "FROM orders " +
                                                       "WHERE MONTH(orderDate) = ? AND YEAR(orderDate) = ? AND order_status = 'Shipped'";
                                        preparedStatementReleased = connectionReleased.prepareStatement(queryReleased);
                                        preparedStatementReleased.setInt(1, monthReleased);
                                        preparedStatementReleased.setInt(2, yearReleased);
                                        resultSetReleased = preparedStatementReleased.executeQuery();

                                        if (resultSetReleased.next()) {
                                            totalQuantityReleased = resultSetReleased.getInt("totalQuantityReleased");
                                            totalGain = resultSetReleased.getDouble("totalGain");
                                        }
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    } finally {
                                        try {
                                            if (resultSetReleased != null) resultSetReleased.close();
                                            if (preparedStatementReleased != null) preparedStatementReleased.close();
                                            if (connectionReleased != null) connectionReleased.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    
                                    session.setAttribute("profit", totalGain - totalCost);
                                %>
                                 <b>
                                <p>Date Range: <%= dateRangeReleased %></p>
                                <p>Total Quantity Released: <%= totalQuantityReleased %></p>
                               <p>Total Amount Gained: $<%= totalGain %></p>
                               </b>
                                
                                
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
                
              <div class="row mt-5">
    <div class="col-md-6 offset-md-3">
        <div class="profit-summary-card">
            <div class="profit-summary-card-header">
                <h3>Profit Summary</h3>
            </div>
            <div class="profit-summary-card-body">
                $<%= String.format("%.2f", totalGain - totalCost) %>
            </div>
        </div>
    </div>
</div>

                
                
                 <% if (session.getAttribute("loginError") != null) { %>
                    <div class="alert alert-success" role="alert">
                        <%= session.getAttribute("loginError") %>
                        <% session.removeAttribute("loginError"); %> 
                    </div>
                <% } %>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
