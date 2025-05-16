<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login User</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
  <style>
    body {
      background: #f5f7fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .login-card {
      max-width: 400px;
      width: 100%;
      background: #ffffff;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      padding: 30px 25px;
    }

    h1 {
      font-weight: 600;
      color: #212529;
      margin-bottom: 30px;
      text-align: center;
      letter-spacing: 0.05em;
    }

    label.form-label {
      font-weight: 500;
      color: #495057;
    }

    .btn-primary {
      width: 100%;
      font-weight: 600;
      padding: 10px 0;
      letter-spacing: 0.05em;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }

    .alert {
      font-size: 0.9rem;
      margin-bottom: 20px;
      border-radius: 5px;
      padding: 12px 15px;
    }
  </style>
</head>
<body>
  <form action="../LoginServlet" method="post" class="login-card">
    <h1>Login</h1>
    <p>Login to TechNest Using your Corporate Account</p>

    <% if (request.getAttribute("loginError") != null) { %>
      <div class="alert alert-danger" role="alert">
        <%= request.getAttribute("loginError") %>
      </div>
    <% } %>

    <div class="mb-4">
      <label for="gmail" class="form-label">Email Address</label>
      <input type="email" id="gmail" name="gmail" class="form-control" placeholder="Enter your Email Address" required />
    </div>

    <div class="mb-4">
      <label for="password" class="form-label">Password</label>
      <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required />
    </div>

    <button type="submit" class="btn btn-primary">Login</button>
  </form>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
          crossorigin="anonymous"></script>
</body>
</html>
