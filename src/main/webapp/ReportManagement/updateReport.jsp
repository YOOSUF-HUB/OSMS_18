<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ReportPackage.ReportModel" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Report</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .card {
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #f0f0f0;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        .card-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }
        .card-body {
            padding: 20px;
        }
        .form-group label {
            font-weight: bold;
            color: #555;
        }
        .btn-primary {
            background-color: #007BFF;
            border-color: #007BFF;
            margin-top: 5px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-secondary {
            margin-top: 5px;
        }
        .button-container { 
            display: flex;
            justify-content: flex-start; 
            align-items: ; 
            gap: 10px; 
            margin-top: 10px;
            border-radius: 10px; 
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Update Report</h2>
            </div>
            <div class="card-body">
                <%
                    ReportModel report = (ReportModel) request.getAttribute("report");
                    if (report != null) {
                %>
                <form action="UpdateReportServlet" method="post">
                    <input type="hidden" name="rId" value="<%= report.getrId() %>">
                    <div class="form-group">
                        <label for="rName">Report Name:</label>
                        <input type="text" class="form-control" id="rName" name="rName" value="<%= report.getrName() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="rDate">Report Date:</label>
                        <input type="date" class="form-control" id="rDate" name="rDate" value="<%= report.getrDate() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="rContent">Report Content:</label>
                        <textarea class="form-control" id="rContent" name="rContent" rows="5" required><%= report.getrContent() %></textarea>
                    </div>
                    <div class = "button-container">
                    <button type="submit" class="btn btn-primary">Update Report</button>
                    <a href="ViewReportsServlet" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
                <%
                    } else {
                %>
                <div class="alert alert-danger" role="alert">
                    Report not found.
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>