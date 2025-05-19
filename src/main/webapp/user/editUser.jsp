<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "UserPackage.UserModel" %>
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
    <style>
        .error-message {
            color: red;
            font-size: 0.8em;
            margin-top: 0.2em;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Edit User</h1>
        <c:if test="${not empty user}">
            <form action="UpdateUserServlet" method="post" class="card p-4 shadow-sm" onsubmit="return validateForm()">
                <input type="hidden" name="id" value="${user.id}">
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" value="${user.name}" required>
                    <div id="nameError" class="error-message"></div>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" value="${user.email}" required>
                    <div id="emailError" class="error-message"></div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Leave blank to keep current password" onkeyup="validatePassword()">
                    <small class="form-text text-muted">Leave the password field blank if you don't want to change it.</small>
                    <div id="passwordError" class="error-message"></div>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm new password" onkeyup="validatePassword()">
                    <div id="confirmPasswordError" class="error-message"></div>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone:</label>
                    <input type="tel" id="phone" name="phone" class="form-control" value="${user.phone}" required>
                    <div id="phoneError" class="error-message"></div>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Role:</label>
                    <input type="text" id="role" name="role" class="form-control" value="${user.role}" required>
                    <div id="roleError" class="error-message"></div>
                </div>
                <button type="submit" class="btn btn-primary ms-2 m-2">Update User</button>
                <a href="ViewUsersServlet" class="btn btn-secondary ms-2 m-2">Cancel</a>
            </form>
        </c:if>
        <c:if test="${empty user}">
            <p class="text-center">User not found.</p>
        </c:if>
    </div>
    <script>
        function validateForm() {
            let isValid = true;
            isValid = isValid && validateName();
            isValid = isValid && validateEmail();
            isValid = isValid && validatePassword();
            isValid = isValid && validatePhone();
            isValid = isValid && validateRole();
            return isValid;
        }

        function validateName() {
            const nameInput = document.getElementById('name');
            const nameError = document.getElementById('nameError');
            if (nameInput.value.trim() === "") {
                nameError.textContent = "Name is required.";
                return false;
            } else {
                nameError.textContent = "";
                return true;
            }
        }

        function validateEmail() {
            const emailInput = document.getElementById('email');
            const emailError = document.getElementById('emailError');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(emailInput.value)) {
                emailError.textContent = "Invalid email format.";
                return false;
            } else {
                emailError.textContent = "";
                return true;
            }
        }

        function validatePassword() {
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('confirmPassword');
            const passwordError = document.getElementById('passwordError');
            const confirmPasswordError = document.getElementById('confirmPasswordError');

            passwordError.textContent = ""; // Clear any previous password error
            confirmPasswordError.textContent = ""; // Clear any previous confirm password error

            if (passwordInput.value.trim() !== "") {
                if (confirmPasswordInput.value.trim() === "") {
                    confirmPasswordError.textContent = "Confirm password is required if you enter a new password.";
                    return false;
                } else if (passwordInput.value !== confirmPasswordInput.value) {
                    confirmPasswordError.textContent = "Passwords do not match.";
                    return false;
                }
            }
            return true;
        }

        function validatePhone() {
            const phoneInput = document.getElementById('phone');
            const phoneError = document.getElementById('phoneError');
            const phoneRegex = /^[0-9]{10}$/; // Basic 10-digit phone number validation
            if (!phoneRegex.test(phoneInput.value)) {
                phoneError.textContent = "Invalid phone number format (10 digits required).";
                return false;
            } else {
                phoneError.textContent = "";
                return true;
            }
        }

        function validateRole() {
            const roleInput = document.getElementById('role');
            const roleError = document.getElementById('roleError');
            if (roleInput.value.trim() === "") {
                roleError.textContent = "Role is required.";
                return false;
            } else {
                roleError.textContent = "";
                return true;
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</body>
</html>