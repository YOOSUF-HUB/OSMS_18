<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="UserPackage.UserModel" %>
<%@ page import="UserPackage.IUser" %>
<%-- <%
    request.setAttribute("requiredRole", "system admin");
%>
<%@ include file="loginAuthentication.jsp" %>


   
<%
        String name = loggedInUser.getName(); 
%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Register User</h1>
    <form action="../RegisterServlet" method="post" class="card p-4 shadow-sm" onsubmit="return validateForm()">
        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
            <div id="emailError" class="form-text text-danger"></div>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone:</label>
            <input type="tel" id="phone" name="phone" class="form-control" required>
            <div id="phoneError" class="form-text text-danger"></div>
        </div>
        <div class="mb-3">
            <label for="role" class="form-label">Role:</label>
            <select class="form-select" id="role" name="role" required>
                <option value="" disabled selected>Select Role</option>
                <option value="stock manager">Stock Manager</option>
                <option value="system admin">System Admin</option>
                <option value="system auditor">System Auditor</option>
                <option value="sales representative">Sales Representative</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script>
    function validateForm() {
        const emailInput = document.getElementById('email');
        const phoneInput = document.getElementById('phone');
        const emailError = document.getElementById('emailError');
        const phoneError = document.getElementById('phoneError');
        let isValid = true;

        // Email validation
        if (!emailInput.value.includes('@')) {
            emailError.textContent = 'Email must contain "@" character.';
            isValid = false;
        } else {
            emailError.textContent = '';
        }

        // Phone validation
        const phoneValue = phoneInput.value.trim();
        if (!phoneValue.startsWith('0') || phoneValue.length !== 10 || !/^\d+$/.test(phoneValue)) {
            phoneError.textContent = 'Phone number must start with "0" and have 10 digits.';
            isValid = false;
        } else {
            phoneError.textContent = '';
        }

        

        return isValid;
    }
</script>
</body>
</html>