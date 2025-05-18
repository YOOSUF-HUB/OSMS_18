<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ReportPackage.ReportModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Report Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9f9f9;
            color: #212529;
            padding: 2rem;
        }
        .dashboard-header {
            padding: 2rem 0;
            text-align: center;
        }
        .dashboard-header h1 {
            font-size: 2rem;
            font-weight: 600;
            margin: 0;
        }
        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        .summary-value {
            font-size: 2rem;
            font-weight: 600;
        }
        .summary-icon {
            font-size: 2rem;
            margin-right: 1rem;
        }
        .report-table th, .report-table td {
            vertical-align: middle;
        }
        .actions-container .btn {
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
        }
        .search-container {
            display: flex;
            justify-content: flex-end;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }
        .search-input {
            padding: 0.5rem;
            border-radius: 0.5rem;
            border: 1px solid #ced4da;
        }
        .btn-custom {
            border-radius: 0.5rem;
            font-weight: 500;
        }
        .alert {
            border-radius: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="dashboard-header">
        <h1>Report Dashboard</h1>
    </div>
    <div class="container">
        <div class="row g-4 mb-4">
            <div class="col-md-6">
                <div class="card p-3">
                    <div class="d-flex align-items-center">
                        <span class="summary-icon text-primary">📄</span>
                        <div>
                            <div class="text-muted">Total Reports</div>
                            <div class="summary-value">
                                <%
                                    List<ReportModel> reportList = (List<ReportModel>) request.getAttribute("reportList");
                                    out.print(reportList != null ? reportList.size() : 0);
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card p-3">
                    <div class="d-flex align-items-center">
                        <span class="summary-icon text-success">✅</span>
                        <div>
                            <div class="text-muted">Published Reports</div>
                            <div class="summary-value">
                                <%
                                    if (reportList != null) {
                                        long publishedCount = reportList.stream().filter(r -> "Published".equals(r.getrStatus())).count();
                                        out.print(publishedCount);
                                    } else {
                                        out.print("0");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2 class="h5 m-0">Report List</h2>
                <div class="search-container">
                    <input type="text" id="searchBox" class="search-input" placeholder="Search...">
                    <button class="btn btn-primary btn-custom" onclick="searchReports()">Search</button>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover report-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Author</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="reportTableBody">
                        <%
                            if (reportList != null && !reportList.isEmpty()) {
                                for (ReportModel report : reportList) {
                        %>
                        <tr>
                            <td><%= report.getrId() %></td>
                            <td><%= report.getrName() %></td>
                            <td><%= report.getrCategory() %></td>
                            <td><%= report.getrStatus() %></td>
                            <td><%= report.getrDate() %></td>
                            <td><%= report.getrAuthor() %></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-outline-primary btn-sm" onclick="viewReport(<%= report.getrId() %>)">View</button>
                                    <a href="UpdateReportServlet?rId=<%= report.getrId() %>" class="btn btn-outline-success btn-sm">Update</a>
                                    <button class="btn btn-outline-danger btn-sm" onclick="handleDelete(event, <%= report.getrId() %>)">Delete</button>
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="7" class="text-center">No reports available.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div id="noReportsMessage" class="alert alert-info mt-3 d-none">
                No reports found matching your search.
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="ReportManagement/create_report.jsp" class="btn btn-primary btn-custom me-2">+ New Report</a>
            <a href="ReportManagement/systemauditor.jsp" class="btn btn-secondary btn-custom">Back</a>
        </div>
    </div>
    <script>
        function viewReport(reportId) {
            window.location.href = 'ViewReportServlet?rId=' + reportId;
        }

        function handleDelete(event, reportId) {
            if (confirm('Delete this report?')) {
                window.location.href = 'DeleteReportServlet?rId=' + reportId;
            } else {
                event.preventDefault();
            }
        }

        function searchReports() {
            const input = document.getElementById("searchBox");
            const filter = input.value.toUpperCase();
            const rows = document.getElementById("reportTableBody").getElementsByTagName("tr");
            let found = false;

            for (let row of rows) {
                const cell = row.getElementsByTagName("td")[1];
                if (cell) {
                    const text = cell.textContent || cell.innerText;
                    if (text.toUpperCase().includes(filter)) {
                        row.style.display = "";
                        found = true;
                    } else {
                        row.style.display = "none";
                    }
                }
            }

            document.getElementById("noReportsMessage").classList.toggle("d-none", found);
        }

        document.getElementById("searchBox").addEventListener("input", searchReports);
    </script>
</body>
</html>