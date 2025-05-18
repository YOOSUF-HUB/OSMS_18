<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ReportPackage.ReportModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Report Management Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            padding: 2rem;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
            margin-bottom: 2rem;
            width: 100%; 
        }
        .summary-card {
            margin-top: 1rem;
            border: 1px solid #ced4da;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        }
        .summary-card-header {
            background-color: #e9ecef;
            padding: 1rem;
            border-bottom: 1px solid #ced4da;
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }
        .summary-card-title {
            font-size: 1.25rem;
            font-weight: bold;
            color: #495057;
            margin-bottom: 0;
        }
        .summary-card-body {
            padding: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .summary-icon {
            font-size: 2.5rem;
            color: #007bff;
        }
        .summary-value {
            font-size: 2rem;
            font-weight: bold;
            color: #343a40;
        }
        .report-list-card {
            margin-top: 2rem;
            border: 1px solid #ced4da;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        }
        .report-list-card-header {
            background-color: #e9ecef;
            padding: 1rem;
            border-bottom: 1px solid #ced4da;
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }
        .report-list-card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #495057;
            margin-bottom: 0;
        }
        .report-list-card-body {
            padding: 1.5rem;
        }
        .table-responsive {
            margin-top: 1rem;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 0.25rem;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
            color: white;
            border-radius: 0.25rem;
        }
        .btn-info:hover {
            background-color: #138496;
            border-color: #138496;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
            border-radius: 0.25rem;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
            border-radius: 0.25rem;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
        .actions-container {
            display: flex;
            gap: 0.5rem;
            justify-content: center;
        }
        .create-report-button {
            margin-top: 2rem;
            text-align: center;
        }
        .alert {
            margin-top: 1rem;
        }
        .search-container {
            margin-bottom: 1rem;
            display: flex;
            justify-content: flex-end;
        }
        .search-input {
            width: 200px;
            border-radius: 0.25rem;
            border: 1px solid #ced4da;
            padding: 0.5rem;
            font-size: 1rem;
        }
        .search-button {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
            border-radius: 0.25rem;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            margin-left: 0.5rem;
            cursor: pointer;
        }
        .search-button:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
    <script>
        function viewReport(reportId) {
            window.location.href = 'ViewReportServlet?rId=' + reportId;
        }
    </script>
</head>
<body>
    <div class="container-fluid">
        <div class="dashboard-header">
            <h1>Report Management Dashboard</h1>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="summary-card">
                    <div class="summary-card-header">
                        <h3 class="summary-card-title">Total Reports</h3>
                    </div>
                    <div class="summary-card-body">
                        <i class="fas fa-file-alt summary-icon"></i>
                        <span class="summary-value">
                            <%
                                List<ReportModel> reportList = (List<ReportModel>) request.getAttribute("reportList");
                                if (reportList != null) {
                                    out.print(reportList.size());
                                } else {
                                    out.print("0");
                                }
                            %>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="summary-card">
                    <div class="summary-card-header">
                        <h3 class="summary-card-title">Published Reports</h3>
                    </div>
                    <div class="summary-card-body">
                        <i class="fas fa-check-circle summary-icon" style="color: #28a745;"></i>
                        <span class="summary-value">
                            <%
                                if (reportList != null) {
                                    long publishedCount = reportList.stream().filter(r -> "Published".equals(r.getrStatus())).count();
                                    out.print(publishedCount);
                                } else {
                                    out.print("0");
                                }
                            %>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="report-list-card">
            <div class="report-list-card-header">
                <h2 class="report-list-card-title">Report List</h2>
            </div>
            <div class="report-list-card-body">
                <div class="search-container">
                    <input type="text" id="searchBox" class="search-input" placeholder="Search by Report Name" oninput="searchReports()">
                    <button class="search-button" onclick="searchReports()">Search</button>
                </div>
                <%
                    if (reportList != null && !reportList.isEmpty()) {
                %>
                <div class="table-responsive" id="reportTableContainer">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Report ID</th>
                                <th>Report Name</th>
                                <th>Category</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Author</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="reportTableBody">
                            <%
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
                                    <div class="actions-container">
                                        <button class="btn btn-info btn-sm" onclick="viewReport(<%= report.getrId() %>)">View</button>
                                        <button class="btn btn-success btn-sm" onclick="window.location.href='UpdateReportServlet?rId=<%= report.getrId() %>'">Update</button>
                                       <button class="btn btn-danger btn-sm" onclick="handleDelete(event, <%= report.getrId() %>)">Delete</button>



                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div id="noReportsMessage" class="alert alert-info" style="display:none;" role="alert">
                    No reports found matching your search criteria.
                </div>
                <%
                    } else {
                %>
                <div class="alert alert-info" role="alert">
                    No reports available.
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <div class="create-report-button">
           <a href="ReportManagement/create_report.jsp" class="btn btn-primary m-2">Generate New Report</a>
           <a href="ReportManagement/systemauditor.jsp" class="btn btn-secondary m-2">Back to Dashboard</a>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    
    
    function handleDelete(event, reportId) {
      if (confirm('Are you sure you want to delete this report?')) {
        window.location.href = 'DeleteReportServlet?rId=' + reportId;
      } else {
        event.preventDefault(); 
      }
    }
   
    
    
        function viewReport(reportId) {
            window.location.href = 'ViewReportServlet?rId=' + reportId;
        }

        function searchReports() {
            var input, filter, table, tr, td, i, txtValue, found;
            input = document.getElementById("searchBox");
            filter = input.value.toUpperCase();
            table = document.getElementById("reportTableBody");
            tr = table.getElementsByTagName("tr");
            found = false;
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; 
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        found = true;
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
            if (!found) {
                document.getElementById("noReportsMessage").style.display = "block";
            } else {
                document.getElementById("noReportsMessage").style.display = "none";
            }
        }

        
        document.getElementById("searchBox").addEventListener("input", searchReports);
    </script>
</body>
</html>
