<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setAttribute("requiredRole", "stock manager");
%>
<%@ include file="../user/loginAuthentication.jsp" %>


   
<%
        String name = loggedInUser.getName(); 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Stock Error</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f8d7da;
    color: #721c24;
    padding: 40px;
    text-align: center;
  }
  .error-message {
    border: 1px solid #f5c6cb;
    background-color: #f8d7da;
    padding: 20px;
    border-radius: 8px;
    display: inline-block;
    font-size: 1.2rem;
    margin-bottom: 20px;
  }
  .btn-back {
    background-color: #721c24;
    color: white;
    border: none;
    padding: 10px 18px;
    border-radius: 6px;
    font-size: 1rem;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
  }
  .btn-back:hover {
    background-color: #501217;
  }
</style>
</head>
<body>
  <div class="error-message">
    Cannot delete Stock because the Stock is being used elsewhere.
  </div>
  <a href="GetAllStockServlet" class="btn-back">Back to Supplier View</a>
</body>
</html>
