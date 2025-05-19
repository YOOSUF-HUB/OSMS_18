<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="UserPackage.UserModel" %>
<%
    request.setAttribute("requiredRole", "system admin");
%>
<%@ include file="loginAuthentication.jsp"%>


   
<%
        String name = loggedInUser.getName(); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Edit User</h1>
        <c:if test="${not empty user}">
            <form action="UpdateUserServlet" method="post" class="card p-4 shadow-sm">
                <input type="hidden" name="id" value="${user.id}">
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" value="${user.name}" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" value="${user.email}" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Leave blank to keep current password">
                    <small class="form-text text-muted">Leave the password field blank if you don't want to change it.</small>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone:</label>
                    <input type="tel" id="phone" name="phone" class="form-control" value="${user.phone}" required>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Role:</label>
                    <input type="text" id="role" name="role" class="form-control" value="${user.role}" required>
                </div>
                <button type="submit" class="btn btn-primary ms-2 m-2">Update User</button>
                <a href="ViewUsersServlet" class="btn btn-secondary ms-2 m-2">Cancel</a>
            </form>
        </c:if>
        <c:if test="${empty user}">
            <p class="text-center">User not found.</p>
        </c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</body>
</html>