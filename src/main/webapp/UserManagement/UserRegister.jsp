<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up Form</title>
  <!-- Bootstrap 5.3.3 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script>
    // JavaScript function to validate password and confirm password
    function validatePassword() {
      var password = document.getElementById("user_password").value;
      var confirmPassword = document.getElementById("confirm_password").value;

      // Check if the passwords match
      if (password !== confirmPassword) {
        document.getElementById("passwordError").style.display = "block";
        return false;
      } else {
        document.getElementById("passwordError").style.display = "none";
        return true;
      }
    }
  </script>
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">

  <div class="card shadow-lg p-4 rounded-4" style="max-width: 450px; width: 100%;">
    <h2 class="text-center text-primary mb-4">Create Your Account</h2>
    <form onsubmit="return validatePassword()" action="../UserInsertServlet" method="post">
      
      <!-- Full Name -->
      <div class="mb-4">
        <label for="user_name" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="user_name" name="user_name" required>
      </div>

      <!-- Email Address -->
      <div class="mb-4">
        <label for="user_email" class="form-label">Email Address</label>
        <input type="email" class="form-control" id="user_email" name="user_email" required>
        <%
            String regStatus = (String) request.getAttribute("regStatus");
            if ("duplicate".equals(regStatus)) {
        %>
            <div class="text-danger mt-1">Email already exists. Please use a different one.</div>
        <%
            }
        %>
      </div>

      <!-- Password -->
      <div class="mb-4">
        <label for="user_password" class="form-label">Password</label>
        <input type="password" class="form-control" id="user_password" name="user_password" required>
      </div>

      <!-- Confirm Password -->
      <div class="mb-4">
        <label for="confirm_password" class="form-label">Confirm Password</label>
        <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
        <div id="passwordError" class="text-danger" style="display: none;">Passwords do not match.</div>
      </div>

      <!-- Phone Number -->
      <div class="mb-4">
        <label for="user_phone" class="form-label">Phone Number</label>
        <input type="text" class="form-control" id="user_phone" name="user_phone" required>
      </div>

      <!-- Address -->
      <div class="mb-4">
        <label for="user_address" class="form-label">Address</label>
        <input type="text" class="form-control" id="user_address" name="user_address" required>
      </div>

      <!-- Terms and Conditions -->
      <div class="mb-4 form-check">
        <input type="checkbox" class="form-check-input" id="termsCheck" required>
        <label class="form-check-label" for="termsCheck">Agree to Terms and Conditions</label>
      </div>

      <!-- Submit Button -->
      <button type="submit" class="btn btn-primary w-100">Sign Up</button>
    </form>

    <!-- Already Have an Account Link -->
    <div class="text-center mt-3">
      <p>Already have an account? <a href="../UserManagement/Login.jsp" class="text-primary">Login here</a></p>
    </div>

  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
