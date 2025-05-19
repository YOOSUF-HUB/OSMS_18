<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <style>
        :root {
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --bg: linear-gradient(135deg, #04b5b5, #374785);
            --text: #1f2937;
            --border: #e5e7eb;
            --danger: #f87171;
        }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-wrapper {
            background: white;
            border-radius: 1rem;
            overflow: hidden;
            width: 100%;
            max-width: 760px;
            height: 500px;
            display: flex;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .login-container {
            flex: 1;
            padding: 2rem;
        }

        .image-container {
            flex: 1;
            background-color: #f3f4f6;
            position: relative;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .image-container::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(37, 99, 235, 0.5), rgba(21, 39, 99, 0.7));
            z-index: 0;
        }

        .overlay-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 2.5rem;
            color: white;
            font-weight: bold;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
            z-index: 1;
            pointer-events: none;
        }

        .form-control {
            border: 1px solid var(--border);
            padding: 0.75rem;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.25);
        }

        .btn-primary {
            background-color: var(--primary);
            border: none;
            padding: 0.75rem;
            font-weight: 600;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
        }

        .alert-danger {
            background-color: #fee2e2;
            color: #991b1b;
            font-size: 0.9rem;
            border-radius: 0.5rem;
            padding: 0.75rem 1rem;
            margin-bottom: 1rem;
            text-align: center;
        }

        label {
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        @media (max-width: 767px) {
            .login-wrapper {
                flex-direction: column;
                height: auto;
            }

            .image-container {
                display: none;
            }
        }
    </style>
</head>
<body>

    <div class="login-wrapper">
        <div class="login-container">
            <!-- Company Logo + Sign In -->
            <div class="d-flex align-items-center justify-content-center mb-4">
                <img src="../image/Tech-Color.png" alt="Company Logo" style="height: 40px; margin-right: 0.75rem;" />
                <h2 class="m-0">TechNest</h2>
            </div>

            <form action="<c:url value='/LoginServlet'/>" method="post" novalidate>
                <c:if test="${not empty loginError}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${loginError}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <p class="text-center text-muted mt-3" style="font-size: 0.9rem;">
                    Sign In for Admins & Staff only
                </p>

                <div class="mb-3">
                    <label for="gmail" class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0">
                            <i class="fas fa-envelope text-muted"></i>
                        </span>
                        <input type="email" class="form-control border-start-0" id="gmail" name="gmail" required />
                    </div>
                </div>

                <div class="mb-4">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0">
                            <i class="fas fa-lock text-muted"></i>
                        </span>
                        <input type="password" class="form-control border-start-0" id="password" name="password" required />
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
        </div>

        <div class="image-container d-none d-md-block">
            <img src="https://images.unsplash.com/photo-1602837385569-08ac19ec83af?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcHV0ZXIlMjBwYXJ0c3xlbnwwfHwwfHx8MA%3D%3D" alt="Login Image" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
