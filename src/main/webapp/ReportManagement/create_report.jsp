<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Generate New Report</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: #ffffff;
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            background: linear-gradient(45deg, #FF6B6B, #FF8E53);
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .card-title {
            font-size: 26px;
            margin: 0;
            font-weight: 600;
        }
        .card-body {
            padding: 30px;
        }
        .form-group label {
            font-weight: 600;
            color: #333;
        }
        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
        }
        .form-control:focus {
            border-color: #FF6B6B;
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.25);
        }
        .btn-primary {
            background: linear-gradient(45deg, #FF6B6B, #FF8E53);
            border: none;
            padding: 10px 25px;
            font-weight: 600;
            border-radius: 30px;
            transition: background 0.3s, transform 0.2s;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #FF8E53, #FF6B6B);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title">Generate New Report</h2>
                </div>
                <div class="card-body">
                    <form action="../CreateReportServlet" method="post">
                        <div class="form-group">
                            <label for="rName">Report Name</label>
                            <input type="text" class="form-control" id="rName" name="rName" required>
                        </div>
                        <div class="form-group">
                            <label for="rDate">Report Date</label>
                            <input type="date" class="form-control" id="rDate" name="rDate" required>
                        </div>
                        <div class="form-group">
                            <label for="rContent">Report Content</label>
                            <textarea class="form-control" id="rContent" name="rContent" rows="5" required></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Generate Report</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
