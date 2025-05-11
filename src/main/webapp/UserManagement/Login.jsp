<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 0 1rem rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>

    <div class="card col-md-4">
        <h3 class="text-center mb-4">User Login</h3>
        <form action="../LoginServlet" method="post">
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="user_email" name="user_email" placeholder="name@example.com" required>
                <label for="floatingEmail">Email address</label>
            </div>
            <div class="form-floating mb-4">
                <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Password" required>
                <label for="floatingPassword">Password</label>
            </div>
            <div class="d-grid mb-3">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
            <p class="text-center">
                Don't have an account? <a href="UserRegister.jsp">Register here</a>
            </p>
        </form>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
