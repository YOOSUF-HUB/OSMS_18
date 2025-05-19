<%-- <%@ page import="java.util.List" %>
<%@ page import="ReportPackage.ReportModel" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="StockOrderManagement.StockOrderModel" %>
<%@ page import="StockOrderManagement.StockOrderControl" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="onlineStockManagement.DBconnection" %>
<%@ page import = "UserPackage.UserModel" %>

<%
    
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return; 
    }

	    
    UserModel loggedInUser = (UserModel) session.getAttribute("user");
    if (!"sales representative".equals(loggedInUser.getRole()) && !"stock manager".equals(loggedInUser.getRole()) && !"system admin".equals(loggedInUser.getRole()) && !"system auditor".equals(loggedInUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/Homepage.jsp");
        return; 
    }
%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%> --%>

<%@ page import="UserPackage.UserModel" %>

<%
    String requiredRole = (String) request.getAttribute("requiredRole");

    UserModel loggedInUser = (UserModel) session.getAttribute("user");

    if (loggedInUser == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return;
    }

    if (requiredRole != null && !requiredRole.equals(loggedInUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>