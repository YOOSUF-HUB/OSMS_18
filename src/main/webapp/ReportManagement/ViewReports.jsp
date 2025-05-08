<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ReportPackage.ReportModel" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Management Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .dashboard-header {
            background-color: #343a40;
            color: white;
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .summary-card {
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .summary-card-header {
            background-color: #f0f0f0;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        .summary-card-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }
        .summary-card-body {
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .summary-icon {
            font-size: 40px;
            color: #007BFF;
        }
        .summary-value {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        .report-list-card {
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .report-list-card-header {
            background-color: #f0f0f0;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        .report-list-card-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }
        .report-list-card-body {
            padding: 20px;
        }
        .table-responsive {
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #007BFF;
            border-color: #007BFF;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-update {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
        }
        .btn-update:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-delete {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
        }
        .btn-delete:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
        .actions-container {
            display: flex;
            gap: 5px;
            justify-content: center;
        }
        .create-report-button {
            margin-top: 20px;
            text-align: center;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
    <script>
        function printReport(reportId) {
            var printWindow = window.open('', '_blank');
            printWindow.document.write('<html><head><title>Print Report</title>');
            printWindow.document.write('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">');
            printWindow.document.write('<style>body{padding: 20px;}</style>');
            printWindow.document.write('</head><body>');
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
    <div class="container-fluid">
        <div class="dashboard-header">
            <h1>Report Management Dashboard</h1>
        </div>
        <div class="row">
            <div class="col-md-4">
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
            
            
        </div>
        <div class="report-list-card">
            <div class="report-list-card-header">
                <h2 class="report-list-card-title">Report List</h2>
            </div>
            <div class="report-list-card-body">
                <%
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
            </div>
        </div>
        <div class="create-report-button">
           <a href="ReportManagement/create_report.jsp" class="btn btn-primary" id="view-stock-btn-other">Generate New Report</a>
           <a href="HomePage.jsp" class="btn btn-primary" id="view-stock-btn-other">Back to HomePage</a>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
