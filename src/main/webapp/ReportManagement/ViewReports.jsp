<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ReportPackage.ReportModel" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Reports</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .container {
        margin-top: 40px;
        max-width: 960px;
    }

    .card {
        border-radius: 10px;
        border: none;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
    }

    .card-header {
        background-color: #ffedd5;
        border-bottom: none;
        border-radius: 10px 10px 0 0;
        text-align: center;
    }

    .card-title {
        font-size: 24px;
        color: #d35400;
        margin-bottom: 0;
    }

    .card-body {
        background-color: #ffffff;
        border-radius: 0 0 10px 10px;
    }

    .table th, .table td {
        vertical-align: middle;
    }

    .btn-primary {
        background-color: #d35400;
        border-color: #d35400;
    }

    .btn-primary:hover {
        background-color: #a84300;
        border-color: #a84300;
    }

    .btn-update {
        background-color: #28a745;
        border-color: #28a745;
        color: #fff;
    }

    .btn-update:hover {
        background-color: #218838;
        border-color: #218838;
    }

    .btn-delete {
        background-color: #dc3545;
        border-color: #dc3545;
        color: #fff;
    }

    .btn-delete:hover {
        background-color: #c82333;
        border-color: #c82333;
    }

    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
        color: #fff;
        margin-top: 20px;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
        border-color: #545b62;
    }

    .alert {
        margin-top: 20px;
    }

    .actions-container {
        display: flex;
        gap: 10px;
        justify-content: center;
    }

    @media (max-width: 576px) {
        .actions-container {
            flex-direction: column;
        }
    }
</style>

    <script>
        function printReport(reportId) {
            // Use JavaScript to open a new window/tab with the report content
            var printWindow = window.open('', '_blank');
            printWindow.document.write('<html><head><title>Print Report</title>');
            printWindow.document.write('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">'); // Include Bootstrap for styling
            printWindow.document.write('<style>body{padding: 20px;}</style>');
            printWindow.document.write('</head><body>');

            // Fetch the report content
            var reportContent = document.getElementById('reportContent_' + reportId).innerHTML;
            printWindow.document.write(reportContent);

            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Report List</h2>
            </div>
            <div class="card-body">
                <%
                    List<ReportModel> reportList = (List<ReportModel>) request.getAttribute("reportList");
                    if (reportList != null && !reportList.isEmpty()) {
                %>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Report ID</th>
                                <th>Report Name</th>
                                <th>Report Date</th>
                                <th>View Report</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (ReportModel report : reportList) {
                            %>
                            <tr>
                                <td><%= report.getrId() %></td>
                                <td><%= report.getrName() %></td>
                                <td><%= report.getrDate() %></td>
                                <td>
                                    <button class="btn btn-primary"
                                            onclick="window.location.href='ViewReportServlet?rId=<%= report.getrId() %>'">
                                        View Report
                                    </button>
                                </td>
                                 <td>
                                    <div class="actions-container">
                                        <button class="btn btn-update" onclick="window.location.href='UpdateReportServlet?rId=<%= report.getrId() %>'">Update</button>
                                        <button class="btn btn-delete" onclick="window.location.href='DeleteReportServlet?rId=<%= report.getrId() %>'">Delete</button>
                                    </div>
                                </td>
                            </tr>
                            <tr style="display:none;">
                                <td colspan="5" id="reportContent_<%= report.getrId() %>">
                                    <b>Report Name:</b> <%= report.getrName() %><br>
                                    <b>Report Date:</b> <%= report.getrDate() %><br>
                                    <b>Report Content:</b><br>
                                    <p><%= report.getrContent() %></p>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
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
                 <!-- <button class="btn btn-secondary" onclick="window.location.href='create_report.jsp'">Generate New Report</button> -->
                 <a href="ReportManagement/create_report.jsp" class="btn btn-primary" id="view-stock-btn-other">Add Stock</a>
                 <a href="HomePage.jsp" class="btn btn-primary" id="view-stock-btn-other">Back to HomePage</a>
                  <!-- <button class="btn btn-secondary" onclick="window.location.href='../HomePage.jsp'">Back To HomePage</button> -->
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
