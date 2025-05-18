<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/loginAuthentication.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 3rem;
        }
        .card-total {
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        .table-container {
            margin-top: 2rem;
            border-radius: 0.5rem;
            overflow: hidden;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        .table th, .table td {
            padding: 0.75rem;
            vertical-align: middle;
            border-color: #dee2e6;
        }
        .btn-action {
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">User Administration</h2>

        <div class="row justify-content-center mb-4">
            <div class="col-md-6">
                <div class="card card-total">
                    <div class="card-body text-center">
                        <h6 class="card-subtitle mb-2 text-muted">Total Users</h6>
                        <p class="card-text display-5"><c:out value="${totalUsers}" default="0"/></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-container">
            <c:if test="${not empty users}">
                <table class="table table-hover mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>
                                    <span class="badge bg-secondary">${user.role}</span>
                                </td>
                                <td class="text-end">
                                    <a href="UpdateUserServlet?id=${user.id}" class="btn btn-sm btn-outline-primary btn-action">Edit</a>
                                    <a href="DeleteUserServlet?id=${user.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty users}">
                <p class="text-center py-3">No users found.</p>
            </c:if>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <a href="user/RegisterUser.jsp" class="btn btn-success">Add New User</a>
            <a href="user/adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</body>
</html>