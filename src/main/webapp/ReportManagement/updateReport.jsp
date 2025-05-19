<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ReportPackage.ReportModel" %>
<%
    request.setAttribute("requiredRole", "system auditor");
%>
<%@ include file="../user/loginAuthentication.jsp" %>


   
<%
        String name = loggedInUser.getName(); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Report</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
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
            background-color: #ffc107; 
            color: #343a40;
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
        .form-group label {
            font-weight: bold;
            color: #495057;
            margin-bottom: 0.5rem;
        }
        .form-control {
            border-radius: 0.25rem;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 0.25rem;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            margin-top: 1rem;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-secondary {
            border-radius: 0.25rem;
            padding: 0.75rem 1.5rem;
            margin-top: 1rem;
        }
        .button-container {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }
        .alert {
            margin-top: 2rem;
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
                <form action="UpdateReportServlet" method="post">  <input type="hidden" name="rId" value="<%= report.getrId() %>">
                    <div class="form-group">
                        <label for="rName">Report Name:</label>
                        <input type="text" class="form-control" id="rName" name="rName" value="<%= report.getrName() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="rDate">Report Date:</label>
                        <input type="date" class="form-control" id="rDate" name="rDate" value="<%= report.getrDate() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="rCategory">Category:</label>
                        <select class="form-control" id="rCategory" name="rCategory">
                            <option value="Financial" <%= "Financial".equals(report.getrCategory()) ? "selected" : "" %>>Financial</option>
                            <option value="Sales" <%= "Sales".equals(report.getrCategory()) ? "selected" : "" %>>Sales</option>
                            <option value="Performance" <%= "Performance".equals(report.getrCategory()) ? "selected" : "" %>>Performance</option>
                            <option value="Bug Report" <%= "Bug Report".equals(report.getrCategory()) ? "selected" : "" %>>Bug Report</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="rStatus">Status:</label>
                        <select class="form-control" id="rStatus" name="rStatus">
                            <option value="Draft" <%= "Draft".equals(report.getrStatus()) ? "selected" : "" %>>Draft</option>
                            <option value="Published" <%= "Published".equals(report.getrStatus()) ? "selected" : "" %>>Published</option>
                            <option value="Archived" <%= "Archived".equals(report.getrStatus()) ? "selected" : "" %>>Archived</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="reportFile">Report File:</label>
                        <input type="text" class="form-control-file" id="reportFile" name="reportFile" value="<%= report.getrFilePath() %>" readonly>
                        <small class="form-text text-muted">File path of the current file.  File cannot be changed here.</small>
                    </div>
                    <div class="form-group">
                        <label for="rContentSummary">Report Summary:</label>
                        <textarea class="form-control" id="rContentSummary" name="rContentSummary" rows="3"><%= report.getrContentSummary() != null ? report.getrContentSummary() : "" %></textarea>
                    </div>
                    <div class="form-group">
                        <label for="rContent">Report Updated Content:</label>
                        <textarea class="form-control" id="rContent" name="rContent" rows="5"><%= report.getrContent() != null ? report.getrContent() : "" %></textarea>
                    </div>

                    <div class="button-container">
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
