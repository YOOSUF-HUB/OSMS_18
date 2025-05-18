<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="StockOrderManagement.*" %>
<%@ page import="UserPackage.UserModel" %>

<%@ include file="../user/loginAuthentication.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>System Auditor Dashboard</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Font & base palette -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --bg: #f9fafb;
            --sidebar-bg: #ffffff;
            --accent: #0d6efd;
            --text: #212529;
            --muted: #6c757d;
            --shadow: 0 2px 6px rgba(0,0,0,.05);
        }
        * { box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg);
            color: var(--text);
        }
        a { text-decoration: none; color: inherit; }
        .sidebar {
            width: 230px;
            height: 100vh;
            background: var(--sidebar-bg);
            box-shadow: var(--shadow);
            display: flex;
            flex-direction: column;
        }
        .sidebar .nav-link {
            padding: .75rem 1rem;
            border-radius: .5rem;
            color: var(--muted);
            transition: background .2s;
        }
        .sidebar .nav-link.active,
        .sidebar .nav-link:hover {
            background: var(--bg);
            color: var(--accent);
        }
        .content {
            flex: 1;
            padding: 2rem 3rem;
        }
        .card {
            border: none;
            border-radius: .75rem;
            box-shadow: var(--shadow);
        }
        .profit-card {
            background: #fffbea;
            border-left: 5px solid #ffec3d;
        }
        .profit-card h2 {
            font-weight: 600;
            font-size: 2rem;
        }
        @media(max-width: 992px){
            .sidebar{position:fixed;z-index:1000;transform:translateX(-100%);transition:transform .3s}
            .sidebar.show{transform:translateX(0)}
        }
    </style>
</head>
<body>
<div class="d-flex">
    <!-- Sidebar -->
    <nav class="sidebar p-3" id="sidebarMenu">
        <h4 class="fw-semibold mb-4">Auditor</h4>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="../ViewReportsServlet" class="nav-link">
                    <i class="bi bi-file-earmark-text me-2"></i>Reports
                </a>
            </li>
        </ul>
        <div class="mt-auto">
            <a href="../LogoutServlet" class="btn btn-outline-danger w-100">
                <i class="bi bi-box-arrow-right me-1"></i>Logout
            </a>
        </div>
    </nav>

    <!-- Content -->
    <div class="content">
        <button class="btn d-lg-none mb-3" id="toggleSidebar"><i class="bi bi-list" style="font-size:1.5rem;"></i></button>
        <h1 class="fw-semibold mb-4">System Auditor Dashboard</h1>

        <div class="row g-4">
            <!-- Stock Received -->
            <div class="col-md-6">
                <div class="card p-4">
                    <h5 class="fw-semibold mb-3">Stock Received</h5>
                    <div>
                        <%
                            LocalDate today = LocalDate.now();
                            int month = today.getMonthValue();
                            int year = today.getYear();
                            LocalDate startOfMonth = today.withDayOfMonth(1);
                            LocalDate endOfMonth = today.withDayOfMonth(today.lengthOfMonth());
                            String dateRange = startOfMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " – " + endOfMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

                            java.sql.Connection c = null;
                            java.sql.PreparedStatement ps = null;
                            java.sql.ResultSet rs = null;
                            double totalCost = 0;
                            int totalQty = 0;
                            try {
                                c = DBconnection.getConnection();
                                String q = "SELECT SUM(quantity_ordered) totalQty, SUM(total_price) totalCost FROM stock_orders WHERE MONTH(received_date)=? AND YEAR(received_date)=?";
                                ps = c.prepareStatement(q);
                                ps.setInt(1, month);
                                ps.setInt(2, year);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    totalQty = rs.getInt("totalQty");
                                    totalCost = rs.getDouble("totalCost");
                                }
                            } catch(Exception e){e.printStackTrace();}
                            finally{ if(rs!=null)rs.close(); if(ps!=null)ps.close(); if(c!=null)c.close(); }
                        %>
                        <p class="text-muted mb-1">Period: <%=dateRange%></p>
                        <p class="mb-1">Quantity: <strong><%=totalQty%></strong></p>
                        <p>Total Cost: <strong>$<%=String.format("%.2f",totalCost)%></strong></p>
                    </div>
                </div>
            </div>

            <!-- Stock Released -->
            <div class="col-md-6">
                <div class="card p-4">
                    <h5 class="fw-semibold mb-3">Stock Released</h5>
                    <div>
                        <%
                            LocalDate todayRel = LocalDate.now();
                            int mRel = todayRel.getMonthValue();
                            int yRel = todayRel.getYear();
                            LocalDate startRel = todayRel.withDayOfMonth(1);
                            LocalDate endRel = todayRel.withDayOfMonth(todayRel.lengthOfMonth());
                            String drRel = startRel.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " – " + endRel.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

                            java.sql.Connection c2 = null;
                            java.sql.PreparedStatement ps2 = null;
                            java.sql.ResultSet rs2 = null;
                            double totalGain = 0;
                            int totalQtyRel = 0;
                            try {
                                c2 = DBconnection.getConnection();
                                String q2 = "SELECT SUM(quantity) totalQtyRel, SUM(total_price) totalGain FROM orders WHERE MONTH(orderDate)=? AND YEAR(orderDate)=? AND order_status='Shipped'";
                                ps2 = c2.prepareStatement(q2);
                                ps2.setInt(1, mRel);
                                ps2.setInt(2, yRel);
                                rs2 = ps2.executeQuery();
                                if(rs2.next()){
                                    totalQtyRel = rs2.getInt("totalQtyRel");
                                    totalGain = rs2.getDouble("totalGain");
                                }
                            } catch(Exception e){e.printStackTrace();}
                            finally{ if(rs2!=null)rs2.close(); if(ps2!=null)ps2.close(); if(c2!=null)c2.close(); }
                            session.setAttribute("profit", totalGain - totalCost);
                        %>
                        <p class="text-muted mb-1">Period: <%=drRel%></p>
                        <p class="mb-1">Quantity: <strong><%=totalQtyRel%></strong></p>
                        <p>Total Gain: <strong>$<%=String.format("%.2f",totalGain)%></strong></p>
                    </div>
                </div>
            </div>

            <!-- Profit -->
            <div class="col-12">
                <div class="card profit-card text-center p-5">
                    <p class="mb-2 fw-semibold text-uppercase small text-muted">Profit This Month</p>
                    <h2>$<%=String.format("%.2f", (session.getAttribute("profit")!=null) ? (double)session.getAttribute("profit") : 0)%></h2>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const sidebar = document.getElementById('sidebarMenu');
    document.getElementById('toggleSidebar').addEventListener('click',()=>sidebar.classList.toggle('show'));
</script>
</body>
</html>
