<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../user/loginAuthentication.jsp" %>
<%@ page import="ReportPackage.ReportModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Report Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            padding: 1rem 1.5rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.125);
            border-radius: 0.5rem 0.5rem 0 0;
        }
        .card-title {
            font-size: 1.75rem;
            font-weight: bold;
            margin-bottom: 0;
        }
        .card-body {
            padding: 1.5rem;
        }
        .detail-row {
            margin-bottom: 1rem;
            padding: 0.75rem 0;
            border-bottom: 1px solid #dee2e6;
        }
        .detail-row:last-child {
            border-bottom: none;
        }
        .detail-label {
            font-weight: bold;
            color: #495057;
            margin-right: 0.5rem;
        }
        .detail-value {
            color: #343a40;
        }
        .report-content-area {
            padding: 1rem;
            background-color: #e9ecef;
            border-radius: 0.25rem;
            margin-top: 1rem;
            white-space: pre-wrap; 
        }
        .btn-primary {
            border-radius: 0.25rem;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
        }
        .btn-secondary {
            border-radius: 0.25rem;
            padding: 0.75rem 1.5rem;
        }
        .mt-3 {
            margin-top: 1.5rem;
        }
        .alert {
            margin-top: 2rem;
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
                <div class="detail-row">
                    <span class="detail-label">Report Name:</span>
                    <span class="detail-value"><%= report.getrName() %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Report Date:</span>
                    <span class="detail-value"><%= report.getrDate() %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Category:</span>
                    <span class="detail-value"><%= report.getrCategory() %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Status:</span>
                    <span class="detail-value"><%= report.getrStatus() %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Author:</span>
                    <span class="detail-value"><%= report.getrAuthor() %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">File:</span>
                    <% if (report.getrFilePath() != null && !report.getrFilePath().isEmpty()) { %>
                        <span class="detail-value"><a href="<%= report.getrFilePath().replace("\\", "/") %>" target="_blank">View File</a></span>
                    <% } else { %>
                        <span class="detail-value">No file uploaded</span>
                    <% } %>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Summary:</span>
                    <p class="detail-value"><%= report.getrContentSummary() != null ? report.getrContentSummary() : "No summary available" %></p>
                </div>

                <% if (report.getrContent() != null) { %>
                    <div class="mt-3">
                        <h5 class="detail-label">Content:</h5>
                        <div class="report-content-area">
                            <%= report.getrContent() != null ? report.getrContent() : "No content available" %>
                        </div>
                    </div>
                <% } %>

                <div class="mt-3">
                    <button class="btn btn-primary" onclick="printReport()">Print Report</button>
                    <a href="ViewReportsServlet" class="btn btn-secondary ml-2">Back to List</a>
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