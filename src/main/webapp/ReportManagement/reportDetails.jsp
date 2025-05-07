<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ReportPackage.ReportModel" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 40px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #343a40;
            color: #ffffff;
            padding: 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-title {
            font-size: 26px;
            font-weight: bold;
            margin: 0;
        }
        .card-body {
            padding: 30px;
        }
        .report-title {
            font-size: 22px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 10px;
        }
        .report-date {
            font-size: 16px;
            color: #6c757d;
            margin-bottom: 20px;
        }
        .report-content {
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 6px;
            font-size: 16px;
            color: #212529;
        }
        .btn-custom {
            padding: 10px 20px;
            font-weight: 500;
            font-size: 15px;
        }
    </style>
    <script>
        function printReport() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="container">
        <%
            ReportModel report = (ReportModel) request.getAttribute("report");
            if (report != null) {
        %>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Report Details</h2>
            </div>
            <div class="card-body">
                <h3 class="report-title"><%= report.getrName() %></h3>
                <p class="report-date"><strong>Report Date:</strong> <%= report.getrDate() %></p>
                <div class="report-content">
                    <%= report.getrContent() %>
                </div>
                <div class="mt-4">
                    <button class="btn btn-info btn-custom" onclick="printReport()">Print Report</button>
                    <a href="ViewReportsServlet" class="btn btn-secondary btn-custom ml-2">Back to List</a>
                </div>
            </div>
        </div>
        <%
            } else {
        %>
        <div class="alert alert-danger mt-5" role="alert">
            Report not found.
        </div>
        <%
            }
        %>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
