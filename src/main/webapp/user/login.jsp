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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    

    <style>
        :root {
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --bg: linear-gradient(135deg, #f8fbff, #9599f6); /* Blue to purple */
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

        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 380px;
        }

        h2 {
            font-size: 1.75rem;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 600;
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
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Sign In</h2>


			<form action="<c:url value='/LoginServlet'/>" method="post" novalidate>
			    <c:if test="${not empty loginError}">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
					${loginError}
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
			    </c:if>
				<p class="text-center text-muted mt-3" style="font-size: 0.9rem;">
				    For Admins & Staff only
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
