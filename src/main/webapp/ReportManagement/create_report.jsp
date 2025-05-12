<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Generate New Report</title>
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
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            border-radius: 0.5rem;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            padding: 1rem 1.5rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.125);
            border-radius: 0.5rem 0.5rem 0 0;
        }
        .card-title {
            font-size: 1.5rem;
            margin-bottom: 0;
        }
        .card-body {
            padding: 1.5rem;
        }
        .form-group label {
            font-weight: bold;
            color: #343a40;
            margin-bottom: 0.5rem;
        }
        .form-control {
            border-radius: 0.25rem;
        }
        .form-control-file {
            padding-top: 0.375rem;
            padding-bottom: 0.375rem;
        }
        .btn-primary {
            border-radius: 0.25rem;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .text-center {
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2 class="card-title text-center">Generate New Report</h2>
                    </div>
                    <div class="card-body">
                        <form action="../CreateReportServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="rName">Report Name</label>
                                <input type="text" class="form-control" id="rName" name="rName" required>
                            </div>
                            <div class="form-group">
                                <label for="rDate">Report Date</label>
                                <input type="date" class="form-control" id="rDate" name="rDate" required>
                            </div>
                            <div class="form-group">
                                <label for="rCategory">Category</label>
                                <select class="form-control" id="rCategory" name="rCategory">
                                    <option value="Financial">Financial</option>
                                    <option value="Sales">Sales</option>
                                    <option value="Performance">Performance</option>
                                    <option value="Bug Report">Bug Report</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="rStatus">Status</label>
                                <select class="form-control" id="rStatus" name="rStatus">
                                    <option value="Draft">Draft</option>
                                    <option value="Published">Published</option>
                                    <option value="Archived">Archived</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="reportFile">Upload Report File</label>
                                <input type="file" class="form-control-file" id="reportFile" name="reportFile" required>
                            </div>
                            <div class="form-group">
                                <label for="rContentSummary">Report Summary</label>
                                <textarea class="form-control" id="rContentSummary" name="rContentSummary" rows="3"></textarea>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Generate Report</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>